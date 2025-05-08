%% MATLAB RNN

% Read in training data
data = readtable("D:\Users\Saian\Workspace\NeuralNetworks\FFNN\Iteration121\TrainingDataStand.csv", "VariableNamingRule","preserve");
dataArray = table2array(data);

%% Prepare data

% Take sequence length
sequenceLength = 4;

for i = sequenceLength:size(data,1)

    XTrain{i-3,1} = dataArray(i-3:i, [1,2,3,4,5,6,7,8,11,12])';
    YTrain{i-3,1} = dataArray(i-3:i, end)';


end

%%
numFeatures = 10;     % e.g., number of driving features
numHiddenUnits = 100;
numResponses = 1;     % steering angle output

layers = [
    sequenceInputLayer(numFeatures)
    lstmLayer(numHiddenUnits, 'OutputMode', 'sequence')  % or 'last' for final timestep only
    fullyConnectedLayer(1, 'Name', 'fc')
    tanhLayer('Name', 'tanh')   % Custom activation layer
    regressionLayer

];

%%

options = trainingOptions('adam', ...
    'MaxEpochs', 50, ...
    'MiniBatchSize', 1024, ...
    'GradientThreshold', 1, ...
    'InitialLearnRate', 1e-3, ...
    'Shuffle', 'every-epoch', ...
    'Plots', 'training-progress', ...
    'Verbose', false);

%%
net = trainNetwork(XTrain, YTrain, layers, options);

%%
XTest = XTrain(1:12000);
YPred = {};
YTest = [];
YPredFinal = [];
for i = 1:12000

    YPred{i} = predict(net, XTest(i));  % XTest is a cell array of sequences
    YTest_i = YTrain(i);
    YTest_i = YTest_i{1};
    YTest(i,1) = YTest_i(4);
    YPredFinal = YPred{i};
    YPredFinal = YPredFinal{1};
    YPredFinalArray(i,1) = YPredFinal(4);

end

%%
figure;
plot(YTest)
hold on
plot(YPredFinalArray)