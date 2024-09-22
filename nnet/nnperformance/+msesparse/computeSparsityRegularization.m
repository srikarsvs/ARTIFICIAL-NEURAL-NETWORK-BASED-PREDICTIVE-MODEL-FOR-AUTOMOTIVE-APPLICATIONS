function [cost,grad] = computeSparsityRegularization(calcNet, calcMode, calcHints, calcData, ...
    transferFunction, numMasks)

% Copyright 2014 The MathWorks, Inc.

Pc = calcData.Pc;
n = size(Pc,2);

mask = calcData.masks(1,1:n);
mask(isnan(mask)) = 0;
PcMasked = Pc(:,logical(mask));
[cost, grad] = iComputeSparsityRegularizationOnDataset(calcNet, calcMode, calcHints, PcMasked, transferFunction);

if (numMasks == 3)
    cost = [cost 0 0];
    for i = 2:numMasks
        mask = calcData.masks(1,(i-1)*n+1:i*n);
        mask(isnan(mask)) = 0;
        PcMasked = Pc(:,logical(mask));
        if(~isempty(PcMasked))
            cost(i) = iComputeSparsityRegularizationOnDataset(calcNet, calcMode, calcHints, PcMasked, transferFunction);
        else
            cost(i) = 0;
        end
    end
end

end


function [cost, grad] = iComputeSparsityRegularizationOnDataset(calcNet, calcMode, calcHints, Pc, transferFunction)

firstLayerIndex = iGetFirstLayerIndex(calcHints.long);
firstLayerInputSize = iGetProcessedInputSize(calcHints.long);
firstLayerSize = calcHints.layer_sizes(firstLayerIndex);
outputSize = calcHints.output_sizes(1);
sparsity = calcHints.perfParam.sparsity;
sparsityRegularization = calcHints.perfParam.sparsityRegularization;

if (sparsity == 0)
    sparsity = eps;
end
if (sparsity == 1)
    sparsity = 1 - eps;
end

wb = calcMode.getwb(calcNet,calcHints);
w1 = wb(calcHints.allWB.iwInd{firstLayerIndex});
w1 = reshape(w1,firstLayerSize,firstLayerInputSize);
b1 = wb(calcHints.allWB.bInd{firstLayerIndex});
Z2 = w1*Pc;
if(~isempty(b1))
    Z2 = bsxfun(@plus, Z2, b1);
end
A2 = feval([transferFunction '.apply'], Z2);

n = size(Pc,2);
sparsityAvg = sum(A2,2)./n;
sparsityTerm = sparsityRegularization*(-(sparsity./sparsityAvg)+((1-sparsity)./(1-sparsityAvg)));
dA2bydZ2 = feval([transferFunction '.da_dn'], Z2, A2);
delta2 = bsxfun(@times, sparsityTerm, dA2bydZ2);

W1grad = delta2*Pc'/n;
if(~isempty(b1))
    b1grad = sum(delta2,2)/n;
else
    b1grad = zeros(size(b1));
end

sparsecost = sum( (sparsity*log(sparsity./sparsityAvg)) + ...
    ((1-sparsity)*log((1-sparsity)./(1-sparsityAvg))) );

sparsegrad = [b1grad(:) ; W1grad(:) ; zeros(size(wb,1)-numel(b1)-numel(w1),1)];

cost = sparsityRegularization*sparsecost/outputSize;
grad = sparsegrad/outputSize;

end

function firstLayerIndex = iGetFirstLayerIndex(hints)
offset1 = 6 + hints(4);
offset2 = offset1 + 30;
firstLayerIndex = hints(offset2+1) + 1;
end

function processedInputSize = iGetProcessedInputSize(hints)
offset1 = 6 + hints(4);
offset2 = offset1 + 30;
offset3 = offset2 + hints(offset1 + 20);
processedInputSize = hints(offset3 + 3);
end