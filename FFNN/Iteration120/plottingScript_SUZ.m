%% Load
obj = Plotting.multiPlotter();

% Add training run
obj = obj.addRun('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP02_03\2025_FYP02_03_D1_R02.mat', true, [2:31]); % SP k=-1.5
obj = obj.addRun('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP05_05\2025_FYP05_05_D3_R03.mat', true, [2:4]); % SM120
obj = obj.addRun('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP05_05\2025_FYP05_05_D2_R04.mat', true, [2:4]); % SM119
obj = obj.addRun('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP04_14\2025_FYP04_14_D5_R01.mat', true, [2:4]); % PID



% Add reference lap
obj = obj.addLap('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP02_03\2025_FYP02_03_D1_R02.mat', 31); % SP
obj = obj.addLap('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP05_05\2025_FYP05_05_D3_R03.mat', 4); % SM120
obj = obj.addLap('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP05_05\2025_FYP05_05_D2_R04.mat', 4); % SM119
obj = obj.addLap('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP04_14\2025_FYP04_14_D5_R01.mat', 4); % PID

% Overwrite the legend cell
obj.plottingTools.legendCell = {'SP', 'SM120', 'SM119', 'PID'};

%% Stats Test & Metrics
metricsComp3 = obj.fnMetricsComparison(1, [2,3,4]);
CI = obj.fnConfidenceIntervals(1, [2,3,4], 0.05);

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

