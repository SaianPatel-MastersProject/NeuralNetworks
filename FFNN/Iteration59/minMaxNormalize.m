function normTable = minMaxNormalize(inputTable)
    % Ensure input is a table
    if ~istable(inputTable)
        error('Input must be a table.');
    end

    % Create a copy of the input table to store results
    normTable = inputTable;

    % Identify numeric columns
    numericVars = varfun(@isnumeric, inputTable, 'OutputFormat', 'uniform');

    % Normalize only numeric columns
    for col = find(numericVars)
        colData = inputTable{:, col}; % Extract column data

        minVal = min(colData);
        maxVal = max(colData);

        % Avoid division by zero for constant columns
        if minVal ~= maxVal
            normTable{:, col} = 2 * (colData - minVal) / (maxVal - minVal) - 1;
        else
            normTable{:, col} = ones(size(colData)); % Set to 1 if all values are the same
        end
    end
end
