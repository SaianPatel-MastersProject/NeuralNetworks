%% Plotting Script - Iteration 34

obj = Plotting.multiPlotter();

% Add training run
obj = obj.addRun('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP01_27\2025_FYP01_27_D2_R03.mat', true, []);
obj = obj.addRun('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP01_27\2025_FYP01_27_D2_R06.mat', true, []);

% Add reference lap
obj = obj.addLap('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP01_27\2025_FYP01_27_D2_R03.mat', 107); % Human
obj = obj.addLap('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP01_27\2025_FYP01_27_D2_R06.mat', 6); % FFNN 35

%%%%%%%% Plotting Commands

%% Plot the racing line
obj.plotRacingLine(true);

%% Plot steering angle with errors
obj.plotErrorsWithSteering();

%% Plot steering and its derivatives
obj.plotDerivativesSteeringAngle();

%% Plot variability relative to the human data
obj.plotEnvelope(1, 'CTE', true);
obj.plotEnvelope(1, 'HeadingError', true);
obj.plotEnvelope(1, 'steerAngle', true);

%% Plot variability relative of the FFNN
obj.plotEnvelope(2, 'CTE', false);
obj.plotEnvelope(2, 'HeadingError', false);
obj.plotEnvelope(2, 'steerAngle', false);

%% Plot PSPectrum
obj.plotPSpectrum('steerAngle', 'Run')

%% Plot Violins
obj.plotRunViolins();
obj.plotGroupedMetrics();

%% Plot TF
obj.plotTF('CTE', 'steerAngle', 'Lap');
obj.plotTF('kappa', 'steerAngle', 'Lap');