%% Runs and Laps
runsLaps = {
    'D:\Users\Saian\Workspace\Data\+ProcessedData\2024\FYP12_09\2024_FYP12_09_D4_R02.mat';
};

%% Read in each run data
data = struct('runID', '', 'lapData', table);

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

    rLookAhead = [];
    nLookAhead = 5;
    kLookAhead = 100;
    iLookAhead = [];
    for j = 1:size(data_i,1)
        for k = 1:nLookAhead
            if j + k * kLookAhead <= size(data_i,1)
                rLookAhead(j,k) = curvatureCol(j+k*kLookAhead);
                iLookAhead(j,k) = j+k*kLookAhead;
            else
                % Difference between current point and end
                pointsToEnd = size(data_i,1) - j;
                rLookAhead(j,k) = curvatureCol(k*(kLookAhead)-pointsToEnd);
                iLookAhead(j,k) = k*(kLookAhead)-pointsToEnd;
            end
        end
    end


    dataArray_i = [data_i.CTE, ([0; diff(data_i.CTE)]), curvatureCol, ([0; diff(curvatureCol)]), data_i.HeadingError, rLookAhead, data_i.steerAngle ];
    
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
    'dCurvature';
    'HeadingError';
    'lookAhead1';
    'lookAhead2';
    'lookAhead3';
    'lookAhead4';
    'lookAhead5';
    'steerAngle';
};


trainingData = array2table(dataArray, 'VariableNames',columnNames);

%% Export to CSV

writetable(trainingData, 'TrainingData.csv');