%% Import Neural Network
net = importNetworkFromONNX("SteeringModel_Iteration48.onnx", "InputDataFormats", "BC");

%% Read in the AIW Data and Interpolate it, get curvature (kappa)
% AIW_Table = readtable('+PostProcessing\+CTE\2kF_SUZE9.csv');
AIW_Table = Utilities.fnLoadAIW('SUZ');
AIW_Data = [AIW_Table.x, AIW_Table.y];

% Get the curvature, kappa
[kappa, ~] = PostProcessing.PE.fnCalculateCurvature([AIW_Table.x, AIW_Table.y]);


spacing = 0.1;
method = 'spline';

xInterp = Utilities.fnInterpolateByDist(AIW_Data, AIW_Table.x, spacing, method);
yInterp = Utilities.fnInterpolateByDist(AIW_Data, AIW_Table.y, spacing, method);
kappaInterp = Utilities.fnInterpolateByDist(AIW_Data, kappa, spacing, method);

AIW_Data = [xInterp, yInterp];

%% Create Sigmoid for dLookAhead

% Get look-ahead sigmoid
[dLookOverall, kappaSorted] = Utilities.fnLookAheadDistanceSigmoidCurvature(10, 60, 200, 0.01, kappaInterp);

%% Import Reference Run

matFilePath = 'D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP02_03\2025_FYP02_03_D1_R02.mat';
lap = 31;

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
    lookAhead_0 = Utilities.fnGetLookAheadValues(kappaInterp, closestWaypointIdx, 3/0.1, 1);

    dLookAhead = interp1(kappaSorted, dLookOverall, abs(kappaInterp(closestWaypointIdx)));
    iLookAhead = round(dLookAhead/0.1);

    % Look Ahead in Kappa
    lookAhead_i = Utilities.fnGetLookAheadValues(kappaInterp, closestWaypointIdx, iLookAhead, 1);

    input_i = [CTE, lookAhead_0, HeadingError, lookAhead_i];

    steeringOutput_i = predict(net, input_i);

    % Populate the array
    NN_Sim_Data(i,2:5) = input_i;
    NN_Sim_Data(i,6) = steeringOutput_i;

end

%% Plotting results
figure;
% subplot(5,1,1)
plot(NN_Sim_Data(:,1), runStruct.data.steerAngle)
hold on
plot(NN_Sim_Data(:,1), NN_Sim_Data(:,6))
xlabel('Time (s)')
ylabel('steerAngle')
grid;
grid minor;
