function dperf = forwardprop(dy,t,y,e,param)

% Copyright 2013-2014 The MathWorks, Inc.

d = (-t./(y+eps));
dperf = bsxfun(@times,dy,d);
