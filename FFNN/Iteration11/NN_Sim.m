%% Import Neural Network
net = importNetworkFromONNX("SteeringModel_Iteration11.onnx", "InputDataFormats", "BC");

%% Read in the AIW Data and Interpolate it, get curvature (kappa)
AIW_Table = readtable('+PostProcessing\+CTE\Arrow.csv');

nPoints  = 10000;
interpMethod = 'spline';

AIW_Data = [AIW_Table.x, AIW_Table.y];
dBetweenPoints = (sqrt(diff(AIW_Data(:,1)).^2 + diff(AIW_Data(:,2)).^2));
rollingDistance = [0; cumsum(dBetweenPoints)];
dNew = (linspace(0, rollingDistance(end), nPoints))';
xInterp = interp1(rollingDistance, AIW_Data(:,1), dNew, interpMethod);
yInterp = interp1(rollingDistance, AIW_Data(:,2), dNew, interpMethod);
AIW_Data = [xInterp, yInterp];

% Get the curvature, kappa
[kappa, ~] = PostProcessing.PE.fnCalculateCurvature(AIW_Data);

%% Import Reference Run

matFilePath = 'D:\Users\Saian\Workspace\Data\+ProcessedData\2024\FYP12_09\2024_FYP12_09_D4_R02.mat';
lap = 12;



% matFilePath = 'D:\Users\Saian\Workspace\Data\+ProcessedData\2024\FYP12_23\2024_FYP12_23_D1_R01.mat';
% lap = 0;

% Read in a run .mat file
load(matFilePath);

% Get the runID
runID = runStruct.metadata.runID;

% Read in CTE layers if they exist
PEmatFilePath = strrep(matFilePath, '.mat', '_PE.mat');

if isfile(PEmatFilePath)

    % Load the CTE layer
    load(PEmatFilePath)

    % Join CTE layer to the data for the run
    runStruct.data = addvars(runStruct.data, dataPE.CTE, 'NewVariableNames', 'CTE');
    runStruct.data = addvars(runStruct.data, dataPE.closestWaypointX, 'NewVariableNames', 'closestWaypointX');
    runStruct.data = addvars(runStruct.data, dataPE.closestWaypointY, 'NewVariableNames', 'closestWaypointY');
    runStruct.data = addvars(runStruct.data, dataPE.HeadingError, 'NewVariableNames', 'HeadingError');


end

% Read in VE layers if they exist
VEmatFilePath = strrep(matFilePath, '.mat', '_VE.mat');

if isfile(VEmatFilePath)

    % Load the CTE layer
    load(VEmatFilePath)

    % Join CTE layer to the data for the run
    runStruct.data = addvars(runStruct.data, dataVE.vError, 'NewVariableNames', 'vError');
    runStruct.data = addvars(runStruct.data, dataVE.refVel, 'NewVariableNames', 'refVel');
    runStruct.data = addvars(runStruct.data, dataVE.rCurvature, 'NewVariableNames', 'rCurvature');


end

% Read in ProMoD layers if they exist
ProMoDmatFilePath = strrep(matFilePath, '.mat', '_ProMoD.mat');

if isfile(ProMoDmatFilePath)

    % Load the CTE layer
    load(ProMoDmatFilePath)

    % Join CTE layer to the data for the run
    runStruct.data = addvars(runStruct.data, dataProMoD.MSteer, 'NewVariableNames', 'MSteer');

end

% filter by lap
runStruct.data = runStruct.data(runStruct.data.lapNumber == lap, :);

%% Run the sim
NN_Sim_Data = [runStruct.data.time - runStruct.data.time(1)];

for i = 1:size(runStruct.data, 1)

    CTE = runStruct.data.CTE(i);
    dCTEcol = [0; diff(runStruct.data.CTE)];
    dCTE = dCTEcol(i);
    curvature = 1./runStruct.data.rCurvature(i);
    curvatureCol = 1./runStruct.data.rCurvature;
    dCuravtureCol = [0; diff(1./runStruct.data.rCurvature)];
    dCurvature = dCuravtureCol(i);
    HeadingError = runStruct.data.HeadingError(i);

    lookAheadKappa = zeros([size(data_i, 1), 5]);

    xV = runStruct.data.posX(i);
    yV = runStruct.data.posY(i);
    % Find nearest AIW waypoint using Euclidean distance
    d = sqrt((AIW_Data(:,1) - xV).^2 + (AIW_Data(:,2) -yV).^2);
    [minDist, closestWaypointIdx] = min(d);

    % Look Ahead in Kappa
    lookAhead_i = Utilities.fnGetLookAheadValues(kappa, closestWaypointIdx, 100, 5);

    input_i = [CTE, dCTE, curvature, dCurvature, HeadingError, lookAhead_i];

    steeringOutput_i = predict(net, input_i);

    % Populate the array
    NN_Sim_Data(i,2:11) = input_i;
    NN_Sim_Data(i,12) = steeringOutput_i;

end

%% Plotting results
figure;
% subplot(5,1,1)
plot(NN_Sim_Data(:,1), runStruct.data.steerAngle)
hold on
plot(NN_Sim_Data(:,1), NN_Sim_Data(:,12))
xlabel('Time (s)')
ylabel('steerAngle')
grid;
grid minor;
