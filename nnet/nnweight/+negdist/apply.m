function z = apply(w,p,param)

% Copyright 2013 The MathWorks, Inc.

S = size(w,1);
Q = size(p,2);
z = zeros(S,Q);
if (Q<S)
  p = p';
  for q=1:Q
    z(:,q) = sum(bsxfun(@minus,w,p(q,:)).^2,2);
  end
else
  w = w';
  for i=1:S
    z(i,:) = sum(bsxfun(@minus,w(:,i),p).^2,1);
  end
end
z = -sqrt(z);