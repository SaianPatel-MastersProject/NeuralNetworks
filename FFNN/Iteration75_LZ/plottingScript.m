%% Plotting Script - Iteration 75

obj = Plotting.multiPlotter();

% Add training run
obj = obj.addRun('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP03_31\2025_FYP03_31_D5_R05.mat', true, [2:20]); % LZ
obj = obj.addRun('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP04_07\2025_FYP04_07_D1_R01.mat', true, [2:4]); % SM75_LZ



% Add reference lap
obj = obj.addLap('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP03_31\2025_FYP03_31_D5_R05.mat', 20); % LZ
obj = obj.addLap('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP04_07\2025_FYP04_07_D1_R01.mat', 4); % SM75_LZ


%%%%%%%% Plotting Commands
%% Set plot colours
% Human as blue
% FFNN as red
obj = obj.addLapsColours({'#0077FF', '#FF0000'});
%% Plot the racing line
obj.plotRacingLine(true);
obj.plotLineDistributionPerCorner(1, true, [2])

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
obj.plotPSpectrum('CTE', 'Run')

%% Plot Violins
obj.plotRunViolins();
obj.plotGroupedMetrics();

%% Plot TF Estimate
obj.plotTF('CTE', 'steerAngle', 'Lap', false);
obj.plotTF('kappa', 'steerAngle', 'Lap', false);

%% Create averages tables
avgMetricsCTE(1,:) = mean(obj.runData(1).metricsCTE,1);
avgMetricsCTE(2,:) = mean(obj.runData(2).metricsCTE,1);


avgMetricsSteer(1,:) = mean(obj.runData(1).metricsSteer,1);
avgMetricsSteer(2,:) = mean(obj.runData(2).metricsSteer,1);