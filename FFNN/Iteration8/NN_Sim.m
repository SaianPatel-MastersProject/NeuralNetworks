%% Import Neural Network
net = importNetworkFromONNX("SteeringModel_Iteration8.onnx", "InputDataFormats", "BC");

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
    rLookAhead = [];
    nLookAhead = 5;
    for k = 1:nLookAhead
        if i + k <= size(runStruct.data,1)
            rLookAhead(1,k) = curvatureCol(i+k);
        else
            rLookAhead(1,k) = curvatureCol(k);
        end
    end


    input_i = [CTE, dCTE, curvature, dCurvature, HeadingError, rLookAhead];

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
