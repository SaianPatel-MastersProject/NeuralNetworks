%% Runs and Laps
runsLaps = {
    'D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP02_03\2025_FYP02_03_D1_R02.mat';
};

%% Read in each run data
data = struct('runID', '', 'lapData', table);

%% Read in the AIW Data and Interpolate it, get curvature (kappa)
AIW_Table = readtable('+PostProcessing\+CTE\2kF_SUZE9.csv');

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

     % Only keep flying laps
     runData = runStruct.data(runStruct.data.lapNumber > 1, :);
     runData = runData(runData.lapNumber < 32, :);

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

    data_i = data(i).runData;

    curvatureCol = data_i.kappa;

    lookAheadKappa = zeros([size(data_i, 1), 5]);

    for j = 1:size(data_i, 1)

        xV = data_i.posX(j);
        yV = data_i.posY(j);
        % Find nearest AIW waypoint using Euclidean distance
        d = sqrt((AIW_Data(:,1) - xV).^2 + (AIW_Data(:,2) -yV).^2);
        [minDist, closestWaypointIdx] = min(d);


    end

    dataArray_i = [data_i.CTE, curvatureCol, data_i.HeadingError, data_i.steerAngle ];
    
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
    'steerAngle';
};


trainingData = array2table(dataArray, 'VariableNames',columnNames);

%% Export to CSV

writetable(trainingData, 'TrainingData.csv');

%% View Input Space
plotInputSpace(trainingData, [1:3]);