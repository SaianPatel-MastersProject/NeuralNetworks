classdef Less_To_TransposeLayer1043 < nnet.layer.Layer & nnet.layer.Formattable
    % A custom layer auto-generated while importing an ONNX network.

    %#codegen
    %#ok<*PROPLC>
    %#ok<*NBRAK>
    %#ok<*INUSL>
    %#ok<*VARARG>

    properties (Learnable)
        axes_const__23
        axes_const__22
        functional_1_dens_2
        functional_1_dense_4
        functional_1_gru_1_4
        functional_1_gru_1_5
        functional_1_gru_1_M
        functional_1_gru_1_g
        functional_1_gru_1_t
        functional_1_steer_2
        functional_1_time_5
    end

    properties
        ONNXParams         % An ONNXParameters object containing parameters used by this layer.
    end

    methods
        function this = Less_To_TransposeLayer1043(name, onnxParams)
            this.Name = name;
            this.OutputNames = {'steering_output'};
            this.ONNXParams = onnxParams;
            this.axes_const__23 = onnxParams.Learnables.axes_const__23;
            this.axes_const__22 = onnxParams.Learnables.axes_const__22;
            this.functional_1_dens_2 = onnxParams.Learnables.functional_1_dens_2;
            this.functional_1_dense_4 = onnxParams.Learnables.functional_1_dense_4;
            this.functional_1_gru_1_4 = onnxParams.Learnables.functional_1_gru_1_4;
            this.functional_1_gru_1_5 = onnxParams.Learnables.functional_1_gru_1_5;
            this.functional_1_gru_1_M = onnxParams.Learnables.functional_1_gru_1_M;
            this.functional_1_gru_1_g = onnxParams.Learnables.functional_1_gru_1_g;
            this.functional_1_gru_1_t = onnxParams.Learnables.functional_1_gru_1_t;
            this.functional_1_steer_2 = onnxParams.Learnables.functional_1_steer_2;
            this.functional_1_time_5 = onnxParams.Learnables.functional_1_time_5;
        end

        function [steering_output] = predict(this, functional_1_time_27)
            if isdlarray(functional_1_time_27)
                functional_1_time_27 = stripdims(functional_1_time_27);
            end
            functional_1_time_27NumDims = 3;
            onnxParams = this.ONNXParams;
            onnxParams.Learnables.axes_const__23 = this.axes_const__23;
            onnxParams.Learnables.axes_const__22 = this.axes_const__22;
            onnxParams.Learnables.functional_1_dens_2 = this.functional_1_dens_2;
            onnxParams.Learnables.functional_1_dense_4 = this.functional_1_dense_4;
            onnxParams.Learnables.functional_1_gru_1_4 = this.functional_1_gru_1_4;
            onnxParams.Learnables.functional_1_gru_1_5 = this.functional_1_gru_1_5;
            onnxParams.Learnables.functional_1_gru_1_M = this.functional_1_gru_1_M;
            onnxParams.Learnables.functional_1_gru_1_g = this.functional_1_gru_1_g;
            onnxParams.Learnables.functional_1_gru_1_t = this.functional_1_gru_1_t;
            onnxParams.Learnables.functional_1_steer_2 = this.functional_1_steer_2;
            onnxParams.Learnables.functional_1_time_5 = this.functional_1_time_5;
            [steering_output, steering_outputNumDims] = Less_To_TransposeFcn(functional_1_time_27, functional_1_time_27NumDims, onnxParams, 'Training', false, ...
                'InputDataPermutation', {[3 2 1], ['as-is']}, ...
                'OutputDataPermutation', {['as-is'], ['as-is']});
            if any(cellfun(@(A)~isnumeric(A) && ~islogical(A), {steering_output}))
                fprintf('Runtime error in network. At least one output of custom layer ''%s'' is a non-numeric, non-logical value.\n', 'Less_To_TransposeLayer1043');
                error(message('nnet_cnn_onnx:onnx:BadCustomLayerRuntimeOutput', 'Less_To_TransposeLayer1043'));
            end
            steering_output = dlarray(single(steering_output), repmat('U', 1, max(2, steering_outputNumDims)));
            if ~coder.target('MATLAB')
                steering_output = extractdata(steering_output);
            end
        end

        function [steering_output] = forward(this, functional_1_time_27)
            if isdlarray(functional_1_time_27)
                functional_1_time_27 = stripdims(functional_1_time_27);
            end
            functional_1_time_27NumDims = 3;
            onnxParams = this.ONNXParams;
            onnxParams.Learnables.axes_const__23 = this.axes_const__23;
            onnxParams.Learnables.axes_const__22 = this.axes_const__22;
            onnxParams.Learnables.functional_1_dens_2 = this.functional_1_dens_2;
            onnxParams.Learnables.functional_1_dense_4 = this.functional_1_dense_4;
            onnxParams.Learnables.functional_1_gru_1_4 = this.functional_1_gru_1_4;
            onnxParams.Learnables.functional_1_gru_1_5 = this.functional_1_gru_1_5;
            onnxParams.Learnables.functional_1_gru_1_M = this.functional_1_gru_1_M;
            onnxParams.Learnables.functional_1_gru_1_g = this.functional_1_gru_1_g;
            onnxParams.Learnables.functional_1_gru_1_t = this.functional_1_gru_1_t;
            onnxParams.Learnables.functional_1_steer_2 = this.functional_1_steer_2;
            onnxParams.Learnables.functional_1_time_5 = this.functional_1_time_5;
            [steering_output, steering_outputNumDims] = Less_To_TransposeFcn(functional_1_time_27, functional_1_time_27NumDims, onnxParams, 'Training', true, ...
                'InputDataPermutation', {[3 2 1], ['as-is']}, ...
                'OutputDataPermutation', {['as-is'], ['as-is']});
            if any(cellfun(@(A)~isnumeric(A) && ~islogical(A), {steering_output}))
                fprintf('Runtime error in network. At least one output of custom layer ''%s'' is a non-numeric, non-logical value.\n', 'Less_To_TransposeLayer1043');
                error(message('nnet_cnn_onnx:onnx:BadCustomLayerRuntimeOutput', 'Less_To_TransposeLayer1043'));
            end
            steering_output = dlarray(single(steering_output), repmat('U', 1, max(2, steering_outputNumDims)));
            if ~coder.target('MATLAB')
                steering_output = extractdata(steering_output);
            end
        end
    end
end

function [steering_output, steering_outputNumDims, state] = Less_To_TransposeFcn(functional_1_time_27, functional_1_time_27NumDims, params, varargin)
%LESS_TO_TRANSPOSEFCN Function implementing an imported ONNX network.
%
% THIS FILE WAS AUTO-GENERATED BY importONNXFunction.
% ONNX Operator Set Version: 13
%
% Variable names in this function are taken from the original ONNX file.
%
% [STEERING_OUTPUT] = Less_To_TransposeFcn(FUNCTIONAL_1_TIME_27, PARAMS)
%			- Evaluates the imported ONNX network LESS_TO_TRANSPOSEFCN with input(s)
%			FUNCTIONAL_1_TIME_27 and the imported network parameters in PARAMS. Returns
%			network output(s) in STEERING_OUTPUT.
%
% [STEERING_OUTPUT, STATE] = Less_To_TransposeFcn(FUNCTIONAL_1_TIME_27, PARAMS)
%			- Additionally returns state variables in STATE. When training,
%			use this form and set TRAINING to true.
%
% [__] = Less_To_TransposeFcn(FUNCTIONAL_1_TIME_27, PARAMS, 'NAME1', VAL1, 'NAME2', VAL2, ...)
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
% FUNCTIONAL_1_TIME_27
%			- Input(s) to the ONNX network.
%			  The input size(s) expected by the ONNX file are:
%				  FUNCTIONAL_1_TIME_27:		[Unknown, Unknown, Unknown]				Type: FLOAT
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
%				  STEERING_OUTPUT:		[unk__208, 1]				Type: FLOAT
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
[functional_1_time_27, Training, outputDataPerms, anyDlarrayInputs] = preprocessInput(functional_1_time_27, params, varargin{:});
% Put all variables into a single struct to implement dynamic scoping:
[Vars, NumDims] = packageVariables(params, {'functional_1_time_27'}, {functional_1_time_27}, [functional_1_time_27NumDims]);
% Call the top-level graph function:
[steering_output, steering_outputNumDims, state] = Less_To_TransposeGraph1023(functional_1_time_27, NumDims.functional_1_time_27, Vars, NumDims, Training, params.State);
% Postprocess the output data
[steering_output] = postprocessOutput(steering_output, outputDataPerms, anyDlarrayInputs, Training, varargin{:});
end

function [steering_output, steering_outputNumDims1042, state] = Less_To_TransposeGraph1023(functional_1_time_27, functional_1_time_27NumDims1041, Vars, NumDims, Training, state)
% Function implementing the graph 'Less_To_TransposeGraph1023'
% Update Vars and NumDims from the graph's formal input parameters. Note that state variables are already in Vars.
Vars.functional_1_time_27 = functional_1_time_27;
NumDims.functional_1_time_27 = functional_1_time_27NumDims1041;

% Execute the operators:
% Less:
Vars.functional_1_gru__67 = Vars.const_fold_opt__135 < Vars.const_fold_opt__95;
NumDims.functional_1_gru__67 = max(NumDims.const_fold_opt__135, NumDims.const_fold_opt__95);

% And:
Vars.functional_1_gru__68 = Vars.functional_1_gru__67 & Vars.functional_1_gru__67;
NumDims.functional_1_gru__68 = max(NumDims.functional_1_gru__67, NumDims.functional_1_gru__67);

% Slice:
[Indices, NumDims.functional_1_time_25] = prepareSliceArgs(Vars.functional_1_time_27, Vars.const_starts__33, Vars.const_ends__34, Vars.const_axes__61, '', NumDims.functional_1_time_27);
Vars.functional_1_time_25 = subsref(Vars.functional_1_time_27, Indices);

% Squeeze:
[Vars.functional_1_time_26, NumDims.functional_1_time_26] = onnxSqueeze(Vars.functional_1_time_25, Vars.const_axes__61, NumDims.functional_1_time_25);

% MatMul:
[Vars.functional_1_time_9, NumDims.functional_1_time_9] = onnxMatMul(Vars.functional_1_time_26, Vars.functional_1_time_5, NumDims.functional_1_time_26, NumDims.functional_1_time_5);

% Add:
Vars.functional_1_time_4 = Vars.functional_1_time_9 + Vars.functional_1_time_1;
NumDims.functional_1_time_4 = max(NumDims.functional_1_time_9, NumDims.functional_1_time_1);

% Relu:
Vars.functional_1_time_13 = relu(Vars.functional_1_time_4);
NumDims.functional_1_time_13 = NumDims.functional_1_time_4;

% Slice:
[Indices, NumDims.functional_1_time_23] = prepareSliceArgs(Vars.functional_1_time_27, Vars.const_ends__46, Vars.const_starts__33, Vars.const_axes__61, '', NumDims.functional_1_time_27);
Vars.functional_1_time_23 = subsref(Vars.functional_1_time_27, Indices);

% Squeeze:
[Vars.functional_1_time_24, NumDims.functional_1_time_24] = onnxSqueeze(Vars.functional_1_time_23, Vars.const_axes__61, NumDims.functional_1_time_23);

% MatMul:
[Vars.functional_1_time_8, NumDims.functional_1_time_8] = onnxMatMul(Vars.functional_1_time_24, Vars.functional_1_time_5, NumDims.functional_1_time_24, NumDims.functional_1_time_5);

% Add:
Vars.functional_1_time_3 = Vars.functional_1_time_8 + Vars.functional_1_time_1;
NumDims.functional_1_time_3 = max(NumDims.functional_1_time_8, NumDims.functional_1_time_1);

% Relu:
Vars.functional_1_time_12 = relu(Vars.functional_1_time_3);
NumDims.functional_1_time_12 = NumDims.functional_1_time_3;

% Slice:
[Indices, NumDims.functional_1_time_21] = prepareSliceArgs(Vars.functional_1_time_27, Vars.const_ends__68, Vars.const_ends__46, Vars.const_axes__61, '', NumDims.functional_1_time_27);
Vars.functional_1_time_21 = subsref(Vars.functional_1_time_27, Indices);

% Squeeze:
[Vars.functional_1_time_22, NumDims.functional_1_time_22] = onnxSqueeze(Vars.functional_1_time_21, Vars.const_axes__61, NumDims.functional_1_time_21);

% MatMul:
[Vars.functional_1_time_7, NumDims.functional_1_time_7] = onnxMatMul(Vars.functional_1_time_22, Vars.functional_1_time_5, NumDims.functional_1_time_22, NumDims.functional_1_time_5);

% Add:
Vars.functional_1_time_2 = Vars.functional_1_time_7 + Vars.functional_1_time_1;
NumDims.functional_1_time_2 = max(NumDims.functional_1_time_7, NumDims.functional_1_time_1);

% Relu:
Vars.functional_1_time_11 = relu(Vars.functional_1_time_2);
NumDims.functional_1_time_11 = NumDims.functional_1_time_2;

% Slice:
[Indices, NumDims.functional_1_time_19] = prepareSliceArgs(Vars.functional_1_time_27, Vars.const_axes__61, Vars.const_ends__68, Vars.const_axes__61, '', NumDims.functional_1_time_27);
Vars.functional_1_time_19 = subsref(Vars.functional_1_time_27, Indices);

% Squeeze:
[Vars.functional_1_time_20, NumDims.functional_1_time_20] = onnxSqueeze(Vars.functional_1_time_19, Vars.const_axes__61, NumDims.functional_1_time_19);

% MatMul:
[Vars.functional_1_time_6, NumDims.functional_1_time_6] = onnxMatMul(Vars.functional_1_time_20, Vars.functional_1_time_5, NumDims.functional_1_time_20, NumDims.functional_1_time_5);

% Add:
Vars.functional_1_time_di = Vars.functional_1_time_6 + Vars.functional_1_time_1;
NumDims.functional_1_time_di = max(NumDims.functional_1_time_6, NumDims.functional_1_time_1);

% Relu:
Vars.functional_1_time_10 = relu(Vars.functional_1_time_di);
NumDims.functional_1_time_10 = NumDims.functional_1_time_di;

% Unsqueeze:
[shape, NumDims.functional_1_time_18] = prepareUnsqueezeArgs(Vars.functional_1_time_13, Vars.const_axes__61, NumDims.functional_1_time_13);
Vars.functional_1_time_18 = reshape(Vars.functional_1_time_13, shape);

% Unsqueeze:
[shape, NumDims.functional_1_time_17] = prepareUnsqueezeArgs(Vars.functional_1_time_12, Vars.const_axes__61, NumDims.functional_1_time_12);
Vars.functional_1_time_17 = reshape(Vars.functional_1_time_12, shape);

% Unsqueeze:
[shape, NumDims.functional_1_time_16] = prepareUnsqueezeArgs(Vars.functional_1_time_11, Vars.const_axes__61, NumDims.functional_1_time_11);
Vars.functional_1_time_16 = reshape(Vars.functional_1_time_11, shape);

% Unsqueeze:
[shape, NumDims.functional_1_time_15] = prepareUnsqueezeArgs(Vars.functional_1_time_10, Vars.const_axes__61, NumDims.functional_1_time_10);
Vars.functional_1_time_15 = reshape(Vars.functional_1_time_10, shape);

% Concat:
[Vars.functional_1_time_14, NumDims.functional_1_time_14] = onnxConcat(0, {Vars.functional_1_time_15, Vars.functional_1_time_16, Vars.functional_1_time_17, Vars.functional_1_time_18}, [NumDims.functional_1_time_15, NumDims.functional_1_time_16, NumDims.functional_1_time_17, NumDims.functional_1_time_18]);

% Transpose:
[perm, NumDims.functional_1_time_28] = prepareTransposeArgs(Vars.TransposePerm1024, NumDims.functional_1_time_14);
if ~isempty(perm)
    Vars.functional_1_time_28 = permute(Vars.functional_1_time_14, perm);
end

% Transpose:
[perm, NumDims.functional_1_gru_1_6] = prepareTransposeArgs(Vars.TransposePerm1025, NumDims.functional_1_time_28);
if ~isempty(perm)
    Vars.functional_1_gru_1_6 = permute(Vars.functional_1_time_28, perm);
end

% Shape:
[Vars.functional_1_gru_1_S, NumDims.functional_1_gru_1_S] = onnxShape(Vars.functional_1_time_28, NumDims.functional_1_time_28, 0, NumDims.functional_1_time_28+1);

% Cast:
if islogical(Vars.functional_1_gru_1_S)
    Vars.functional_1_gru_1_S = single(Vars.functional_1_gru_1_S);
end
Vars.functional_1_gru_1_1 = cast(int32(extractdata(Vars.functional_1_gru_1_S)), 'like', Vars.functional_1_gru_1_S);
NumDims.functional_1_gru_1_1 = NumDims.functional_1_gru_1_S;

% Slice:
[Indices, NumDims.functional_1_gru_1_s] = prepareSliceArgs(Vars.functional_1_gru_1_1, Vars.const_axes__61, Vars.const_ends__68, Vars.const_axes__61, '', NumDims.functional_1_gru_1_1);
Vars.functional_1_gru_1_s = subsref(Vars.functional_1_gru_1_1, Indices);

% Concat:
[Vars.functional_1_gru_1_z, NumDims.functional_1_gru_1_z] = onnxConcat(0, {Vars.functional_1_gru_1_s, Vars.const_fold_opt__96}, [NumDims.functional_1_gru_1_s, NumDims.const_fold_opt__96]);

% Cast:
if islogical(Vars.functional_1_gru_1_z)
    Vars.functional_1_gru_1_z = single(Vars.functional_1_gru_1_z);
end
Vars.functional_1_gru__79 = cast(int64(extractdata(Vars.functional_1_gru_1_z)), 'like', Vars.functional_1_gru_1_z);
NumDims.functional_1_gru__79 = NumDims.functional_1_gru_1_z;

% Expand:
[shape, NumDims.functional_1_gru__78] = prepareExpandArgs(Vars.functional_1_gru__79);
Vars.functional_1_gru__78 = Vars.const_fold_opt__135 + zeros(shape);

% Loop:
[Vars.functional_1_gru__60, Vars.functional_1_gru__61, Vars.functional_1_gru__62, Vars.functional_1_gru__63, Vars.functional_1_gru__64, Vars.functional_1_gru__65, NumDims.functional_1_gru__60, NumDims.functional_1_gru__61, NumDims.functional_1_gru__62, NumDims.functional_1_gru__63, NumDims.functional_1_gru__64, NumDims.functional_1_gru__65, state] = onnxLoop(Vars.functional_1_gru_1_M, Vars.functional_1_gru__68, {Vars.functional_1_gru_1_t, Vars.functional_1_gru__78, Vars.functional_1_gru_1_5, Vars.functional_1_gru_1_g, Vars.functional_1_gru_1_4}, NumDims.functional_1_gru_1_M, NumDims.functional_1_gru__68, {NumDims.functional_1_gru_1_t, NumDims.functional_1_gru__78, NumDims.functional_1_gru_1_5, NumDims.functional_1_gru_1_g, NumDims.functional_1_gru_1_4}, Vars, NumDims, Training, state, @LoopBodyGraph1026, 1);
Vars = appendStructs(Vars, state);

% Slice:
[Indices, NumDims.functional_1_gru__1] = prepareSliceArgs(Vars.functional_1_gru__65, Vars.const_starts__79, Vars.const_ends__80, Vars.const_axes__61, '', NumDims.functional_1_gru__65);
Vars.functional_1_gru__1 = subsref(Vars.functional_1_gru__65, Indices);

% Squeeze:
[Vars.functional_1_gru__2, NumDims.functional_1_gru__2] = onnxSqueeze(Vars.functional_1_gru__1, Vars.const_axes__61, NumDims.functional_1_gru__1);

% MatMul:
[Vars.functional_1_dense_5, NumDims.functional_1_dense_5] = onnxMatMul(Vars.functional_1_gru__2, Vars.functional_1_dense_4, NumDims.functional_1_gru__2, NumDims.functional_1_dense_4);

% Add:
Vars.functional_1_dense_3 = Vars.functional_1_dense_5 + Vars.functional_1_dense_1;
NumDims.functional_1_dense_3 = max(NumDims.functional_1_dense_5, NumDims.functional_1_dense_1);

% Relu:
Vars.functional_1_dense_6 = relu(Vars.functional_1_dense_3);
NumDims.functional_1_dense_6 = NumDims.functional_1_dense_3;

% MatMul:
[Vars.functional_1_dens_3, NumDims.functional_1_dens_3] = onnxMatMul(Vars.functional_1_dense_6, Vars.functional_1_dens_2, NumDims.functional_1_dense_6, NumDims.functional_1_dens_2);

% Add:
Vars.functional_1_dens_1 = Vars.functional_1_dens_3 + Vars.functional_1_dense_2;
NumDims.functional_1_dens_1 = max(NumDims.functional_1_dens_3, NumDims.functional_1_dense_2);

% Relu:
Vars.functional_1_dens_4 = relu(Vars.functional_1_dens_1);
NumDims.functional_1_dens_4 = NumDims.functional_1_dens_1;

% MatMul:
[Vars.functional_1_steer_3, NumDims.functional_1_steer_3] = onnxMatMul(Vars.functional_1_dens_4, Vars.functional_1_steer_2, NumDims.functional_1_dens_4, NumDims.functional_1_steer_2);

% Add:
Vars.functional_1_steer_1 = Vars.functional_1_steer_3 + Vars.functional_1_steerin;
NumDims.functional_1_steer_1 = max(NumDims.functional_1_steer_3, NumDims.functional_1_steerin);

% Tanh:
Vars.steering_output = tanh(Vars.functional_1_steer_1);
NumDims.steering_output = NumDims.functional_1_steer_1;

% Set graph output arguments from Vars and NumDims:
steering_output = Vars.steering_output;
steering_outputNumDims1042 = NumDims.steering_output;
% Set output state from Vars:
state = updateStruct(state, Vars);
end

function [cond___functional__9, functional_1_gru_1_w, functional_1_gru__6, functional_1_gru__74, functional_1_gru__73, functional_1_gru__72, functional_1_gru__10, cond___functional__9NumDims1034, functional_1_gru_1_wNumDims1035, functional_1_gru__6NumDims1036, functional_1_gru__74NumDims1037, functional_1_gru__73NumDims1038, functional_1_gru__72NumDims1039, functional_1_gru__10NumDims1040, state] = LoopBodyGraph1026(functional_1_gru__71, cond__78_0, functional_1_gru__75, functional_1_gru__76, functional_1_gru__74, functional_1_gru__73, functional_1_gru__72, functional_1_gru__71NumDims1027, cond__78_0NumDims1028, functional_1_gru__75NumDims1029, functional_1_gru__76NumDims1030, functional_1_gru__74NumDims1031, functional_1_gru__73NumDims1032, functional_1_gru__72NumDims1033, Vars, NumDims, Training, state)
% Function implementing the graph 'LoopBodyGraph1026'
% Update Vars and NumDims from the graph's formal input parameters. Note that state variables are already in Vars.
Vars.functional_1_gru__71 = functional_1_gru__71;
NumDims.functional_1_gru__71 = functional_1_gru__71NumDims1027;
Vars.cond__78_0 = cond__78_0;
NumDims.cond__78_0 = cond__78_0NumDims1028;
Vars.functional_1_gru__75 = functional_1_gru__75;
NumDims.functional_1_gru__75 = functional_1_gru__75NumDims1029;
Vars.functional_1_gru__76 = functional_1_gru__76;
NumDims.functional_1_gru__76 = functional_1_gru__76NumDims1030;
Vars.functional_1_gru__74 = functional_1_gru__74;
NumDims.functional_1_gru__74 = functional_1_gru__74NumDims1031;
Vars.functional_1_gru__73 = functional_1_gru__73;
NumDims.functional_1_gru__73 = functional_1_gru__73NumDims1032;
Vars.functional_1_gru__72 = functional_1_gru__72;
NumDims.functional_1_gru__72 = functional_1_gru__72NumDims1033;

% Execute the operators:
% Split:
[Vars.functional_1_gru__45, Vars.functional_1_gru__46, NumDims.functional_1_gru__45, NumDims.functional_1_gru__46] = onnxSplit13(Vars.functional_1_gru__74, 0, [], 2, NumDims.functional_1_gru__74);

% MatMul:
[Vars.functional_1_gru__16, NumDims.functional_1_gru__16] = onnxMatMul(Vars.functional_1_gru__76, Vars.functional_1_gru__72, NumDims.functional_1_gru__76, NumDims.functional_1_gru__72);

% Add:
Vars.functional_1_gru_1_w = Vars.functional_1_gru__75 + Vars.functional_1_gru__12;
NumDims.functional_1_gru_1_w = max(NumDims.functional_1_gru__75, NumDims.functional_1_gru__12);

% Gather:
[Vars.functional_1_gru__8, NumDims.functional_1_gru__8] = onnxGather(Vars.functional_1_gru_1_6, Vars.functional_1_gru__75, 0, NumDims.functional_1_gru_1_6, NumDims.functional_1_gru__75);

% MatMul:
[Vars.functional_1_gru__14, NumDims.functional_1_gru__14] = onnxMatMul(Vars.functional_1_gru__8, Vars.functional_1_gru__73, NumDims.functional_1_gru__8, NumDims.functional_1_gru__73);

% Cast:
if islogical(Vars.functional_1_gru_1_w)
    Vars.functional_1_gru_1_w = single(Vars.functional_1_gru_1_w);
end
Vars.cond___functional__7 = single(Vars.functional_1_gru_1_w);
NumDims.cond___functional__7 = NumDims.functional_1_gru_1_w;

% Cast:
if islogical(Vars.functional_1_gru__71)
    Vars.functional_1_gru__71 = single(Vars.functional_1_gru__71);
end
Vars.cond___functional__5 = single(Vars.functional_1_gru__71);
NumDims.cond___functional__5 = NumDims.functional_1_gru__71;

% Less:
Vars.cond___functional__3 = Vars.cond___functional__5 < Vars.const_fold_opt__137;
NumDims.cond___functional__3 = max(NumDims.cond___functional__5, NumDims.const_fold_opt__137);

% Less:
Vars.cond___functional__1 = Vars.cond___functional__7 < Vars.const_fold_opt__97;
NumDims.cond___functional__1 = max(NumDims.cond___functional__7, NumDims.const_fold_opt__97);

% And:
Vars.cond___functional__9 = Vars.cond___functional__3 & Vars.cond___functional__1;
NumDims.cond___functional__9 = max(NumDims.cond___functional__3, NumDims.cond___functional__1);

% Squeeze:
[Vars.functional_1_gru__24, NumDims.functional_1_gru__24] = onnxSqueeze(Vars.functional_1_gru__45, Vars.axes_const__23, NumDims.functional_1_gru__45);

% Add:
Vars.functional_1_gru__28 = Vars.functional_1_gru__14 + Vars.functional_1_gru__24;
NumDims.functional_1_gru__28 = max(NumDims.functional_1_gru__14, NumDims.functional_1_gru__24);

% Split:
[Vars.functional_1_gru__48, Vars.functional_1_gru__49, Vars.functional_1_gru__50, NumDims.functional_1_gru__48, NumDims.functional_1_gru__49, NumDims.functional_1_gru__50] = onnxSplit13(Vars.functional_1_gru__28, -1, [], 3, NumDims.functional_1_gru__28);

% Squeeze:
[Vars.functional_1_gru__26, NumDims.functional_1_gru__26] = onnxSqueeze(Vars.functional_1_gru__46, Vars.axes_const__22, NumDims.functional_1_gru__46);

% Add:
Vars.functional_1_gru__30 = Vars.functional_1_gru__16 + Vars.functional_1_gru__26;
NumDims.functional_1_gru__30 = max(NumDims.functional_1_gru__16, NumDims.functional_1_gru__26);

% Slice:
[Indices, NumDims.functional_1_gru__56] = prepareSliceArgs(Vars.functional_1_gru__30, Vars.const_starts__24, Vars.const_ends__25, Vars.const_axes__26, '', NumDims.functional_1_gru__30);
Vars.functional_1_gru__56 = subsref(Vars.functional_1_gru__30, Indices);

% Slice:
[Indices, NumDims.functional_1_gru__54] = prepareSliceArgs(Vars.functional_1_gru__30, Vars.const_starts__27, Vars.const_ends__28, Vars.const_axes__29, '', NumDims.functional_1_gru__30);
Vars.functional_1_gru__54 = subsref(Vars.functional_1_gru__30, Indices);

% Add:
Vars.functional_1_gru__34 = Vars.functional_1_gru__49 + Vars.functional_1_gru__54;
NumDims.functional_1_gru__34 = max(NumDims.functional_1_gru__49, NumDims.functional_1_gru__54);

% Sigmoid:
Vars.functional_1_gru__22 = sigmoid(Vars.functional_1_gru__34);
NumDims.functional_1_gru__22 = NumDims.functional_1_gru__34;

% Mul:
Vars.functional_1_gru__39 = Vars.functional_1_gru__22 .* Vars.functional_1_gru__56;
NumDims.functional_1_gru__39 = max(NumDims.functional_1_gru__22, NumDims.functional_1_gru__56);

% Add:
Vars.functional_1_gru__36 = Vars.functional_1_gru__50 + Vars.functional_1_gru__39;
NumDims.functional_1_gru__36 = max(NumDims.functional_1_gru__50, NumDims.functional_1_gru__39);

% Relu:
Vars.functional_1_gru__18 = relu(Vars.functional_1_gru__36);
NumDims.functional_1_gru__18 = NumDims.functional_1_gru__36;

% Slice:
[Indices, NumDims.functional_1_gru__52] = prepareSliceArgs(Vars.functional_1_gru__30, Vars.const_starts__30, Vars.const_ends__31, Vars.const_axes__32, '', NumDims.functional_1_gru__30);
Vars.functional_1_gru__52 = subsref(Vars.functional_1_gru__30, Indices);

% Add:
Vars.functional_1_gru__32 = Vars.functional_1_gru__48 + Vars.functional_1_gru__52;
NumDims.functional_1_gru__32 = max(NumDims.functional_1_gru__48, NumDims.functional_1_gru__52);

% Sigmoid:
Vars.functional_1_gru__20 = sigmoid(Vars.functional_1_gru__32);
NumDims.functional_1_gru__20 = NumDims.functional_1_gru__32;

% Sub:
Vars.functional_1_gru__59 = Vars.functional_1_gru__58 - Vars.functional_1_gru__20;
NumDims.functional_1_gru__59 = max(NumDims.functional_1_gru__58, NumDims.functional_1_gru__20);

% Mul:
Vars.functional_1_gru__43 = Vars.functional_1_gru__59 .* Vars.functional_1_gru__18;
NumDims.functional_1_gru__43 = max(NumDims.functional_1_gru__59, NumDims.functional_1_gru__18);

% Mul:
Vars.functional_1_gru__41 = Vars.functional_1_gru__20 .* Vars.functional_1_gru__76;
NumDims.functional_1_gru__41 = max(NumDims.functional_1_gru__20, NumDims.functional_1_gru__76);

% Add:
Vars.functional_1_gru__6 = Vars.functional_1_gru__41 + Vars.functional_1_gru__43;
NumDims.functional_1_gru__6 = max(NumDims.functional_1_gru__41, NumDims.functional_1_gru__43);

% Identity:
Vars.functional_1_gru__10 = Vars.functional_1_gru__6;
NumDims.functional_1_gru__10 = NumDims.functional_1_gru__6;

% Set graph output arguments from Vars and NumDims:
cond___functional__9 = Vars.cond___functional__9;
cond___functional__9NumDims1034 = NumDims.cond___functional__9;
functional_1_gru_1_w = Vars.functional_1_gru_1_w;
functional_1_gru_1_wNumDims1035 = NumDims.functional_1_gru_1_w;
functional_1_gru__6 = Vars.functional_1_gru__6;
functional_1_gru__6NumDims1036 = NumDims.functional_1_gru__6;
functional_1_gru__74 = Vars.functional_1_gru__74;
functional_1_gru__74NumDims1037 = NumDims.functional_1_gru__74;
functional_1_gru__73 = Vars.functional_1_gru__73;
functional_1_gru__73NumDims1038 = NumDims.functional_1_gru__73;
functional_1_gru__72 = Vars.functional_1_gru__72;
functional_1_gru__72NumDims1039 = NumDims.functional_1_gru__72;
functional_1_gru__10 = Vars.functional_1_gru__10;
functional_1_gru__10NumDims1040 = NumDims.functional_1_gru__10;
% Set output state from Vars:
state = updateStruct(state, Vars);
end

function [inputDataPerms, outputDataPerms, Training] = parseInputs(functional_1_time_27, numDataOutputs, params, varargin)
% Function to validate inputs to Less_To_TransposeFcn:
p = inputParser;
isValidArrayInput = @(x)isnumeric(x) || isstring(x);
isValidONNXParameters = @(x)isa(x, 'ONNXParameters');
addRequired(p, 'functional_1_time_27', isValidArrayInput);
addRequired(p, 'params', isValidONNXParameters);
addParameter(p, 'InputDataPermutation', 'auto');
addParameter(p, 'OutputDataPermutation', 'auto');
addParameter(p, 'Training', false);
parse(p, functional_1_time_27, params, varargin{:});
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

function [functional_1_time_27, Training, outputDataPerms, anyDlarrayInputs] = preprocessInput(functional_1_time_27, params, varargin)
% Parse input arguments
[inputDataPerms, outputDataPerms, Training] = parseInputs(functional_1_time_27, 1, params, varargin{:});
anyDlarrayInputs = any(cellfun(@(x)isa(x, 'dlarray'), {functional_1_time_27}));
% Make the input variables into unlabelled dlarrays:
functional_1_time_27 = makeUnlabeledDlarray(functional_1_time_27);
% Permute inputs if requested:
functional_1_time_27 = permuteInputVar(functional_1_time_27, inputDataPerms{1}, 3);
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

function [newShape, numDimsY] = prepareUnsqueezeArgs(X, ONNXAxes, numDimsX)
% Prepares arguments for implementing the ONNX Unsqueeze operator

%   Copyright 2020-2021 The MathWorks, Inc.

numDimsY = numDimsX + numel(ONNXAxes);
ONNXAxes = extractdata(ONNXAxes);
ONNXAxes(ONNXAxes<0) = ONNXAxes(ONNXAxes<0) + numDimsY;
ONNXAxes = sort(ONNXAxes);                                              % increasing order
if numDimsY == 1
    newShape = size(X);
else
    DLTAxes  = flip(numDimsY - ONNXAxes);                                  % increasing order
    newShape = ones(1, numDimsY);
    posToSet = setdiff(1:numDimsY, DLTAxes, 'stable');
    newShape(posToSet) = size(X, 1:numel(posToSet));
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
