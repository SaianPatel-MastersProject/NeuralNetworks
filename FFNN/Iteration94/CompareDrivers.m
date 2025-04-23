%% Compare Drivers

obj = Plotting.multiPlotter();

%% Load Normal Data
obj = obj.addRun('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP03_31\2025_FYP03_31_D5_R05.mat', true, [2:20]); % LZ
obj = obj.addRun('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP04_07\2025_FYP04_07_D1_R01.mat', true, [2:4]); % SM75_LZ

obj = obj.addLap('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP03_31\2025_FYP03_31_D5_R05.mat', 20); % LZ
obj = obj.addLap('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP04_07\2025_FYP04_07_D1_R01.mat', 4); % FFNN 75


%% Load Average Laps
obj = obj.addRun('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP02_03\2025_FYP02_03_D1_R02_AvgLap.mat', true, []); % SP
obj = obj.addRun('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP03_31\2025_FYP03_31_D5_R08_AvgLap.mat', true, []); % BX
obj = obj.addRun('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP03_31\2025_FYP03_31_D5_R05_AvgLap.mat', true, []); % LZ


obj = obj.addAverageLap('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP02_03\2025_FYP02_03_D1_R02_AvgLap.mat'); % SP
obj = obj.addAverageLap('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP03_31\2025_FYP03_31_D5_R08_AvgLap.mat'); % BX
obj = obj.addAverageLap('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP03_31\2025_FYP03_31_D5_R05_AvgLap.mat'); % LZ

%% Plot distributions of metrics
figure;
hold on
histogram(obj.runData(1).metricsCTE.TACTE, 6, "Normalization", "percentage");
histogram(obj.runData(2).metricsCTE.TACTE, 6, "Normalization", "percentage");
xlabel('TACTE (m)')
ylabel('Frequency (%)')
legend({'LZ', 'SM75 LZ'})

%%
figure;
hold on
histogram(obj.runData(1).metricsCTE.rCTE_pct, 6, "Normalization", "percentage");
histogram(obj.runData(2).metricsCTE.rCTE_pct, 6, "Normalization", "percentage");
xlabel('rCTE (%)')
ylabel('Frequency (%)')
legend({'LZ', 'SM75_LZ'})

%%
figure;
hold on
histogram(obj.runData(1).metricsCTE.wCTE_pct, 6,"Normalization", "percentage");
histogram(obj.runData(2).metricsCTE.wCTE_pct, 6, "Normalization", "percentage");
xlabel('wCTE (%)')
ylabel('Frequency (%)')
legend({'LZ', 'SM75_LZ'})

%%
figure;
hold on
histogram(obj.runData(1).metricsCTE.hCTE_pct, 6, "Normalization", "percentage");
histogram(obj.runData(2).metricsCTE.hCTE_pct, 6, "Normalization", "percentage");
xlabel('hCTE (%)')
ylabel('Frequency (%)')
legend({'LZ', 'SM75_LZ'})

%%
figure;
hold on
histogram(obj.runData(1).metricsCTE.rRW, 6, "Normalization", "percentage");
histogram(obj.runData(2).metricsCTE.rRW, 6, "Normalization", "percentage");
xlabel('rRW')
ylabel('Frequency (%)')
legend({'LZ', 'SM75_LZ'})
%%
figure;
hold on
histogram(obj.runData(1).metricsSteer.MSteer * 100, 6, "Normalization", "percentage");
histogram(obj.runData(2).metricsSteer.MSteer * 100, 6, "Normalization", "percentage");
xlabel('MSteer')
ylabel('Frequency (%)')
legend({'LZ', 'SM75_LZ'})

%%
figure;
hold on
histogram(obj.runData(1).runData.steerAngle * 225, 24, "Normalization", "percentage");
histogram(obj.runData(2).runData.steerAngle * 225, 24, "Normalization", "percentage");
xlabel('Steering Angle (deg)')
ylabel('Frequency (%)')
legend({'LZ', 'SM75_LZ'})

%%
figure;
hold on
histogram(obj.runData(1).metricsSteer.dSteerMin, 6,"Normalization", "percentage");
histogram(obj.runData(2).metricsSteer.dSteerMin, 6,"Normalization", "percentage");
xlabel('Minimum Steering Velocity')
ylabel('Frequency (%)')
legend({'LZ', 'SM75_LZ'})

%%
figure;
hold on
histogram(obj.runData(1).metricsSteer.dSteerMax, 6, "Normalization", "percentage");
histogram(obj.runData(2).metricsSteer.dSteerMax, 6, "Normalization", "percentage");
xlabel('Maximum Steering Velocity')
ylabel('Frequency (%)')
legend({'LZ', 'SM75_LZ'})

%%
figure;
hold on
histogram(obj.runData(1).metricsSteer.steerL_pct, 6, "Normalization", "percentage");
histogram(obj.runData(2).metricsSteer.steerL_pct, 6, "Normalization", "percentage");
xlabel('Left Steering (%)')
ylabel('Frequency (%)')
legend({'LZ', 'SM75_LZ'})

%%
figure;
hold on
histogram(obj.runData(1).metricsSteer.steerR_pct, 6, "Normalization", "percentage");
histogram(obj.runData(2).metricsSteer.steerR_pct, 6, "Normalization", "percentage");
xlabel('Right Steering (%)')
ylabel('Frequency (%)')
legend({'LZ', 'SM75_LZ'})

%%
figure;
hold on
histogram(obj.runData(1).metricsSteer.steerC_pct, 6, "Normalization", "percentage");
histogram(obj.runData(2).metricsSteer.steerC_pct, 6, "Normalization", "percentage");
xlabel('Centred Steering (%)')
ylabel('Frequency (%)')
legend({'LZ', 'SM75_LZ'})