%% Plotting Script - Iteration 75

obj = Plotting.multiPlotter();

% Add training run
obj = obj.addRun('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP02_03\2025_FYP02_03_D1_R02.mat', true, [2:31]); % SP
obj = obj.addRun('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP04_07\2025_FYP04_07_D2_R05.mat', true, [2:4]); % SM75_SP_b - [16, 8, 1]
obj = obj.addRun('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP04_07\2025_FYP04_07_D2_R01.mat', true, [2:4]); % SM75_SP - [64, 32, 1]
obj = obj.addRun('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP04_07\2025_FYP04_07_D3_R01.mat', true, [2:4]); % SM75_SP_c - [64, 32, 16, 1]




% Add reference lap
obj = obj.addLap('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP02_03\2025_FYP02_03_D1_R02.mat', 31); % SP
obj = obj.addLap('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP04_07\2025_FYP04_07_D2_R05.mat', 4); % SM75_SP_b - [16, 8, 1]
obj = obj.addLap('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP04_07\2025_FYP04_07_D2_R01.mat', 4); % SM75_SP - [64, 32, 1]
obj = obj.addLap('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP04_07\2025_FYP04_07_D3_R01.mat', 4); % SM75_SP_c - [64, 32, 16, 1]

% Overwrite the legend cell
obj.plottingTools.legendCell = {'SP', '[16, 8, 1]', '[64, 32, 1]', '[64, 32, 16, 1]'};


%%%%%%%% Plotting Commands
%% Set plot colours
% Human as blue
% FFNN as red
obj = obj.addLapsColours({'#0077FF', '#FF0000', '#4CBB17', '#FFDE21'});
%% Plot the racing line
obj.plotRacingLine(true);
obj.plotLineDistributionPerCorner(1, true, [2,3,4])

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
xlim([0, 5])
obj.plotPSpectrum('CTE', 'Run')
xlim([0, 5])

%% Plot Violins
obj.plotRunViolins();
obj.plotGroupedMetrics();

%% Plot TF Estimate
obj.plotTF('CTE', 'steerAngle', 'Lap', false);
obj.plotTF('kappa', 'steerAngle', 'Lap', false);

%% Create averages tables
avgMetricsCTE(1,:) = mean(obj.runData(1).metricsCTE,1);
avgMetricsCTE(2,:) = mean(obj.runData(2).metricsCTE,1);
avgMetricsCTE(3,:) = mean(obj.runData(3).metricsCTE,1);
avgMetricsCTE(4,:) = mean(obj.runData(4).metricsCTE,1);


avgMetricsSteer(1,:) = mean(obj.runData(1).metricsSteer,1);
avgMetricsSteer(2,:) = mean(obj.runData(2).metricsSteer,1);
avgMetricsSteer(3,:) = mean(obj.runData(3).metricsSteer,1);
avgMetricsSteer(4,:) = mean(obj.runData(4).metricsSteer,1);