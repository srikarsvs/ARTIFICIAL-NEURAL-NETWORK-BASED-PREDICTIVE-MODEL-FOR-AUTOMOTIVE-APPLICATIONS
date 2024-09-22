function dw = backstop(dz,w,p,z,param)

% Copyright 2012 The MathWorks, Inc.

% dz = SxQ
% w = SxR
% p = RxQ
% z = SxQ

[S,Q] = size(dz);
R = size(p,1);

p = reshape(p,1,R,Q); % 1xRxQ
dz = reshape(dz,S,1,Q); % Sx1xQ

z1 = bsxfun(@minus,w,p); % SxRxQ
z2 = abs(z1); % SxRxQ
z3 = max(abs(z2),[],2); % Sx1xQ

d = bsxfun(@eq,z2,z3) .* sign(z1); % SxRxQ

dw = sum(bsxfun(@times,d,dz),3); % SxR
