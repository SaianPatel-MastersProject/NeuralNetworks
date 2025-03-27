%% Function to plot the input space
function plotInputSpace(trainingData, inputIdx)

    % Get the column names from the inputs
    inputData = trainingData(:, inputIdx);
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
            scatter(inputData.(inputColumns{i}), inputData.(inputColumns{j}), 'filled', 'SizeData', 2);
            xlabel(inputColumns{i}, 'FontWeight', 'bold');
            ylabel(inputColumns{j}, 'FontWeight', 'bold');
            grid on;
            grid minor;
            counter = counter + 1;


        end


    end



end