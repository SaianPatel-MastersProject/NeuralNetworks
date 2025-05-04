%% Human
objH = Plotting.multiPlotter();

% Add training run
objH = objH.addRun('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP04_14\2025_FYP04_14_D7_R03.mat', true, [2:10]); % SP k=-1.5
objH = objH.addRun('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP04_28\2025_FYP04_28_D7_R02.mat', true, [1:11]); % SP k =-1.425
objH = objH.addRun('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP04_28\2025_FYP04_28_D7_R04.mat', true, [1:11]); % SP k =-1.575



% Add reference lap
objH = objH.addLap('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP04_14\2025_FYP04_14_D7_R03.mat', 10); % SP
objH = objH.addLap('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP04_28\2025_FYP04_28_D7_R02.mat', 11); % SP
objH = objH.addLap('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP04_28\2025_FYP04_28_D7_R04.mat', 11); % SP

% Overwrite the legend cell
objH.plottingTools.legendCell = {'Baseline', '-5%', '+5%'};

%% Human Avg
objH = Plotting.multiPlotter();

% Add training run
objH = objH.addRun('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP04_14\2025_FYP04_14_D7_R03_AvgLap.mat', true, []); % SP k=-1.5
objH = objH.addRun('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP04_28\2025_FYP04_28_D7_R02_AvgLap.mat', true, []); % SP k =-1.425
objH = objH.addRun('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP04_28\2025_FYP04_28_D7_R04_AvgLap.mat', true, []); % SP k =-1.575



% Add reference lap
objH = objH.addAverageLap('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP04_14\2025_FYP04_14_D7_R03_AvgLap.mat'); % SP
objH = objH.addAverageLap('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP04_28\2025_FYP04_28_D7_R02_AvgLap.mat'); % SP
objH = objH.addAverageLap('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP04_28\2025_FYP04_28_D7_R04_AvgLap.mat'); % SP

% Overwrite the legend cell
objH.plottingTools.legendCell = {'Baseline', '-5%', '+5%'};

%% Stats Test & Metrics
metricsCompH = objH.fnMetricsComparison(1, [2,3]);

%% FFNN
obj = Plotting.multiPlotter();

% Add training run
obj = obj.addRun('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP04_28\2025_FYP04_28_D7_R06.mat', true, [2:4]); % SP k=-1.5
obj = obj.addRun('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP04_28\2025_FYP04_28_D7_R07.mat', true, [2:4]); % SP k =-1.425
obj = obj.addRun('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP04_28\2025_FYP04_28_D7_R08.mat', true, [2:4]); % SP k =-1.575



% Add reference lap
obj = obj.addLap('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP04_28\2025_FYP04_28_D7_R06.mat', 4); % SP
obj = obj.addLap('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP04_28\2025_FYP04_28_D7_R07.mat', 4); % SP
obj = obj.addLap('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP04_28\2025_FYP04_28_D7_R08.mat', 4); % SP

% Overwrite the legend cell
obj.plottingTools.legendCell = {'Baseline', '-5%', '+5%'};

%% Stats Test & Metrics
metricsCompFFNN = obj.fnMetricsComparison(1, [2,3]);

%%%%%%%% Plotting Commands
%% Set plot colours
% Human as blue
% FFNN as red
obj = obj.addLapsColours({'#0077FF', '#FF0000', '#008000'});
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

