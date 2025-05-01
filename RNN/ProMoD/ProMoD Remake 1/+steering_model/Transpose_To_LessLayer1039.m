classdef Transpose_To_LessLayer1039 < nnet.layer.Layer & nnet.layer.Formattable
    % A custom layer auto-generated while importing an ONNX network.

    %#codegen
    %#ok<*PROPLC>
    %#ok<*NBRAK>
    %#ok<*INUSL>
    %#ok<*VARARG>

    properties (Learnable)
        axes_const__19
        axes_const__18
        functional_1_1_de_12
        functional_1_1_de_2
        functional_1_1_de_7
        functional_1_1_gr_3
        functional_1_1_gr_4
        functional_1_1_gr_5
        functional_1_1_gr_65
        functional_1_1_gru_1
        functional_1_1_ste_2
    end

    properties
        ONNXParams         % An ONNXParameters object containing parameters used by this layer.
    end

    methods
        function this = Transpose_To_LessLayer1039(name, onnxParams)
            this.Name = name;
            this.NumInputs = 2;
            this.OutputNames = {'steering_output'};
            this.ONNXParams = onnxParams;
            this.axes_const__19 = onnxParams.Learnables.axes_const__19;
            this.axes_const__18 = onnxParams.Learnables.axes_const__18;
            this.functional_1_1_de_12 = onnxParams.Learnables.functional_1_1_de_12;
            this.functional_1_1_de_2 = onnxParams.Learnables.functional_1_1_de_2;
            this.functional_1_1_de_7 = onnxParams.Learnables.functional_1_1_de_7;
            this.functional_1_1_gr_3 = onnxParams.Learnables.functional_1_1_gr_3;
            this.functional_1_1_gr_4 = onnxParams.Learnables.functional_1_1_gr_4;
            this.functional_1_1_gr_5 = onnxParams.Learnables.functional_1_1_gr_5;
            this.functional_1_1_gr_65 = onnxParams.Learnables.functional_1_1_gr_65;
            this.functional_1_1_gru_1 = onnxParams.Learnables.functional_1_1_gru_1;
            this.functional_1_1_ste_2 = onnxParams.Learnables.functional_1_1_ste_2;
        end

        function [steering_output] = predict(this, sequence_input, sequence_inputNumDims)
            if isdlarray(sequence_input)
                sequence_input = stripdims(sequence_input);
            end
            sequence_inputNumDims = numel(sequence_inputNumDims);
            onnxParams = this.ONNXParams;
            onnxParams.Learnables.axes_const__19 = this.axes_const__19;
            onnxParams.Learnables.axes_const__18 = this.axes_const__18;
            onnxParams.Learnables.functional_1_1_de_12 = this.functional_1_1_de_12;
            onnxParams.Learnables.functional_1_1_de_2 = this.functional_1_1_de_2;
            onnxParams.Learnables.functional_1_1_de_7 = this.functional_1_1_de_7;
            onnxParams.Learnables.functional_1_1_gr_3 = this.functional_1_1_gr_3;
            onnxParams.Learnables.functional_1_1_gr_4 = this.functional_1_1_gr_4;
            onnxParams.Learnables.functional_1_1_gr_5 = this.functional_1_1_gr_5;
            onnxParams.Learnables.functional_1_1_gr_65 = this.functional_1_1_gr_65;
            onnxParams.Learnables.functional_1_1_gru_1 = this.functional_1_1_gru_1;
            onnxParams.Learnables.functional_1_1_ste_2 = this.functional_1_1_ste_2;
            [steering_output, steering_outputNumDims] = Transpose_To_LessFcn(sequence_input, sequence_inputNumDims, onnxParams, 'Training', false, ...
                'InputDataPermutation', {['as-is'], ['as-is']}, ...
                'OutputDataPermutation', {['as-is'], ['as-is']});
            if any(cellfun(@(A)~isnumeric(A) && ~islogical(A), {steering_output}))
                fprintf('Runtime error in network. At least one output of custom layer ''%s'' is a non-numeric, non-logical value.\n', 'Transpose_To_LessLayer1039');
                error(message('nnet_cnn_onnx:onnx:BadCustomLayerRuntimeOutput', 'Transpose_To_LessLayer1039'));
            end
            steering_output = dlarray(single(steering_output), repmat('U', 1, max(2, steering_outputNumDims)));
            if ~coder.target('MATLAB')
                steering_output = extractdata(steering_output);
            end
        end

        function [steering_output] = forward(this, sequence_input, sequence_inputNumDims)
            if isdlarray(sequence_input)
                sequence_input = stripdims(sequence_input);
            end
            sequence_inputNumDims = numel(sequence_inputNumDims);
            onnxParams = this.ONNXParams;
            onnxParams.Learnables.axes_const__19 = this.axes_const__19;
            onnxParams.Learnables.axes_const__18 = this.axes_const__18;
            onnxParams.Learnables.functional_1_1_de_12 = this.functional_1_1_de_12;
            onnxParams.Learnables.functional_1_1_de_2 = this.functional_1_1_de_2;
            onnxParams.Learnables.functional_1_1_de_7 = this.functional_1_1_de_7;
            onnxParams.Learnables.functional_1_1_gr_3 = this.functional_1_1_gr_3;
            onnxParams.Learnables.functional_1_1_gr_4 = this.functional_1_1_gr_4;
            onnxParams.Learnables.functional_1_1_gr_5 = this.functional_1_1_gr_5;
            onnxParams.Learnables.functional_1_1_gr_65 = this.functional_1_1_gr_65;
            onnxParams.Learnables.functional_1_1_gru_1 = this.functional_1_1_gru_1;
            onnxParams.Learnables.functional_1_1_ste_2 = this.functional_1_1_ste_2;
            [steering_output, steering_outputNumDims] = Transpose_To_LessFcn(sequence_input, sequence_inputNumDims, onnxParams, 'Training', true, ...
                'InputDataPermutation', {['as-is'], ['as-is']}, ...
                'OutputDataPermutation', {['as-is'], ['as-is']});
            if any(cellfun(@(A)~isnumeric(A) && ~islogical(A), {steering_output}))
                fprintf('Runtime error in network. At least one output of custom layer ''%s'' is a non-numeric, non-logical value.\n', 'Transpose_To_LessLayer1039');
                error(message('nnet_cnn_onnx:onnx:BadCustomLayerRuntimeOutput', 'Transpose_To_LessLayer1039'));
            end
            steering_output = dlarray(single(steering_output), repmat('U', 1, max(2, steering_outputNumDims)));
            if ~coder.target('MATLAB')
                steering_output = extractdata(steering_output);
            end
        end
    end
end

function [steering_output, steering_outputNumDims, state] = Transpose_To_LessFcn(sequence_input, sequence_inputNumDims, params, varargin)
%TRANSPOSE_TO_LESSFCN Function implementing an imported ONNX network.
%
% THIS FILE WAS AUTO-GENERATED BY importONNXFunction.
% ONNX Operator Set Version: 13
%
% Variable names in this function are taken from the original ONNX file.
%
% [STEERING_OUTPUT] = Transpose_To_LessFcn(SEQUENCE_INPUT, PARAMS)
%			- Evaluates the imported ONNX network TRANSPOSE_TO_LESSFCN with input(s)
%			SEQUENCE_INPUT and the imported network parameters in PARAMS. Returns
%			network output(s) in STEERING_OUTPUT.
%
% [STEERING_OUTPUT, STATE] = Transpose_To_LessFcn(SEQUENCE_INPUT, PARAMS)
%			- Additionally returns state variables in STATE. When training,
%			use this form and set TRAINING to true.
%
% [__] = Transpose_To_LessFcn(SEQUENCE_INPUT, PARAMS, 'NAME1', VAL1, 'NAME2', VAL2, ...)
%			- Specifies additional name-value pairs described below:
%
% 'Training'
% 			Boolean indicating whether the network is being evaluated for
%			prediction or training. If TRAINING is true, state variables
%			will be updated.
%
% 'InputDataPermutation'
%			'auto' - Automatically attempt to determine the permutation
%			 between the dimensions of the input data and the dimensions of
%			the ONNX model input. For example, the permutation from HWCN
%			(MATLAB standard) to NCHW (ONNX standard) uses the vector
%			[4 3 1 2]. See the documentation for IMPORTONNXFUNCTION for
%			more information about automatic permutation.
%
%			'none' - Input(s) are passed in the ONNX model format. See 'Inputs'.
%
%			numeric vector - The permutation vector describing the
%			transformation between input data dimensions and the expected
%			ONNX input dimensions.%
%			cell array - If the network has multiple inputs, each cell
%			contains 'auto', 'none', or a numeric vector.
%
% 'OutputDataPermutation'
%			'auto' - Automatically attempt to determine the permutation
%			between the dimensions of the output and a conventional MATLAB
%			dimension ordering. For example, the permutation from NC (ONNX
%			standard) to CN (MATLAB standard) uses the vector [2 1]. See
%			the documentation for IMPORTONNXFUNCTION for more information
%			about automatic permutation.
%
%			'none' - Return output(s) as given by the ONNX model. See 'Outputs'.
%
%			numeric vector - The permutation vector describing the
%			transformation between the ONNX output dimensions and the
%			desired output dimensions.%
%			cell array - If the network has multiple outputs, each cell
%			contains 'auto', 'none' or a numeric vector.
%
% Inputs:
% -------
% SEQUENCE_INPUT
%			- Input(s) to the ONNX network.
%			  The input size(s) expected by the ONNX file are:
%				  SEQUENCE_INPUT:		[unk__174, 4, 4]				Type: FLOAT
%			  By default, the function will try to permute the input(s)
%			  into this dimension ordering. If the default is incorrect,
%			  use the 'InputDataPermutation' argument to control the
%			  permutation.
%
%
% PARAMS	- Network parameters returned by 'importONNXFunction'.
%
%
% Outputs:
% --------
% STEERING_OUTPUT
%			- Output(s) of the ONNX network.
%			  Without permutation, the size(s) of the outputs are:
%				  STEERING_OUTPUT:		[unk__175, 1]				Type: FLOAT
%			  By default, the function will try to permute the output(s)
%			  from this dimension ordering into a conventional MATLAB
%			  ordering. If the default is incorrect, use the
%			  'OutputDataPermutation' argument to control the permutation.
%
% STATE		- (Optional) State variables. When TRAINING is true, these will
% 			  have been updated from the original values in PARAMS.State.
%
%
%  See also importONNXFunction

% Preprocess the input data and arguments:
[sequence_input, Training, outputDataPerms, anyDlarrayInputs] = preprocessInput(sequence_input, params, varargin{:});
% Put all variables into a single struct to implement dynamic scoping:
[Vars, NumDims] = packageVariables(params, {'sequence_input'}, {sequence_input}, [sequence_inputNumDims]);
% Call the top-level graph function:
[steering_output, steering_outputNumDims, state] = Transpose_To_LessGraph1020(sequence_input, NumDims.sequence_input, Vars, NumDims, Training, params.State);
% Postprocess the output data
[steering_output] = postprocessOutput(steering_output, outputDataPerms, anyDlarrayInputs, Training, varargin{:});
end

function [steering_output, steering_outputNumDims1038, state] = Transpose_To_LessGraph1020(sequence_input, sequence_inputNumDims1037, Vars, NumDims, Training, state)
% Function implementing the graph 'Transpose_To_LessGraph1020'
% Update Vars and NumDims from the graph's formal input parameters. Note that state variables are already in Vars.
Vars.sequence_input = sequence_input;
NumDims.sequence_input = sequence_inputNumDims1037;

% Execute the operators:
% MatMul:
[Vars.functional_1_1_de_3, NumDims.functional_1_1_de_3] = onnxMatMul(Vars.sequence_input, Vars.functional_1_1_de_2, NumDims.sequence_input, NumDims.functional_1_1_de_2);

% Add:
Vars.functional_1_1_de_1 = Vars.functional_1_1_de_3 + Vars.functional_1_1_dense;
NumDims.functional_1_1_de_1 = max(NumDims.functional_1_1_de_3, NumDims.functional_1_1_dense);

% Relu:
Vars.functional_1_1_de_4 = relu(Vars.functional_1_1_de_1);
NumDims.functional_1_1_de_4 = NumDims.functional_1_1_de_1;

% Transpose:
[perm, NumDims.functional_1_1_gr_9] = prepareTransposeArgs(Vars.TransposePerm1021, NumDims.functional_1_1_de_4);
if ~isempty(perm)
    Vars.functional_1_1_gr_9 = permute(Vars.functional_1_1_de_4, perm);
end

% Shape:
[Vars.functional_1_1_gr_1, NumDims.functional_1_1_gr_1] = onnxShape(Vars.functional_1_1_de_4, NumDims.functional_1_1_de_4, 0, NumDims.functional_1_1_de_4+1);

% Cast:
if islogical(Vars.functional_1_1_gr_1)
    Vars.functional_1_1_gr_1 = single(Vars.functional_1_1_gr_1);
end
Vars.functional_1_1_gr_2 = cast(int32(extractdata(Vars.functional_1_1_gr_1)), 'like', Vars.functional_1_1_gr_1);
NumDims.functional_1_1_gr_2 = NumDims.functional_1_1_gr_1;

% Less:
Vars.functional_1_1_gr_77 = Vars.functional_1_1_gr_72 < Vars.const_fold_opt__63;
NumDims.functional_1_1_gr_77 = max(NumDims.functional_1_1_gr_72, NumDims.const_fold_opt__63);

% And:
Vars.functional_1_1_gr_78 = Vars.functional_1_1_gr_77 & Vars.functional_1_1_gr_77;
NumDims.functional_1_1_gr_78 = max(NumDims.functional_1_1_gr_77, NumDims.functional_1_1_gr_77);

% Slice:
[Indices, NumDims.functional_1_1_gr_6] = prepareSliceArgs(Vars.functional_1_1_gr_2, Vars.const_axes__36, Vars.const_ends__35, Vars.const_axes__36, '', NumDims.functional_1_1_gr_2);
Vars.functional_1_1_gr_6 = subsref(Vars.functional_1_1_gr_2, Indices);

% Concat:
[Vars.functional_1_1_gr_73, NumDims.functional_1_1_gr_73] = onnxConcat(0, {Vars.functional_1_1_gr_6, Vars.const_fold_opt__62}, [NumDims.functional_1_1_gr_6, NumDims.const_fold_opt__62]);

% Cast:
if islogical(Vars.functional_1_1_gr_73)
    Vars.functional_1_1_gr_73 = single(Vars.functional_1_1_gr_73);
end
Vars.functional_1_1_gr_75 = cast(int64(extractdata(Vars.functional_1_1_gr_73)), 'like', Vars.functional_1_1_gr_73);
NumDims.functional_1_1_gr_75 = NumDims.functional_1_1_gr_73;

% Expand:
[shape, NumDims.functional_1_1_gr_74] = prepareExpandArgs(Vars.functional_1_1_gr_75);
Vars.functional_1_1_gr_74 = Vars.functional_1_1_gr_72 + zeros(shape);

% Loop:
[Vars.functional_1_1_gr_66, Vars.functional_1_1_gr_67, Vars.functional_1_1_gr_68, Vars.functional_1_1_gr_69, Vars.functional_1_1_gr_70, Vars.functional_1_1_gr_71, NumDims.functional_1_1_gr_66, NumDims.functional_1_1_gr_67, NumDims.functional_1_1_gr_68, NumDims.functional_1_1_gr_69, NumDims.functional_1_1_gr_70, NumDims.functional_1_1_gr_71, state] = onnxLoop(Vars.functional_1_1_gru_1, Vars.functional_1_1_gr_78, {Vars.functional_1_1_gr_65, Vars.functional_1_1_gr_74, Vars.functional_1_1_gr_5, Vars.functional_1_1_gr_3, Vars.functional_1_1_gr_4}, NumDims.functional_1_1_gru_1, NumDims.functional_1_1_gr_78, {NumDims.functional_1_1_gr_65, NumDims.functional_1_1_gr_74, NumDims.functional_1_1_gr_5, NumDims.functional_1_1_gr_3, NumDims.functional_1_1_gr_4}, Vars, NumDims, Training, state, @LoopBodyGraph1022, 1);
Vars = appendStructs(Vars, state);

% Slice:
[Indices, NumDims.functional_1_1_gr_7] = prepareSliceArgs(Vars.functional_1_1_gr_71, Vars.const_starts__46, Vars.const_ends__47, Vars.const_axes__36, '', NumDims.functional_1_1_gr_71);
Vars.functional_1_1_gr_7 = subsref(Vars.functional_1_1_gr_71, Indices);

% Squeeze:
[Vars.functional_1_1_gr_8, NumDims.functional_1_1_gr_8] = onnxSqueeze(Vars.functional_1_1_gr_7, Vars.const_axes__36, NumDims.functional_1_1_gr_7);

% MatMul:
[Vars.functional_1_1_de_8, NumDims.functional_1_1_de_8] = onnxMatMul(Vars.functional_1_1_gr_8, Vars.functional_1_1_de_7, NumDims.functional_1_1_gr_8, NumDims.functional_1_1_de_7);

% Add:
Vars.functional_1_1_de_6 = Vars.functional_1_1_de_8 + Vars.functional_1_1_de_5;
NumDims.functional_1_1_de_6 = max(NumDims.functional_1_1_de_8, NumDims.functional_1_1_de_5);

% Relu:
Vars.functional_1_1_de_9 = relu(Vars.functional_1_1_de_6);
NumDims.functional_1_1_de_9 = NumDims.functional_1_1_de_6;

% MatMul:
[Vars.functional_1_1_de_13, NumDims.functional_1_1_de_13] = onnxMatMul(Vars.functional_1_1_de_9, Vars.functional_1_1_de_12, NumDims.functional_1_1_de_9, NumDims.functional_1_1_de_12);

% Add:
Vars.functional_1_1_de_11 = Vars.functional_1_1_de_13 + Vars.functional_1_1_de_10;
NumDims.functional_1_1_de_11 = max(NumDims.functional_1_1_de_13, NumDims.functional_1_1_de_10);

% Relu:
Vars.functional_1_1_de_14 = relu(Vars.functional_1_1_de_11);
NumDims.functional_1_1_de_14 = NumDims.functional_1_1_de_11;

% MatMul:
[Vars.functional_1_1_ste_3, NumDims.functional_1_1_ste_3] = onnxMatMul(Vars.functional_1_1_de_14, Vars.functional_1_1_ste_2, NumDims.functional_1_1_de_14, NumDims.functional_1_1_ste_2);

% Add:
Vars.functional_1_1_ste_1 = Vars.functional_1_1_ste_3 + Vars.functional_1_1_steer;
NumDims.functional_1_1_ste_1 = max(NumDims.functional_1_1_ste_3, NumDims.functional_1_1_steer);

% Tanh:
Vars.steering_output = tanh(Vars.functional_1_1_ste_1);
NumDims.steering_output = NumDims.functional_1_1_ste_1;

% Set graph output arguments from Vars and NumDims:
steering_output = Vars.steering_output;
steering_outputNumDims1038 = NumDims.steering_output;
% Set output state from Vars:
state = updateStruct(state, Vars);
end

function [cond___functional__9, functional_1_1_gr_10, functional_1_1_gr_12, functional_1_1_gr_84, functional_1_1_gr_83, functional_1_1_gr_82, functional_1_1_gr_15, cond___functional__9NumDims1030, functional_1_1_gr_10NumDims1031, functional_1_1_gr_12NumDims1032, functional_1_1_gr_84NumDims1033, functional_1_1_gr_83NumDims1034, functional_1_1_gr_82NumDims1035, functional_1_1_gr_15NumDims1036, state] = LoopBodyGraph1022(functional_1_1_gr_81, cond__45_0, functional_1_1_gr_85, functional_1_1_gr_86, functional_1_1_gr_84, functional_1_1_gr_83, functional_1_1_gr_82, functional_1_1_gr_81NumDims1023, cond__45_0NumDims1024, functional_1_1_gr_85NumDims1025, functional_1_1_gr_86NumDims1026, functional_1_1_gr_84NumDims1027, functional_1_1_gr_83NumDims1028, functional_1_1_gr_82NumDims1029, Vars, NumDims, Training, state)
% Function implementing the graph 'LoopBodyGraph1022'
% Update Vars and NumDims from the graph's formal input parameters. Note that state variables are already in Vars.
Vars.functional_1_1_gr_81 = functional_1_1_gr_81;
NumDims.functional_1_1_gr_81 = functional_1_1_gr_81NumDims1023;
Vars.cond__45_0 = cond__45_0;
NumDims.cond__45_0 = cond__45_0NumDims1024;
Vars.functional_1_1_gr_85 = functional_1_1_gr_85;
NumDims.functional_1_1_gr_85 = functional_1_1_gr_85NumDims1025;
Vars.functional_1_1_gr_86 = functional_1_1_gr_86;
NumDims.functional_1_1_gr_86 = functional_1_1_gr_86NumDims1026;
Vars.functional_1_1_gr_84 = functional_1_1_gr_84;
NumDims.functional_1_1_gr_84 = functional_1_1_gr_84NumDims1027;
Vars.functional_1_1_gr_83 = functional_1_1_gr_83;
NumDims.functional_1_1_gr_83 = functional_1_1_gr_83NumDims1028;
Vars.functional_1_1_gr_82 = functional_1_1_gr_82;
NumDims.functional_1_1_gr_82 = functional_1_1_gr_82NumDims1029;

% Execute the operators:
% Split:
[Vars.functional_1_1_gr_50, Vars.functional_1_1_gr_51, NumDims.functional_1_1_gr_50, NumDims.functional_1_1_gr_51] = onnxSplit13(Vars.functional_1_1_gr_84, 0, [], 2, NumDims.functional_1_1_gr_84);

% MatMul:
[Vars.functional_1_1_gr_21, NumDims.functional_1_1_gr_21] = onnxMatMul(Vars.functional_1_1_gr_86, Vars.functional_1_1_gr_82, NumDims.functional_1_1_gr_86, NumDims.functional_1_1_gr_82);

% Add:
Vars.functional_1_1_gr_10 = Vars.functional_1_1_gr_85 + Vars.functional_1_1_gr_17;
NumDims.functional_1_1_gr_10 = max(NumDims.functional_1_1_gr_85, NumDims.functional_1_1_gr_17);

% Gather:
[Vars.functional_1_1_gr_14, NumDims.functional_1_1_gr_14] = onnxGather(Vars.functional_1_1_gr_9, Vars.functional_1_1_gr_85, 0, NumDims.functional_1_1_gr_9, NumDims.functional_1_1_gr_85);

% MatMul:
[Vars.functional_1_1_gr_19, NumDims.functional_1_1_gr_19] = onnxMatMul(Vars.functional_1_1_gr_14, Vars.functional_1_1_gr_83, NumDims.functional_1_1_gr_14, NumDims.functional_1_1_gr_83);

% Cast:
if islogical(Vars.functional_1_1_gr_10)
    Vars.functional_1_1_gr_10 = single(Vars.functional_1_1_gr_10);
end
Vars.cond___functional__7 = single(Vars.functional_1_1_gr_10);
NumDims.cond___functional__7 = NumDims.functional_1_1_gr_10;

% Cast:
if islogical(Vars.functional_1_1_gr_81)
    Vars.functional_1_1_gr_81 = single(Vars.functional_1_1_gr_81);
end
Vars.cond___functional__5 = single(Vars.functional_1_1_gr_81);
NumDims.cond___functional__5 = NumDims.functional_1_1_gr_81;

% Less:
Vars.cond___functional__3 = Vars.cond___functional__5 < Vars.const_fold_opt__104;
NumDims.cond___functional__3 = max(NumDims.cond___functional__5, NumDims.const_fold_opt__104);

% Less:
Vars.cond___functional__1 = Vars.cond___functional__7 < Vars.const_fold_opt__64;
NumDims.cond___functional__1 = max(NumDims.cond___functional__7, NumDims.const_fold_opt__64);

% And:
Vars.cond___functional__9 = Vars.cond___functional__3 & Vars.cond___functional__1;
NumDims.cond___functional__9 = max(NumDims.cond___functional__3, NumDims.cond___functional__1);

% Squeeze:
[Vars.functional_1_1_gr_27, NumDims.functional_1_1_gr_27] = onnxSqueeze(Vars.functional_1_1_gr_50, Vars.axes_const__19, NumDims.functional_1_1_gr_50);

% Add:
Vars.functional_1_1_gr_33 = Vars.functional_1_1_gr_19 + Vars.functional_1_1_gr_27;
NumDims.functional_1_1_gr_33 = max(NumDims.functional_1_1_gr_19, NumDims.functional_1_1_gr_27);

% Split:
[Vars.functional_1_1_gr_53, Vars.functional_1_1_gr_54, Vars.functional_1_1_gr_55, NumDims.functional_1_1_gr_53, NumDims.functional_1_1_gr_54, NumDims.functional_1_1_gr_55] = onnxSplit13(Vars.functional_1_1_gr_33, -1, [], 3, NumDims.functional_1_1_gr_33);

% Squeeze:
[Vars.functional_1_1_gr_29, NumDims.functional_1_1_gr_29] = onnxSqueeze(Vars.functional_1_1_gr_51, Vars.axes_const__18, NumDims.functional_1_1_gr_51);

% Add:
Vars.functional_1_1_gr_35 = Vars.functional_1_1_gr_21 + Vars.functional_1_1_gr_29;
NumDims.functional_1_1_gr_35 = max(NumDims.functional_1_1_gr_21, NumDims.functional_1_1_gr_29);

% Slice:
[Indices, NumDims.functional_1_1_gr_61] = prepareSliceArgs(Vars.functional_1_1_gr_35, Vars.const_starts__20, Vars.const_ends__21, Vars.const_axes__22, '', NumDims.functional_1_1_gr_35);
Vars.functional_1_1_gr_61 = subsref(Vars.functional_1_1_gr_35, Indices);

% Slice:
[Indices, NumDims.functional_1_1_gr_59] = prepareSliceArgs(Vars.functional_1_1_gr_35, Vars.const_starts__23, Vars.const_ends__24, Vars.const_axes__25, '', NumDims.functional_1_1_gr_35);
Vars.functional_1_1_gr_59 = subsref(Vars.functional_1_1_gr_35, Indices);

% Add:
Vars.functional_1_1_gr_39 = Vars.functional_1_1_gr_54 + Vars.functional_1_1_gr_59;
NumDims.functional_1_1_gr_39 = max(NumDims.functional_1_1_gr_54, NumDims.functional_1_1_gr_59);

% Sigmoid:
Vars.functional_1_1_gr_25 = sigmoid(Vars.functional_1_1_gr_39);
NumDims.functional_1_1_gr_25 = NumDims.functional_1_1_gr_39;

% Mul:
Vars.functional_1_1_gr_44 = Vars.functional_1_1_gr_25 .* Vars.functional_1_1_gr_61;
NumDims.functional_1_1_gr_44 = max(NumDims.functional_1_1_gr_25, NumDims.functional_1_1_gr_61);

% Add:
Vars.functional_1_1_gr_41 = Vars.functional_1_1_gr_55 + Vars.functional_1_1_gr_44;
NumDims.functional_1_1_gr_41 = max(NumDims.functional_1_1_gr_55, NumDims.functional_1_1_gr_44);

% Tanh:
Vars.functional_1_1_gr_31 = tanh(Vars.functional_1_1_gr_41);
NumDims.functional_1_1_gr_31 = NumDims.functional_1_1_gr_41;

% Slice:
[Indices, NumDims.functional_1_1_gr_57] = prepareSliceArgs(Vars.functional_1_1_gr_35, Vars.const_starts__26, Vars.const_ends__27, Vars.const_axes__28, '', NumDims.functional_1_1_gr_35);
Vars.functional_1_1_gr_57 = subsref(Vars.functional_1_1_gr_35, Indices);

% Add:
Vars.functional_1_1_gr_37 = Vars.functional_1_1_gr_53 + Vars.functional_1_1_gr_57;
NumDims.functional_1_1_gr_37 = max(NumDims.functional_1_1_gr_53, NumDims.functional_1_1_gr_57);

% Sigmoid:
Vars.functional_1_1_gr_23 = sigmoid(Vars.functional_1_1_gr_37);
NumDims.functional_1_1_gr_23 = NumDims.functional_1_1_gr_37;

% Sub:
Vars.functional_1_1_gr_64 = Vars.functional_1_1_gr_63 - Vars.functional_1_1_gr_23;
NumDims.functional_1_1_gr_64 = max(NumDims.functional_1_1_gr_63, NumDims.functional_1_1_gr_23);

% Mul:
Vars.functional_1_1_gr_48 = Vars.functional_1_1_gr_64 .* Vars.functional_1_1_gr_31;
NumDims.functional_1_1_gr_48 = max(NumDims.functional_1_1_gr_64, NumDims.functional_1_1_gr_31);

% Mul:
Vars.functional_1_1_gr_46 = Vars.functional_1_1_gr_23 .* Vars.functional_1_1_gr_86;
NumDims.functional_1_1_gr_46 = max(NumDims.functional_1_1_gr_23, NumDims.functional_1_1_gr_86);

% Add:
Vars.functional_1_1_gr_15 = Vars.functional_1_1_gr_46 + Vars.functional_1_1_gr_48;
NumDims.functional_1_1_gr_15 = max(NumDims.functional_1_1_gr_46, NumDims.functional_1_1_gr_48);

% Identity:
Vars.functional_1_1_gr_12 = Vars.functional_1_1_gr_15;
NumDims.functional_1_1_gr_12 = NumDims.functional_1_1_gr_15;

% Set graph output arguments from Vars and NumDims:
cond___functional__9 = Vars.cond___functional__9;
cond___functional__9NumDims1030 = NumDims.cond___functional__9;
functional_1_1_gr_10 = Vars.functional_1_1_gr_10;
functional_1_1_gr_10NumDims1031 = NumDims.functional_1_1_gr_10;
functional_1_1_gr_12 = Vars.functional_1_1_gr_12;
functional_1_1_gr_12NumDims1032 = NumDims.functional_1_1_gr_12;
functional_1_1_gr_84 = Vars.functional_1_1_gr_84;
functional_1_1_gr_84NumDims1033 = NumDims.functional_1_1_gr_84;
functional_1_1_gr_83 = Vars.functional_1_1_gr_83;
functional_1_1_gr_83NumDims1034 = NumDims.functional_1_1_gr_83;
functional_1_1_gr_82 = Vars.functional_1_1_gr_82;
functional_1_1_gr_82NumDims1035 = NumDims.functional_1_1_gr_82;
functional_1_1_gr_15 = Vars.functional_1_1_gr_15;
functional_1_1_gr_15NumDims1036 = NumDims.functional_1_1_gr_15;
% Set output state from Vars:
state = updateStruct(state, Vars);
end

function [inputDataPerms, outputDataPerms, Training] = parseInputs(sequence_input, numDataOutputs, params, varargin)
% Function to validate inputs to Transpose_To_LessFcn:
p = inputParser;
isValidArrayInput = @(x)isnumeric(x) || isstring(x);
isValidONNXParameters = @(x)isa(x, 'ONNXParameters');
addRequired(p, 'sequence_input', isValidArrayInput);
addRequired(p, 'params', isValidONNXParameters);
addParameter(p, 'InputDataPermutation', 'auto');
addParameter(p, 'OutputDataPermutation', 'auto');
addParameter(p, 'Training', false);
parse(p, sequence_input, params, varargin{:});
inputDataPerms = p.Results.InputDataPermutation;
outputDataPerms = p.Results.OutputDataPermutation;
Training = p.Results.Training;
if isnumeric(inputDataPerms)
    inputDataPerms = {inputDataPerms};
end
if isstring(inputDataPerms) && isscalar(inputDataPerms) || ischar(inputDataPerms)
    inputDataPerms = repmat({inputDataPerms},1,1);
end
if isnumeric(outputDataPerms)
    outputDataPerms = {outputDataPerms};
end
if isstring(outputDataPerms) && isscalar(outputDataPerms) || ischar(outputDataPerms)
    outputDataPerms = repmat({outputDataPerms},1,numDataOutputs);
end
end

function [sequence_input, Training, outputDataPerms, anyDlarrayInputs] = preprocessInput(sequence_input, params, varargin)
% Parse input arguments
[inputDataPerms, outputDataPerms, Training] = parseInputs(sequence_input, 1, params, varargin{:});
anyDlarrayInputs = any(cellfun(@(x)isa(x, 'dlarray'), {sequence_input}));
% Make the input variables into unlabelled dlarrays:
sequence_input = makeUnlabeledDlarray(sequence_input);
% Permute inputs if requested:
sequence_input = permuteInputVar(sequence_input, inputDataPerms{1}, 3);
end

function [steering_output] = postprocessOutput(steering_output, outputDataPerms, anyDlarrayInputs, Training, varargin)
% Set output type:
if ~anyDlarrayInputs && ~Training
    if isdlarray(steering_output)
        steering_output = extractdata(steering_output);
    end
end
% Permute outputs if requested:
steering_output = permuteOutputVar(steering_output, outputDataPerms{1}, 2);
end


%% dlarray functions implementing ONNX operators:

function [Y, numDimsY] = onnxConcat(ONNXAxis, XCell, numDimsXArray)
% Concatentation that treats all empties the same. Necessary because
% dlarray.cat does not allow, for example, cat(1, 1x1, 1x0) because the
% second dimension sizes do not match.

% Copyright 2021 The MathWorks, Inc.

numDimsY = numDimsXArray(1);
XCell(cellfun(@isempty, XCell)) = [];
if isempty(XCell)
    Y = dlarray([]);
else
    if ONNXAxis<0
        ONNXAxis = ONNXAxis + numDimsY;
    end
    DLTAxis = numDimsY - ONNXAxis;
    Y = cat(DLTAxis, XCell{:});
end
end

function [Y, numDimsY] = onnxGather(X, ONNXIdx, ONNXAxis, numDimsX, numDimsIdx)
% Function implementing the ONNX Gather operator

% In ONNX, 'Gather' first indexes into dimension ONNXAxis of data, using
% the contents of ONNXIdx as the indices. Then, it reshapes the ONNXAxis
% into the shape of ONNXIdx.
%   Example 1:
% Suppose data has shape [2 3 4 5], ONNXIdx has shape [6 7], and axis=1.
% The result has shape [2 6 7 4 5].
%   Example 2:
% Suppose data has shape [2 3 4 5], ONNXIdx has shape [6], and axis=1.
% The result has shape [2 6 4 5].
%   Example 3:
% Suppose data has shape [2 3 4 5], ONNXIdx has shape [] (a scalar), and axis=1.
% The result has shape [2 4 5].
%
% Since we're using reverse indexing relative to ONNX, in this function
% data and ONNXIdx both have reversed dimension ordering.

% Copyright 2020-2021 The MathWorks, Inc.

numDimsY = numDimsIdx + (numDimsX - 1);
if isempty(X)
    Y = X;
    return;
end
% (1) First, do the subsref part of Gather
if ONNXAxis<0
    ONNXAxis = ONNXAxis + numDimsX;                                 % Axis can be negative. Convert it to its positive equivalent.
end
dltAxis = numDimsX - ONNXAxis;                                      % Convert axis to DLT. ONNXAxis is origin 0 and we index from the end
ONNXIdx(ONNXIdx<0) = ONNXIdx(ONNXIdx<0) + size(X, dltAxis);         % ONNXIdx can have negative components. Make them positive.
dltIdx  = extractdata(ONNXIdx) + 1;                                 % ONNXIdx is origin-0 in ONNX, so add 1 to get dltIdx
% Use subsref to index into data
Indices.subs = repmat({':'}, 1, numDimsX);
Indices.subs{dltAxis} = dltIdx(:);                                  % Index as a column to ensure the output is 1-D in the indexed dimension (for now).
Indices.type = '()';
Y = subsref(X, Indices);
% (2) Now do the reshaping part of Gather
shape = size(Y, 1:numDimsX);
if numDimsIdx == 0
    % Delete the indexed dimension
    shape(dltAxis) = [];
elseif numDimsIdx > 1
    % Reshape the indexed dimension into the shape of ONNXIdx
    shape = [shape(1:dltAxis-1) size(ONNXIdx, 1:numDimsIdx) shape(dltAxis+1:end)];
end
% Extend the shape to 2D so it's valid MATLAB
if numel(shape) < 2
    shape = [shape ones(1,2-numel(shape))];
end
Y = reshape(Y, shape);
end

function varargout = onnxLoop(M, cond, v_initial, numDimsM, numDimsCond, numDimsV_initial, Vars, NumDims, Training, state, bodyGraphFcn, numScanOutputs)

% Copyright 2020-2021 The MathWorks, Inc.

% Implements the ONNX Loop operator
if isempty(M)
    M = Inf;
end
if isempty(cond)
    cond = true;        % cond = Whether to keep going.
end
LCDs = v_initial;                            	% Loop carried dependencies
numDimsLCDs = numDimsV_initial;
ScanOutputsOneIter = cell(1,numScanOutputs);    % The scan outputs for one iteration.
numDimsScanOutputsOneIter = cell(1,numScanOutputs);
% Run the loop
i = 0;
ScanOutputs = {};
while i<M && cond
    % Call the subgraph. According to ONNX Doc: "The graph run each
    % iteration. It has 2+N inputs: (iteration_num, condition, loop carried
    % dependencies...). It has 1+N+K outputs: (condition, loop carried
    % dependencies..., scan_outputs...). Each scan_output is created by
    % concatenating the value of the specified output value at the end of
    % each iteration of the loop. It is an error if the dimensions or data
    % type of these scan_outputs change across loop iterations."

    % So our subgraph function will have outputs:
    %
    % [condition, LCDs..., scan_outputs..., numDimsCondition, numDimsLCDs..., numDimsScan_outputs..., state]
    %
    % and inputs:
    %
    % (iteration_num, condition, LCDs..., numDimsIteration_num, numDimsCondition,
    % numDimsLCDs..., Vars, NumDims, Training, State)
    %
    [cond, LCDs{:}, ScanOutputsOneIter{:}, numDimsCond, numDimsLCDs{:}, numDimsScanOutputsOneIter{:}, state] = bodyGraphFcn(...
        M, cond, LCDs{:}, numDimsM, numDimsCond, numDimsLCDs{:}, Vars, NumDims, Training, state);
    % Update ScanOutputs
    for k=1:numScanOutputs
        ScanOutputs{k}{i+1} = ScanOutputsOneIter{k};
    end
    i = i + 1;
end
if isempty(ScanOutputs)
    % There were no iterations. Set ScanOutputs to the correct number of
    % empties
    ScanOutputs = repmat({dlarray([])},1,numScanOutputs);
    numDimsScanOutputs = zeros(1,numScanOutputs);
else
    ScanOutputs = concatenateScanOutputs(ScanOutputs, numDimsScanOutputsOneIter);
    % Each scan output has numDims 1 higher than the numDims of the value returned in a single iteration:
    numDimsScanOutputs = cellfun(@(R)R+1, numDimsScanOutputsOneIter, 'UniformOutput', false);
end
% Set function outputs
v_final_and_scan_outputs        = [LCDs, ScanOutputs];
numDimsV_final_and_scan_outputs = [numDimsLCDs, numDimsScanOutputs];
varargout                       = [v_final_and_scan_outputs, numDimsV_final_and_scan_outputs, state];

    function ConcatenatedScanOutputs = concatenateScanOutputs(ScanOutputs, numDimsScanOutputs)
        % ScanOutputs{j} is a cell array of tensors which should be concatenated to
        % produce ConcatenatedScanOutputs{j}. According to the ONNX Doc equivalent
        % C-code, "user_defined_vals[j] = user_defined_val", which we interpret to
        % mean: "Concatenate ScanOutputs{j} along a new, leading dimension."
        %   Because DLT tensors have reversed dimension ordering, this means we
        %   should concatenate ScanOutputs{j} along a new, trailing dimension.
        ConcatenatedScanOutputs = ScanOutputs;
        for j=1:numel(ScanOutputs)
            % Concatenate ScanOutputs{j}
            toConcat = ScanOutputs{j};          % toConcat is a cell array.
            eltNumDims = numDimsScanOutputs{j};
            if eltNumDims > 0
                % Add a trailing dimension to each element to be concatenated
                newEltSize = [size(toConcat{1},1:eltNumDims) 1];
                toConcat = cellfun(@(x)reshape(x, newEltSize), toConcat, 'UniformOutput', false);
            end
            % concatenate along last dimension
            lastDim = eltNumDims+1;
            ConcatenatedScanOutputs{j} = cat(lastDim, toConcat{:});    % dlarray/cat
        end
    end
end

function [D, numDimsD] = onnxMatMul(A, B, numDimsA, numDimsB)
% Implements the ONNX MatMul operator.

% Copyright 2020-2023 The MathWorks, Inc.

% If B is 1-D, temporarily extend it to a row vector
if numDimsB==1
    B = B(:)';
end
maxNumDims = max(numDimsA, numDimsB);
numDimsD = maxNumDims;
if maxNumDims > 2
    % Removes dlarray formats if only one of the input dlarrays is formatted.
    if sum([isempty(dims(A)), isempty(dims(B))]) == 1
        D = pagemtimes(stripdims(B), stripdims(A));
    else
        %computes matrix product of corresponding pages of input arrays A and
        %B.
        D = pagemtimes(B, A);
    end
else
    D = B * A;
    if numDimsA==1 || numDimsB==1
        D = D(:);
        numDimsD = 1;
    end
end
end

function [Y, numDimsY] = onnxShape(X, numDimsX, startAxis, endAxis)
% Implements the ONNX Shape operator
% Return the reverse ONNX shape as a 1D column vector

% Copyright 2020-2024 The MathWorks, Inc.

switch numDimsX
    case 0
        if isempty(X)
            Y = dlarray(0);
        else
            Y = dlarray(1);
        end
    case 1
        if isempty(X)
            Y = dlarray(0);
        else
            Y = dlarray(size(X,1));
        end
    otherwise
        if(endAxis<0)
            %  If the endAxis is smaller than 0 after converting it positive,
            % the endAxis is 0
            endAxis = max(0, numDimsX + endAxis);
        end
        if(startAxis<0)
            %  If the startAxis is smaller than 0 after converting it positive,
            % the startAxis is 0
            startAxis = max(0, numDimsX + startAxis);
        end
        % transform startAxis and endAxis from 0 index to 1 index
        startAxis = startAxis + 1;
        endAxis = endAxis + 1;
        % if startAxis is larger than numDimsX or endAxis is larger than
        % numDimsX + 1, cramp it to the upper bound. The endAxis is exclusive,
        % transform it to MATLAB inclusive way
        endAxis = min(endAxis, numDimsX + 1) - 1;
        startAxis = min(startAxis, numDimsX);
        if endAxis < startAxis || endAxis == 0
            Y = dlarray(0);
        else
            Y = dlarray(fliplr(size(X, (numDimsX-endAxis+1):(numDimsX-startAxis+1)))');
        end
end
numDimsY = 1;
end

function varargout = onnxSplit13(X, ONNXaxis, splits, numSplits, numDimsX)
% Implements the ONNX Split operator

% Copyright 2021-2024 The MathWorks, Inc.

% ONNXaxis is origin 0. splits is a vector of the lengths of each segment.
% If splits is empty, instead split into segments of equal length.
if ONNXaxis<0
    ONNXaxis = ONNXaxis + numDimsX;
end
DLTAxis = numDimsX - ONNXaxis;
if isempty(splits)
    C       = size(X, DLTAxis);
    sz      = floor(C/numSplits);
    splits	= repmat(sz, 1, numSplits);
else
    splits = extractdata(splits);
end
S      = struct;
S.type = '()';
S.subs = repmat({':'}, 1, numDimsX);        % Important to use numDimsX. ndims(X) may be too small.
splitIndices = [0 cumsum(splits(:)')];
numY = numel(splitIndices)-1;
for i = 1:numY
    from            = splitIndices(i) + 1;
    to              = splitIndices(i+1);
    S.subs{DLTAxis}	= from:to;
    % The first numY outputs are the Y's. The second numY outputs are their
    % numDims. We assume all the outputs of Split have the same numDims as
    % the input.
    varargout{i}        = subsref(X, S);
    varargout{i + numY} = numDimsX;
end
end

function [Y, numDimsY] = onnxSqueeze(X, ONNXAxes, numDimsX)
% Implements the ONNX Squeeze operator

% Copyright 2020 The MathWorks, Inc.

if numDimsX == 0
    Y = X;
    numDimsY = numDimsX;
else
    % Find the new ONNX shape
    curOShape = size(X, numDimsX:-1:1);
    if isempty(ONNXAxes)
        newOShape = curOShape(curOShape ~= 1);
    else
        ONNXAxes(ONNXAxes<0) = ONNXAxes(ONNXAxes<0) + numDimsX;
        newOShape = curOShape;
        newOShape(ONNXAxes+1) = [];
    end
    % Get numDimsY from ONNX shape
    numDimsY  = numel(newOShape);
    newMShape = [fliplr(newOShape) ones(1, 2-numDimsY)];    % Append 1's to shape if numDims<2
    Y         = reshape(X, newMShape);
end
end

function [shape, numDimsY] = prepareExpandArgs(ONNXShape)
% Prepares arguments for implementing the ONNX Expand operator

%   Copyright 2020 The MathWorks, Inc.

% Broadcast X to ONNXShape. The shape of X must be compatible with ONNXShape.
ONNXShape = extractdata(ONNXShape);
shape = fliplr(ONNXShape(:)');
if numel(shape) < 2
    shape = [shape ones(1, 2-numel(shape))];
end
numDimsY = numel(ONNXShape);
end

function [S, numDimsY] = prepareSliceArgs(X, Starts, Ends, Axes, Steps, numDimsX)
% Prepares arguments for implementing the ONNX Slice operator

%   Copyright 2020 The MathWorks, Inc.

% Starts, Ends and Axes are all origin 0. Axes refer to the ONNX dimension
% ordering, but X uses the reverse, DLT ordering. Starts, Ends, Axes, and
% Steps correspond positionally. Axes and Steps may be omitted, with
% defaults described in the ONNX spec.

% Set default Axes and Steps if not supplied
if isempty(Axes)
    Axes = 0:numDimsX-1;   % All axes
end
Axes(Axes<0) = Axes(Axes<0) + numDimsX; % Handle negative Axes.
if isempty(Steps)
    Steps = ones(1, numel(Starts));
end
% Init all dims to :
S.subs = repmat({':'}, 1, numDimsX);
S.type = '()';
% Set Starts and Ends for each axis
for i = 1:numel(Axes)
    DLTDim = numDimsX - Axes(i);                                               % The DLT dim is the reverse of the ONNX dim.
    % "If a negative value is passed for any of the start or end indices,
    % it represents number of elements before the end of that dimension."
    if Starts(i) < 0
        Starts(i) = size(X,DLTDim) + Starts(i);
    end
    if Ends(i) < 0
        Ends(i) = max(-1, size(X,DLTDim) + Ends(i));                        % The -1 case is when we're slicing backward and want to include 0.
    end
    % "If the value passed to start or end is larger than the n (the number
    % of elements in this dimension), it represents n."
    if Starts(i) > size(X,DLTDim)
        Starts(i) = size(X,DLTDim);
    end
    if Ends(i) > size(X,DLTDim)
        Ends(i) = size(X,DLTDim);
    end
    if Steps(i) > 0
        S.subs{DLTDim} = 1 + (Starts(i) : Steps(i) : Ends(i)-1);            % 1 + (Origin 0 indexing with end index excluded)
    else
        S.subs{DLTDim} = 1 + (Starts(i) : Steps(i) : Ends(i)+1);            % 1 + (Origin 0 indexing with end index excluded)
    end
end
numDimsY = numDimsX;
end

function [perm, numDimsA] = prepareTransposeArgs(ONNXPerm, numDimsA)
% Prepares arguments for implementing the ONNX Transpose operator

%   Copyright 2020 The MathWorks, Inc.

if numDimsA <= 1        % Tensors of numDims 0 or 1 are unchanged by ONNX Transpose.
    perm = [];
else
    if isempty(ONNXPerm)        % Empty ONNXPerm means reverse the dimensions.
        perm = numDimsA:-1:1;
    else
        perm = numDimsA-flip(ONNXPerm);
    end
end
end

%% Utility functions:

function s = appendStructs(varargin)
% s = appendStructs(s1, s2,...). Assign all fields in s1, s2,... into s.

%   Copyright 2020 The MathWorks, Inc.

if isempty(varargin)
    s = struct;
else
    s = varargin{1};
    for i = 2:numel(varargin)
        fromstr = varargin{i};
        fs = fieldnames(fromstr);
        for j = 1:numel(fs)
            s.(fs{j}) = fromstr.(fs{j});
        end
    end
end
end

function checkInputSize(inputShape, expectedShape, inputName)

%   Copyright 2020-2021 The MathWorks, Inc.

if numel(expectedShape)==0
    % The input is a scalar
    if ~isequal(inputShape, [1 1])
        inputSizeStr = makeSizeString(inputShape);
        error(message('nnet_cnn_onnx:onnx:InputNeedsResize',inputName, "[1,1]", inputSizeStr));
    end
elseif numel(expectedShape)==1
    % The input is a vector
    if ~shapeIsColumnVector(inputShape) || ~iSizesMatch({inputShape(1)}, expectedShape)
        expectedShape{2} = 1;
        expectedSizeStr = makeSizeString(expectedShape);
        inputSizeStr = makeSizeString(inputShape);
        error(message('nnet_cnn_onnx:onnx:InputNeedsResize',inputName, expectedSizeStr, inputSizeStr));
    end
else
    % The input has 2 dimensions or more

    % The input dimensions have been reversed; flip them back to compare to the
    % expected ONNX shape.
    inputShape = fliplr(inputShape);

    % If the expected shape has fewer dims than the input shape, error.
    if numel(expectedShape) < numel(inputShape)
        expectedSizeStr = strjoin(["[", strjoin(string(expectedShape), ","), "]"], "");
        error(message('nnet_cnn_onnx:onnx:InputHasGreaterNDims', inputName, expectedSizeStr));
    end

    % Prepad the input shape with trailing ones up to the number of elements in
    % expectedShape
    inputShape = num2cell([ones(1, numel(expectedShape) - length(inputShape)) inputShape]);

    % Find the number of variable size dimensions in the expected shape
    numVariableInputs = sum(cellfun(@(x) isa(x, 'char') || isa(x, 'string'), expectedShape));

    % Find the number of input dimensions that are not in the expected shape
    % and cannot be represented by a variable dimension
    nonMatchingInputDims = setdiff(string(inputShape), string(expectedShape));
    numNonMatchingInputDims  = numel(nonMatchingInputDims) - numVariableInputs;

    expectedSizeStr = makeSizeString(expectedShape);
    inputSizeStr = makeSizeString(inputShape);
    if numNonMatchingInputDims == 0 && ~iSizesMatch(inputShape, expectedShape)
        % The actual and expected input dimensions match, but in
        % a different order. The input needs to be permuted.
        error(message('nnet_cnn_onnx:onnx:InputNeedsPermute',inputName, expectedSizeStr, inputSizeStr));
    elseif numNonMatchingInputDims > 0
        % The actual and expected input sizes do not match.
        error(message('nnet_cnn_onnx:onnx:InputNeedsResize',inputName, expectedSizeStr, inputSizeStr));
    end
end
end

function doesMatch = iSizesMatch(inputShape, expectedShape)
% Check whether the input and expected shapes match, in order.
% Size elements match if (1) the elements are equal, or (2) the expected
% size element is a variable (represented by a character vector or string)
doesMatch = true;
for i=1:numel(inputShape)
    if ~(isequal(inputShape{i},expectedShape{i}) || ischar(expectedShape{i}) || isstring(expectedShape{i}))
        doesMatch = false;
        return
    end
end
end

function sizeStr = makeSizeString(shape)
sizeStr = strjoin(["[", strjoin(string(shape), ","), "]"], "");
end

function isVec = shapeIsColumnVector(shape)
if numel(shape) == 2 && shape(2) == 1
    isVec = true;
else
    isVec = false;
end
end
function X = makeUnlabeledDlarray(X)
% Make numeric X into an unlabelled dlarray

%   Copyright 2020-2021 The MathWorks, Inc.

if isa(X, 'dlarray')
    X = stripdims(X);
elseif isnumeric(X)
    if isinteger(X)
        % Make ints double so they can combine with anything without
        % reducing precision
        X = double(X);
    end
    X = dlarray(X);
end
end

function [Vars, NumDims] = packageVariables(params, inputNames, inputValues, inputNumDims)

%   Copyright 2020 The MathWorks, Inc.

% inputNames, inputValues are cell arrays. inputRanks is a numeric vector.
Vars = appendStructs(params.Learnables, params.Nonlearnables, params.State);
NumDims = params.NumDimensions;
% Add graph inputs
for i = 1:numel(inputNames)
    Vars.(inputNames{i}) = inputValues{i};
    NumDims.(inputNames{i}) = inputNumDims(i);
end
end

function X = permuteInputVar(X, userDataPerm, onnxNDims)

%   Copyright 2020-2021 The MathWorks, Inc.
% Returns reverse-ONNX ordering
if onnxNDims == 0
    return;
elseif onnxNDims == 1 && isvector(X)
    X = X(:);
    return;
elseif isnumeric(userDataPerm)
    % Permute into reverse ONNX ordering
    if numel(userDataPerm) ~= onnxNDims
        error(message('nnet_cnn_onnx:onnx:InputPermutationSize', numel(userDataPerm), onnxNDims));
    end
    perm = fliplr(userDataPerm);
elseif isequal(userDataPerm, 'auto') && onnxNDims == 4
    % Permute MATLAB HWCN to reverse onnx (WHCN)
    perm = [2 1 3 4];
elseif isequal(userDataPerm, 'as-is')
    % Do not permute the input
    perm = 1:ndims(X);
else
    % userDataPerm is either 'none' or 'auto' with no default, which means
    % it's already in onnx ordering, so just make it reverse onnx
    perm = max(2,onnxNDims):-1:1;
end
X = permute(X, perm);
end

function Y = permuteOutputVar(Y, userDataPerm, onnxNDims)

%   Copyright 2020-2021 The MathWorks, Inc.
switch onnxNDims
    case 0
        perm = [];
    case 1
        if isnumeric(userDataPerm)
            % Use the user's permutation because Y is a column vector which
            % already matches ONNX.
            perm = userDataPerm;
        elseif isequal(userDataPerm, 'auto')
            % Treat the 1D onnx vector as a 2D column and transpose it
            perm = [2 1];
        else
            % userDataPerm is 'none'. Leave Y alone because it already
            % matches onnx.
            perm = [];
        end
    otherwise
        % ndims >= 2
        if isnumeric(userDataPerm)
            % Use the inverse of the user's permutation. This is not just the
            % flip of the permutation vector.
            perm = onnxNDims + 1 - userDataPerm;
        elseif isequal(userDataPerm, 'auto')
            if onnxNDims == 2
                % Permute reverse ONNX CN to DLT CN (do nothing)
                perm = [];
            elseif onnxNDims == 4
                % Permute reverse onnx (WHCN) to MATLAB HWCN
                perm = [2 1 3 4];
            else
                % User wants the output in ONNX ordering, so just reverse it from
                % reverse onnx
                perm = onnxNDims:-1:1;
            end
        elseif isequal(userDataPerm, 'as-is')
            % Do not permute the input
            perm = 1:ndims(Y);
        else
            % userDataPerm is 'none', so just make it reverse onnx
            perm = onnxNDims:-1:1;
        end
end
if ~isempty(perm)
    Y = permute(Y, perm);
end
end

function s = updateStruct(s, t)
% Set all existing fields in s from fields in t, ignoring extra fields in
% t.
%   Copyright 2020 The MathWorks, Inc.

for name = transpose(fieldnames(s))
    s.(name{1}) = t.(name{1});
end
end
