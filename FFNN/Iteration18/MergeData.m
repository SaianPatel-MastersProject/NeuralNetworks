%% Runs and Laps
runsLaps = {
    'D:\Users\Saian\Workspace\Data\+ProcessedData\2024\FYP12_09\2024_FYP12_09_D4_R02.mat';
};

%% Read in each run data
data = struct('runID', '', 'lapData', table);

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

%%

for i = 1:size(runsLaps, 1)

    matFilePath = runsLaps{i,1};

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

     % Get the final lap number
     finalLapNumber = runStruct.metadata.laps(size(runStruct.metadata.laps,2)).lapNumber;

     % Only keep flying laps
     runData = runStruct.data(runStruct.data.lapNumber > 0, :);
     runData = runData(runData.lapNumber < 14, :);

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

    curvatureCol = 1./data_i.rCurvature;


    dataArray_i = [data_i.CTE, [0; diff(data_i.CTE)], curvatureCol, data_i.HeadingError, data_i.steerAngle ];
    
    if i == 1

        dataArray = dataArray_i;

    else

        dataArray = [dataArray; dataArray_i];

    end

end
%% Join the data into a single table

columnNames = {
    'CTE';
    'dCTE';
    'curvature';
    'HeadingError';
    'steerAngle';
};


trainingData = array2table(dataArray, 'VariableNames',columnNames);

%% Export to CSV

writetable(trainingData, 'TrainingData.csv');