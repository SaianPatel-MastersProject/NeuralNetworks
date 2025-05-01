%%
X0 = table2array(trainingData_Sim(:, 1:4));
Y0 = table2array(trainingData_Sim(:, 1));

X = {};
Y = {};

for i = 4:numel(Y0)

    X{i} = [X0(i-3, :);
                X0(i-2, :);
                X0(i-1, :);
                X0(i, :);
    ];
    Y{i} = [Y0(i-3, 1);
                Y0(i-2, 1);
                Y0(i-1, 1);
                Y0(i, 1);
    ];

end
%%
numFeatures = 4;
numResponses = 1;
% --- Define network architecture
layers = [ ...
    sequenceInputLayer(numFeatures, 'Name', 'input')
    gruLayer(25, 'Name', 'gru')
    fullyConnectedLayer(500, 'Name', 'fc1')
    reluLayer('Name', 'relu1')
    fullyConnectedLayer(500, 'Name', 'fc2')
    reluLayer('Name', 'relu2')
    fullyConnectedLayer(1, 'Name', 'output')
    tanhLayer('Name', 'tanh')
    regressionLayer('Name', 'regressionOutput')];

% --- Training options
options = trainingOptions('adam', ...
    'MaxEpochs', 1, ...
    'MiniBatchSize', 1024, ...
    'SequenceLength', 'longest', ...
    'Shuffle', 'every-epoch', ...
    'Plots', 'training-progress', ...
    'Verbose', true);

%%
% --- Train the model
net = trainNetwork(X, Y, layers, options);

