function dperf = forwardprop(dy,t,y,e,param)

% Copyright 2014 The MathWorks, Inc.

dperf = bsxfun(@times,dy,-2*e);