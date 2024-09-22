function n = apply(z,s,q,param)
%NETSUM.APPLY

% Copyright 2012 The MathWorks, Inc.

if isempty(z)
  n = ones(s,q);
else
  n = z{1};
  for i=2:length(z)
    n = n .* z{i};
  end
end

