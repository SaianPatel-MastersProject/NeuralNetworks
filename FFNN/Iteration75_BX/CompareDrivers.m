%% Compare Drivers

obj = Plotting.multiPlotter();

% Add training run
obj = obj.addRun('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP03_31\2025_FYP03_31_D5_R08.mat', true, [1:21]); % BX
obj = obj.addRun('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP04_07\2025_FYP04_07_D1_R02.mat', true, [2:4]); % SM75_BX



% Add reference lap
obj = obj.addLap('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP03_31\2025_FYP03_31_D5_R08.mat', 21); % BX
obj = obj.addLap('D:\Users\Saian\Workspace\Data\+ProcessedData\2025\FYP04_07\2025_FYP04_07_D1_R02.mat', 4); % SM75_BX

%% Plot distributions of metrics
figure;
hold on
histogram(obj.runData(1).metricsCTE.TACTE, 6, "Normalization", "percentage");
histogram(obj.runData(2).metricsCTE.TACTE, 6, "Normalization", "percentage");
xlabel('TACTE (m)')
ylabel('Frequency (%)')
legend({'BX', 'SM75 BX'})

%%
figure;
hold on
histogram(obj.runData(1).metricsCTE.rCTE_pct, 6, "Normalization", "percentage");
histogram(obj.runData(2).metricsCTE.rCTE_pct, 6, "Normalization", "percentage");
xlabel('rCTE (%)')
ylabel('Frequency (%)')
legend({'BX', 'SM75_BX'})

%%
figure;
hold on
histogram(obj.runData(1).metricsCTE.wCTE_pct, 6,"Normalization", "percentage");
histogram(obj.runData(2).metricsCTE.wCTE_pct, 6, "Normalization", "percentage");
xlabel('wCTE (%)')
ylabel('Frequency (%)')
legend({'BX', 'SM75_BX'})

%%
figure;
hold on
histogram(obj.runData(1).metricsCTE.hCTE_pct, 6, "Normalization", "percentage");
histogram(obj.runData(2).metricsCTE.hCTE_pct, 6, "Normalization", "percentage");
xlabel('hCTE (%)')
ylabel('Frequency (%)')
legend({'BX', 'SM75_BX'})

%%
figure;
hold on
histogram(obj.runData(1).metricsCTE.rRW, 6, "Normalization", "percentage");
histogram(obj.runData(2).metricsCTE.rRW, 6, "Normalization", "percentage");
xlabel('rRW')
ylabel('Frequency (%)')
legend({'BX', 'SM75_BX'})
%%
figure;
hold on
histogram(obj.runData(1).metricsSteer.MSteer * 100, 6, "Normalization", "percentage");
histogram(obj.runData(2).metricsSteer.MSteer * 100, 6, "Normalization", "percentage");
xlabel('MSteer')
ylabel('Frequency (%)')
legend({'BX', 'SM75_BX'})

%%
figure;
hold on
histogram(obj.runData(1).runData.steerAngle * 225, 24, "Normalization", "percentage");
histogram(obj.runData(2).runData.steerAngle * 225, 24, "Normalization", "percentage");
xlabel('Steering Angle (deg)')
ylabel('Frequency (%)')
legend({'BX', 'SM75_BX'})

%%
figure;
hold on
histogram(obj.runData(1).metricsSteer.dSteerMin, 6,"Normalization", "percentage");
histogram(obj.runData(2).metricsSteer.dSteerMin, 6,"Normalization", "percentage");
xlabel('Minimum Steering Velocity')
ylabel('Frequency (%)')
legend({'BX', 'SM75_BX'})

%%
figure;
hold on
histogram(obj.runData(1).metricsSteer.dSteerMax, 6, "Normalization", "percentage");
histogram(obj.runData(2).metricsSteer.dSteerMax, 6, "Normalization", "percentage");
xlabel('Maximum Steering Velocity')
ylabel('Frequency (%)')
legend({'BX', 'SM75_BX'})

%%
figure;
hold on
histogram(obj.runData(1).metricsSteer.steerL_pct, 6, "Normalization", "percentage");
histogram(obj.runData(2).metricsSteer.steerL_pct, 6, "Normalization", "percentage");
xlabel('Left Steering (%)')
ylabel('Frequency (%)')
legend({'BX', 'SM75_BX'})

%%
figure;
hold on
histogram(obj.runData(1).metricsSteer.steerR_pct, 6, "Normalization", "percentage");
histogram(obj.runData(2).metricsSteer.steerR_pct, 6, "Normalization", "percentage");
xlabel('Right Steering (%)')
ylabel('Frequency (%)')
legend({'BX', 'SM75_BX'})

%%
figure;
hold on
histogram(obj.runData(1).metricsSteer.steerC_pct, 6, "Normalization", "percentage");
histogram(obj.runData(2).metricsSteer.steerC_pct, 6, "Normalization", "percentage");
xlabel('Centred Steering (%)')
ylabel('Frequency (%)')
legend({'BX', 'SM75_BX'})