%% Runs and Laps
runsLaps = {
    'D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP02_03\2025_FYP02_03_D1_R02.mat', [], 'SUZ'; ... % SUZ_SP
};

%% Read in each run data
data = struct('runID', '', 'runData', table);

%%

for i = 1:size(runsLaps, 1)

    matFilePath = runsLaps{i,1};

     % Read in a run .mat file
     load(matFilePath);

     % Get the runID
     runID = runStruct.metadata.runID;

     % Load Associated Layers
     runStruct = Utilities.fnLoadLayer(runStruct, 'PE');
     runStruct = Utilities.fnLoadLayer(runStruct, 'KAP');

     % Get the final lap number
     finalLapNumber = runStruct.metadata.laps(size(runStruct.metadata.laps,2)).lapNumber;

     % Only keep flying laps (and exclude L1)
     runData = runStruct.data(runStruct.data.lapNumber > 1, :);
     runData = runData(runData.lapNumber < runData.lapNumber(end), :);

     % Exclude specified laps
     if ~isempty(runsLaps{i,2})

         runData = runData(runData.lapNumber ~= runsLaps{i,2}, :);


     end

     % Check current number of entries in the struct
     nEntries = size(data, 2);

     if isempty(data(1).runID)

         j = 1;

     else

         j = nEntries + 1;

     end

     % Populate the struct
     data(j).runID = runID;
     data(j).runData = runData;


end

%% Join the data as an array
dataArray = [];

for i = 1:size(data, 2)

    AIW_Table = Utilities.fnLoadAIW(runsLaps{i,3});
    AIW_Data = [AIW_Table.x, AIW_Table.y];

    % Get the curvature, kappa
    [kappa, ~] = PostProcessing.PE.fnCalculateCurvature([AIW_Table.x, AIW_Table.y]);


    spacing = 0.1;
    method = 'spline';

    xInterp = Utilities.fnInterpolateByDist(AIW_Data, AIW_Table.x, spacing, method);
    yInterp = Utilities.fnInterpolateByDist(AIW_Data, AIW_Table.y, spacing, method);
    kappaInterp = Utilities.fnInterpolateByDist(AIW_Data, kappa, spacing, method);

    AIW_Data = [xInterp, yInterp];

    % Get look-ahead sigmoid
    [dLookOverall, kappaSorted] = Utilities.fnLookAheadDistanceSigmoidCurvature(6, 30, 200, 0.01, kappaInterp);


    data_i = data(i).runData;

    curvatureCol = data_i.kappa;

    % Get spatial derivative of curvature which is /m^2
    % i.e. d(curvature) / (speed * dt)
    dCurvatureCol = [0; diff(curvatureCol) ./ (40*0.01)];

    lookAheadKappa_0 = zeros([size(data_i, 1), 1]);
    lookAheadKappa = zeros([size(data_i, 1), 1]);

    dLookAhead_0 = 3;
    iLookAhead_0 = dLookAhead_0/0.1;

    projectedCTE = zeros([size(data_i, 1), 1]);
    dX = diff(data_i.posX);
    dY = diff(data_i.posY);
    psi = atan2(dY, dX);
    psi = [psi; psi(end)];


    for j = 1:size(data_i, 1)

        xV = data_i.posX(j);
        yV = data_i.posY(j);
        
        % Find nearest AIW waypoint using Euclidean distance
        d = sqrt((AIW_Data(:,1) - xV).^2 + (AIW_Data(:,2) -yV).^2);
        [minDist, closestWaypointIdx] = min(d);

        dLookAhead = interp1(kappaSorted, dLookOverall, abs(curvatureCol(j)));
        iLookAhead = round(dLookAhead/0.1);

        % Look Ahead in Kappa
        lookAhead_0 = Utilities.fnGetLookAheadValues(kappaInterp, closestWaypointIdx, iLookAhead_0, 1);

        % Append to array
        lookAheadKappa_0(j, :) = lookAhead_0;

        % Look Ahead in Kappa
        lookAhead_i = Utilities.fnGetLookAheadValues(kappaInterp, closestWaypointIdx, iLookAhead, 1);

        % Append to array
        lookAheadKappa(j, :) = lookAhead_i;

        % Calculate currentPose and calculate projected CTE
        [projectedCTE_j, ~, ~, ~, ~] = PostProcessing.PE.fnCalculateProjectedPathError([xV, yV, psi(j)], AIW_Data, dLookAhead);

        projectedCTE(j,1) = projectedCTE_j;
        


    end

    

    dataArray_i = [data_i.CTE, lookAheadKappa_0, data_i.HeadingError, lookAheadKappa, projectedCTE, data_i.steerAngle ];
    
    if i == 1

        dataArray = dataArray_i;

    else

        dataArray = [dataArray; dataArray_i];

    end

end
%% Join the data into a single table

columnNames = {
    'CTE';
    'curvature';
    'HeadingError';
    'lookAhead1';
    'projectedCTE';
    'steerAngle';
};


trainingData = array2table(dataArray, 'VariableNames',columnNames);

%% Normalise the inputs
trainingDataNorm = minMaxNormalize(trainingData(:, 1:5));
trainingDataNorm = [trainingDataNorm, trainingData(:,6)];

%% Standardise the inputs
stanArray = zeros([2, length(columnNames)-1,]);
trainingDataStand = trainingData;

for i = 1:length(columnNames)-1

    stanArray(1,i) = mean(trainingData.(columnNames{i}));
    stanArray(2,i) = std(trainingData.(columnNames{i}));

    trainingDataStand(:, i) = (trainingData(:,i) - stanArray(1,i)) ./ (stanArray(2,i));

end

stanTable = array2table(stanArray, 'VariableNames', columnNames(1:end-1));

% trainingDataStand(:, 5) = minMaxNormalize(trainingDataStand(:,5));
%% Export to CSV

writetable(trainingData, 'TrainingData.csv');
writetable(trainingDataNorm, 'TrainingDataNorm.csv');
writetable(trainingDataStand, 'TrainingDataStand.csv');

%% View Input Space
plotInputSpace(trainingDataStand, [1:6]);

%% Get the min and max of each input col
minMaxArray = zeros([2, length(columnNames)-1,]);

for i = 1:length(columnNames)-1

    minMaxArray(1,i) = min(trainingData.(columnNames{i}));
    minMaxArray(2,i) = max(trainingData.(columnNames{i}));

end

minMaxTable = array2table(minMaxArray, 'VariableNames', columnNames(1:end-1));