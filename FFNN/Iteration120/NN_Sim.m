%% Import Neural Network
net = importNetworkFromONNX("SteeringModel_Iteration120.onnx", "InputDataFormats", "BC");

%%
trainingData_Sim = readtable('TrainingData.csv', 'VariableNamingRule','preserve');

columnNames = {
    'CTE';
    'curvature';
    'HeadingError';
    'lookAhead1';
    'lookAhead2';
    'lookAhead3';
    'lookAhead4';
    'lookAhead5';
    'prevSteering';
    'prevYawRate';
    'projectedCTE';
    'lookAheadHE';
    'steerAngle';
};

minMaxArray = [];
stanArray = [];

for i = 1:length(columnNames)-1

    minMaxArray(1,i) = min(trainingData_Sim.(columnNames{i}));
    minMaxArray(2,i) = max(trainingData_Sim.(columnNames{i}));
    stanArray(1,i) = mean(trainingData_Sim.(columnNames{i}));
    stanArray(2,i) = std(trainingData_Sim.(columnNames{i}));

end

%% Read in the AIW Data and Interpolate it, get curvature (kappa)
% AIW_Table = readtable('+PostProcessing\+CTE\2kF_SUZE9.csv');
AIW_Table = Utilities.fnLoadAIW('SUZ');
% AIW_Table = Utilities.fnLoadAIW('INT');
% AIW_Table = Utilities.fnLoadAIW('BAR');
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
% [dLookOverall, kappaSorted] = Utilities.fnLookAheadDistanceSigmoidCurvature(6, 30, 200, 0.01, kappaInterp);
[dLookOverall, kappaSorted] = Utilities.fnLookAheadDistanceSigmoidCurvature(8, 60, 200, 0.02, kappaInterp);
%% Import Reference Run
% SUZ
matFilePath = 'D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP02_03\2025_FYP02_03_D1_R02.mat';
lap = 31;
% INT
% matFilePath = 'D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP03_24\2025_FYP03_24_D4_R06.mat';
% lap = 12;
% BAR
% matFilePath = 'D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP04_14\2025_FYP04_14_D7_R03.mat';
% lap = 10;
% matFilePath = 'D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP04_28\2025_FYP04_28_D7_R02.mat';
% lap = 11;
% matFilePath = 'D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP04_28\2025_FYP04_28_D7_R04.mat';
% lap = 11;

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

dCurvatureCol = [0; diff(runStruct.data.kappa) ./ (40*0.01)];

% Get HE and apply manual moving average
HE = runStruct.data.HeadingError;
HE_filt = HE;
nMA = 5;

for k = nMA:length(HE)

    HE_filt(k) = mean(HE(k-nMA+1:k));

end
% Get dHE
dHE = [0; diff(HE_filt)] ./ 0.01;


% Needed for LA HE
dX = diff(runStruct.data.posX);
dY = diff(runStruct.data.posY);
psi = atan2(dY, dX);
psi = [psi; psi(end)];


for i = 1:size(runStruct.data, 1)

    CTE = runStruct.data.CTE(i);
    curvature = runStruct.data.kappa(i);
    HeadingError = runStruct.data.HeadingError(i);

    xV = runStruct.data.posX(i);
    yV = runStruct.data.posY(i);
    thetaV = psi(i);
    currentPose = [xV, yV, thetaV];
    % Find nearest AIW waypoint using Euclidean distance
    d = sqrt((AIW_Data(:,1) - xV).^2 + (AIW_Data(:,2) -yV).^2);
    [minDist, closestWaypointIdx] = min(d);

    % Look Ahead in Kappa
    lookAhead_0 = Utilities.fnGetLookAheadValues(kappaInterp, closestWaypointIdx, 3/0.1, 1);

    dLookAhead = interp1(kappaSorted, dLookOverall, abs(curvature));
    iLookAhead = round(dLookAhead/0.1);

    % Look Ahead in Kappa
    lookAhead_i = Utilities.fnGetLookAheadValues(kappaInterp, closestWaypointIdx, 80, 5);
    % [projectedCTE, ~, lookAheadHE_i] = PostProcessing.PE.fnCalculatePathErrorLA(currentPose, AIW_Data, iLookAhead);
    [projectedCTE, ~, lookAheadHE_i, ~, ~] = PostProcessing.PE.fnCalculateProjectedPathError([xV, yV, thetaV], AIW_Data, dLookAhead);

    if i > 20

        prevSteering1 = runStruct.data.steerAngle(i-20);

    else

        prevSteering1 = 0;

    end

    input_i = [CTE, lookAhead_0, HeadingError, lookAhead_i, prevSteering1, prevSteering1*-1.5, projectedCTE, lookAheadHE_i];

    for j = 1:size(minMaxArray,2)

        % maxVal = minMaxArray(2, j);
        % minVal = minMaxArray(1, j);
        % input_i(1, j) = 2 * (input_i(j) - minVal)/(maxVal - minVal) - 1;
        input_i(1, j) = (input_i(j) - stanArray(1,j))/(stanArray(2,j));

    end

    steeringOutput_i = predict(net, input_i);

    % Populate the array
    NN_Sim_Data(i,2:13) = input_i;
    NN_Sim_Data(i,14) = steeringOutput_i;

end


%% Plotting results
figure;
% subplot(5,1,1)
plot(NN_Sim_Data(:,1), runStruct.data.steerAngle)
hold on
plot(NN_Sim_Data(:,1), NN_Sim_Data(:,14))
xlabel('Time (s)')
ylabel('steerAngle')
grid;
grid minor;
