%% Function to overlay run data with training data
function fnInputSpaceOverlay(trainingData, runData, trainingIdx)
    
    AIW_Table = Utilities.fnLoadAIW('SUZ');
    AIW_Data = [AIW_Table.x, AIW_Table.y];

    % Get the curvature, kappa
    [kappa, ~] = PostProcessing.PE.fnCalculateCurvature([AIW_Table.x, AIW_Table.y]);


    spacing = 0.1;
    method = 'spline';

    xInterp = Utilities.fnInterpolateByDist(AIW_Data, AIW_Table.x, spacing, method);
    yInterp = Utilities.fnInterpolateByDist(AIW_Data, AIW_Table.y, spacing, method);
    kappaInterp = Utilities.fnInterpolateByDist(AIW_Data, kappa, spacing, method);

    AIW_Data = [xInterp, yInterp];

    % Get look-ahead sigmoid
    [dLookOverall, kappaSorted] = Utilities.fnLookAheadDistanceSigmoidCurvature(6, 30, 200, 0.01, kappaInterp);

    % Create the equivalents of the training data for the run data (with
    % the same column names)
    runData.curvature = runData.kappa; % Curvature (kappa)
    runData.lookAhead1 = runData.kappa; % Look-Ahead Curvature (kappa1)

    for i = 1:size(runData, 1)

        xV = runData.posX(i);
        yV = runData.posY(i);

        % Find nearest AIW waypoint using Euclidean distance
        d = sqrt((AIW_Data(:,1) - xV).^2 + (AIW_Data(:,2) -yV).^2);
        [~, closestWaypointIdx] = min(d);

        dLookAhead = interp1(kappaSorted, dLookOverall, abs(runData.curvature(i)));
        iLookAhead = round(dLookAhead/0.1);

        % Look Ahead in Kappa
        runData.lookAhead1(i) = Utilities.fnGetLookAheadValues(kappaInterp, closestWaypointIdx, iLookAhead, 1);

    end

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
        % t = (1:nPoints)' .* 0.01;
        t = runData.time;
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