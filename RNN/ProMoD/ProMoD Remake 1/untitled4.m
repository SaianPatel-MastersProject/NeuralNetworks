%%
% layers = [
%     sequenceInputLayer(4)             % Input layer (4 features)
%     gruLayer(25, 'OutputMode', 'last')  % GRU layer with 25 units, output last state
%     fullyConnectedLayer(500)          % Dense layer with 500 units
%     reluLayer                         % ReLU activation
%     fullyConnectedLayer(500)          % Another Dense layer
%     reluLayer                         % Another ReLU activation
%     fullyConnectedLayer(1)            % Output layer (steering angle)
%     regressionLayer                   % Loss function for regression (e.g., MSE)
% ];
layers = [
    inputLayer(4, )             % Input layer (4 features)
    fullyConnectedLayer(16)          % Dense layer with 500 units
    reluLayer                         % ReLU activation
    fullyConnectedLayer(8)          % Another Dense layer
    reluLayer                         % Another ReLU activation
    fullyConnectedLayer(1)            % Output layer (steering angle)
    regressionLayer                   % Loss function for regression (e.g., MSE)
];

%%
X = table2array(trainingData_Sim(:, 1:4));
Y = table2array(trainingData_Sim(:, 5));
trainX = (X(round(1: 0.8*numel(Y)), :))';
trainY = (Y(round(1: 0.8*numel(Y)), :))';
valX = (X(round(0.8*numel(Y))+1:end, :))';
valY = (Y(round(0.8*numel(Y))+1:end, :))';


%%

options = trainingOptions('adam', ...
    'MaxEpochs', 100, ...
    'MiniBatchSize', 32, ...
    'ValidationData', {valX, valY}, ...
    'Verbose', true, ...
    'Plots', 'training-progress');

%%

net = trainNetwork(trainX, trainY, layers, options);


%%
function [trainX, valX, trainY, valY] = splitData(X, Y, trainRatio)
    numTrain = floor(trainRatio * size(X, 3));
    trainX = X(:, :, 1:numTrain);
    valX = X(:, :, numTrain+1:end);
    trainY = Y(1:numTrain);
    valY = Y(numTrain+1:end);
end
