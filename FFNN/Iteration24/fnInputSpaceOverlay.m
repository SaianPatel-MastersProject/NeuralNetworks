%% Function to overlay run data with training data
function fnInputSpaceOverlay(trainingData, runData, xChannel, yChannel)

    % Get the training data x and y
    xTrain = trainingData.(xChannel);
    yTrain = trainingData.(yChannel);

    % Get the training data x and y
    xRun = runData.(xChannel);
    yRun = runData.(yChannel);

    % Create the figure
    figure;
    hold on
    scatter(xTrain, yTrain,'SizeData', 36);
    scatter(xRun, yRun, 'SizeData', 16);




end