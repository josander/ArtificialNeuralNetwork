function [outputPattern] = StochasticUpdate(inputPattern,NBR_OF_BITS,weights,betaValue)

g = @(b,beta) 1/(1+exp(-2*b*beta));

outputPattern = zeros(NBR_OF_BITS,1);
for iNeuron = 1:NBR_OF_BITS
  
  bValue = 0;
  for jNeuron = 1:NBR_OF_BITS
    if iNeuron ~= jNeuron
      bValue = bValue + weights(iNeuron,jNeuron)*inputPattern(jNeuron);
    end
  end
  
  r = rand;
  if r <= g(bValue,betaValue)
    outputPattern(iNeuron) = 1;
  else
    outputPattern(iNeuron) = -1;
  end
end

end