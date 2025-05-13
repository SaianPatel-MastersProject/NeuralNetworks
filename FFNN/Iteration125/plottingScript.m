%% Load
obj = Plotting.multiPlotter();

% Add training run
obj = obj.addRun('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP04_28\2025_FYP04_28_D7_R02.mat', true, [2:10]); % SP k=-1.425
obj = obj.addRun('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP05_05\2025_FYP05_05_D4_R04.mat', true, [2:4]); % SM123
obj = obj.addRun('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP05_05\2025_FYP05_05_D4_R07.mat', true, [2:4]); % SM125



% Add reference lap
obj = obj.addLap('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP04_28\2025_FYP04_28_D7_R02.mat', 10); % SP
obj = obj.addLap('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP05_05\2025_FYP05_05_D4_R04.mat', 4); % SM123
obj = obj.addLap('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP05_05\2025_FYP05_05_D4_R07.mat', 4); % SM125

% Overwrite the legend cell
obj.plottingTools.legendCell = {'SP', 'SM123', 'SM125'};

%% Stats Test & Metrics
metricsComp = obj.fnMetricsComparison(1, [2,3]);
CI = obj.fnConfidenceIntervals(1, [2,3], 0.05);

%%%%%%%% Plotting Commands
%% Set plot colours
% Human as blue
% FFNN as red
obj = obj.addLapsColours({'#0077FF', '#FF0000'});
%% Plot the racing line
obj.plotRacingLine(true);
obj.plotLineDistribution(1, true, [2])
%% Plot steering angle with errors
obj.plotErrorsWithSteering();

%% Plot steering and its derivatives
obj.plotDerivativesSteeringAngle(true);

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
obj.plotPSpectrum('dSteerAngle', 'Run')
xlim([0, 5])
obj.plotPSpectrum('CTE', 'Run')
xlim([0, 5])

%% Plot Violins
obj.plotRunViolins();
obj.plotGroupedMetrics();

%% Plot TF Estimate
obj.plotTF('CTE', 'steerAngle', 'Lap', false);
obj.plotTF('kappa', 'steerAngle', 'Lap', false);

