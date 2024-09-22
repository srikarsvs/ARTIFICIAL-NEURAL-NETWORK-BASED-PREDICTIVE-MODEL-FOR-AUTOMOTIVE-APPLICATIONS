function perf = crossentropy(varargin)
%CROSSENTROPY Cross-entropy performance.
%
% This performance function is recommended for classification and pattern
% recognition problems.
%  
% <a href="matlab:doc crossentropy">crossentropy</a>(net,targets,outputs,perfWeights,...parameters...) calculates a
% network performance with a measure of the crossentropy of estimated and actual 
% class memberships.
%    
% Only the first three arguments are required: network, targets, and outputs.
% Performance weights and other parameters are optional. The default error weight
% is {1}, which weights the importance of all targets equally.
%  
% The target matrix must consist of N-element columns consisting of
% all zeros and a single 1 in the position of the class being represented
% by that column vector. N must be 2 or greater.  
% 
% The columns of the output matrix represent estimates of class membership,
% and should sum to 1. You can use the <a href="softmax:doc softmax">softmax</a> transfer function to produce
% such output values. Use <a href="matlab:doc patternnet">patternnet</a> to create networks that are already
% set up to use <a href="matlab:doc crossentropy">crossentropy</a> performance with a <a href="softmax:doc softmax">softmax</a> output layer. 
%  
% The cross-entropy for each pair of output/target elements is calculated as:
%  
%   ce = -t .* log(y)
%  
% The aggregate cross-entropy performance is the mean of the individual values:
%  
%   perf = sum(ce(:))/numel(ce)
%  
% Provide parameters as name and value pairs:
%  
%   'regularization' - specifies the proportion of performance attributed to 
%      weight/bias values. Use a value between 0 (the default) and 1. The
%      larger this value, the more the network is penalized for large weights,
%      and the more likely the network function avoids overfitting.
%  
%   'normalization' - takes one of the following settings:
% 
%        'none'     (the default) 
%        'standard' results in outputs and targets being normalized to [-1, +1]
%                   and therefore errors in the range [-2, +2)
%        'percent'  normalizes outputs and targets to [-0.5, 0.5] and errors to
%                   [-1, 1].
%  
% Examples:
% 
% Design a classification network with <a href="matlab:doc crossentropy">crossentropy</a> and 0.1 regularization,
% then calculation performance on the whole dataset.
%  
%   [x,t] = <a href="matlab:doc iris_dataset">iris_dataset</a>;
%   net = <a href="matlab:doc patternnet">patternnet</a>(10);
%   net.performParam.regularization = 0.1;
%   net = <a href="matlab:doc train">train</a>(net,x,t);
%   perf = <a href="matlab:doc crossentropy">crossentropy</a>(net,targets,outputs,{1},'regularization',0.1)
%  
% Set up a network to use CROSSENTROPY during training:
%  
%   net.<a href="matlab:doc nnproperty.net_performFcn">performFcn</a> = '<a href="matlab:doc crossentropy">crossentropy</a>';
%   net.<a href="matlab:doc nnproperty.net_performParam">performParam</a>.<a href="matlab:doc nnparam.regularization">regularization</a> = 0.1;
%   net.<a href="matlab:doc nnproperty.net_performParam">performParam</a>.<a href="matlab:doc nnparam.normalization">normalization</a> = 'none';
%  
% See also patternnet, softmax, mse, mae.

% Copyright 2015 The MathWorks, Inc.

% Function Info
persistent INFO;
if isempty(INFO), INFO = nnModuleInfo(mfilename); end
if (nargin == 1) && isrow(varargin{1}) && ischar(varargin{1})
  switch varargin{1}
    case 'info', perf = INFO;
    case 'defaultParam', perf = INFO.defaultParam;
  end
  return
end

% Arguments
if isa(varargin{1},'network') || isstruct(varargin{1})
  net = varargin{1};
  [args,net.performParam,nargs] = nnparam.extract_param(varargin,net.performParam);
  t = args{2};
  y = args{3};
  if (nargs < 4), ew = {1}; else ew = args{4}; end
  perf = nncalc.perform(net,t,y,ew);
else
  net.performFcn = mfilename;
  param = nn_modular_fcn.parameter_defaults(mfilename);
  [args,net.performParam,nargs] = nnparam.extract_param(varargin,param);
  t = args{1};
  y = args{2};
  if (nargs < 3), ew = {1}; end
  perf = nncalc.perform(net,t,y,ew);
end

