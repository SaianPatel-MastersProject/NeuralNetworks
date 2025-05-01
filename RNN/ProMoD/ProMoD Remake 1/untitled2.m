%%
net = importNetworkFromONNX("steering_model_3.onnx", "InputDataFormats", "BTC");

%%
% Your example input (4 timesteps, 4 features)
X = [ 0.3138, 0.0095, -0.4089, 0.0086;
      0.3004, 0.0095, -0.4088, 0.0086;
      0.2871, 0.0095, -0.4086, 0.0086;
      0.2738, 0.0095, -0.3288, 0.0086 ];  % [4 x 4]

% input = reshape(single(X), [4 4 1]);        % [T x C x B]
% dlX = dlarray(input, "BTC");               % Specify format
% 
% % ✅ Initialize the dlnetwork
% net = initialize(net, dlX);

% ✅ Now run prediction
output = predict(net, X);
