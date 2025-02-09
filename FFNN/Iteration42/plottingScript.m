%% Plotting Script - Iteration 34

obj = Plotting.multiPlotter();

% Add training run
obj = obj.addRun('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP02_03\2025_FYP02_03_D1_R02.mat', true, [2:31]);
obj = obj.addRun('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP02_03\2025_FYP02_03_D7_R02.mat', true, [1,2]);



% Add reference lap
obj = obj.addLap('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP02_03\2025_FYP02_03_D1_R02.mat', 31); % Human
obj = obj.addLap('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP02_03\2025_FYP02_03_D7_R02.mat', 2); % FFNN 42

%%%%%%%% Plotting Commands

%% Set plot colours
% Human as blue
% FFNN as red
obj = obj.addLapsColours({'#0077FF', '#FF0000'});

%% Plot the racing line
obj.plotRacingLine(true);
obj.plotLineDistributionPerCorner(1, true, [1,2]);

%% Plot steering angle with errors
obj.plotErrorsWithSteering();

%% Plot steering and its derivatives
obj.plotDerivativesSteeringAngle();

%% Plot PSPectrum
obj.plotPSpectrum('steerAngle', 'Run')

%% Plot variability relative to the human data
obj.plotEnvelope(1, 'CTE', true);
obj.plotEnvelope(1, 'HeadingError', true);
obj.plotEnvelope(1, 'steerAngle', true);

%% Plot variability relative of the FFNN
obj.plotEnvelope(2, 'CTE', false);
obj.plotEnvelope(2, 'HeadingError', false);
obj.plotEnvelope(2, 'steerAngle', false);

%% Plot Violins
obj.plotRunViolins();
obj.plotGroupedMetrics();

%% Plot TF Estimate
obj.plotTF('CTE', 'steerAngle', 'Lap');
obj.plotTF('kappa', 'steerAngle', 'Lap');