%% Function to overlay run data with training data
function fnInputSpaceOverlay(trainingData, runData, trainingIdx)
    
    % Get AIW Data
    % Read in the AIW Data and Interpolate it, get curvature (kappa)
    AIW_Table = readtable('+PostProcessing\+CTE\Arrow_IP.csv');
    % Get the curvature, kappa
    [kappa, ~] = PostProcessing.PE.fnCalculateCurvature([AIW_Table.x, AIW_Table.y]);

    nPoints  = 10000;
    interpMethod = 'spline';

    AIW_Data = [AIW_Table.x, AIW_Table.y];
    dBetweenPoints = (sqrt(diff(AIW_Data(:,1)).^2 + diff(AIW_Data(:,2)).^2));
    rollingDistance = [0; cumsum(dBetweenPoints)];
    dNew = (linspace(0, rollingDistance(end), nPoints))';
    xInterp = interp1(rollingDistance, AIW_Data(:,1), dNew, interpMethod);
    yInterp = interp1(rollingDistance, AIW_Data(:,2), dNew, interpMethod);
    kappaInterp = interp1(rollingDistance, kappa, dNew, interpMethod);
    AIW_Data = [xInterp, yInterp];

    % Create the equivalents of the training data for the run data (with
    % the same column names)
    runData.dCTE = [0; diff(runData.CTE)]; % Derivative of CTE
    runData.curvature = runData.kappa; % Curvature (kappa)

    % Get the column names of the training data specified
    % Get the column names from the inputs
    inputData = trainingData(:, trainingIdx);
    inputColumns = inputData.Properties.VariableNames';

    % Count how many inputs there are
    nInputs = length(inputColumns);

    % Plot each dimension against each other (nInputs x nInputs square)
    figure("Name", 'Input Space');
    hold on

    counter = 1;
    for i = 1:nInputs

        for j = 1:nInputs

            subplot(nInputs, nInputs, counter)
            hold on
            scatter(inputData.(inputColumns{i}), inputData.(inputColumns{j}), 'filled', 'SizeData', 6);
            scatter(runData.(inputColumns{i}), runData.(inputColumns{j}), 'filled', 'SizeData', 6);
            xlabel(inputColumns{i});
            ylabel(inputColumns{j});
            grid on;
            grid minor;
            counter = counter + 1;


        end


    end
    % Plot the inputs over time
    figure("Name", 'Input Over Time')

    % Get the number of points
    nPoints = size(runData, 1);

    for i = 1:nInputs

        subplot(nInputs, 1, i);
        hold on

        % plot max and min values as a line
        t = (1:nPoints)' .* 0.01;
        maxVal = max(inputData.(inputColumns{i}));
        maxVals(1:nPoints, 1) = maxVal;
        minVal = min(inputData.(inputColumns{i}));
        minVals(1:nPoints, 1) = minVal;

        plot(t, maxVals, 'Color', 'black', 'LineStyle', '--')
        plot(t, minVals, 'Color', 'black', 'LineStyle', '--')

        plot(t, runData.(inputColumns{i}))

        ylabel(inputColumns{i})

        

    end




end