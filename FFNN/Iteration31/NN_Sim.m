%% Import Neural Network
net = importNetworkFromONNX("SteeringModel_Iteration31.onnx", "InputDataFormats", "BC");

%% Read in the AIW Data and Interpolate it, get curvature (kappa)
AIW_Table = readtable('+PostProcessing\+CTE\Arrow_IP.csv');

% Get the curvature, kappa
[kappa, ~] = PostProcessing.PE.fnCalculateCurvature([AIW_Table.x, AIW_Table.y]);

nPoints  = 10000;
interpMethod = 'spline';

AIW_Data = [AIW_Table.x, AIW_Table.y];
dBetweenPoints = (sqrt(diff(AIW_Data(:,1)).^2 + diff(AIW_Data(:,2)).^2));
rollingDistance = [0; cumsum(dBetweenPoints)];
dNew = (linspace(0, rollingDistance(end), nPoints))';
xInterp = interp1(rollingDistance, AIW_Data(:,1), dNew, interpMethod);
yInterp = interp1(rollingDistance, AIW_Data(:,2), dNew, interpMethod);
kappaInterp = interp1(rollingDistance, kappa, dNew, interpMethod);
AIW_Data = [xInterp, yInterp];

%% Import Reference Run

matFilePath = 'D:\Users\Saian\Workspace\Data\+ProcessedData\2024\FYP12_09\2024_FYP12_09_D4_R17.mat';
lap = 12;

% Read in a run .mat file
load(matFilePath);

% Get the runID
runID = runStruct.metadata.runID;

% Load Associated Layers
runStruct = Utilities.fnLoadLayer(runStruct, 'PE');
runStruct = Utilities.fnLoadLayer(runStruct, 'KAP');

% filter by lap
runStruct.data = runStruct.data(runStruct.data.lapNumber == lap, :);

%% Run the sim
NN_Sim_Data = [runStruct.data.time - runStruct.data.time(1)];

for i = 1:size(runStruct.data, 1)

    CTE = runStruct.data.CTE(i);
    curvature = runStruct.data.kappa(i);
    HeadingError = runStruct.data.HeadingError(i);

    xV = runStruct.data.posX(i);
    yV = runStruct.data.posY(i);
    % Find nearest AIW waypoint using Euclidean distance
    d = sqrt((AIW_Data(:,1) - xV).^2 + (AIW_Data(:,2) -yV).^2);
    [minDist, closestWaypointIdx] = min(d);

    % Look Ahead in Kappa
    lookAhead_i = Utilities.fnGetLookAheadValues(kappaInterp, closestWaypointIdx, 200, 5);

    input_i = [CTE,curvature, HeadingError, lookAhead_i];

    steeringOutput_i = predict(net, input_i);

    % Populate the array
    NN_Sim_Data(i,2:9) = input_i;
    NN_Sim_Data(i,10) = steeringOutput_i;

end

%% Plotting results
figure;
% subplot(5,1,1)
plot(NN_Sim_Data(:,1), runStruct.data.steerAngle)
hold on
plot(NN_Sim_Data(:,1), NN_Sim_Data(:,10))
xlabel('Time (s)')
ylabel('steerAngle')
grid;
grid minor;
