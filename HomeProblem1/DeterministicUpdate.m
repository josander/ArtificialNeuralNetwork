function [outputPattern] = DeterministicUpdate(distortedPattern,NBR_OF_BITS,weights)

outputPattern = zeros(NBR_OF_BITS,1);
for iNeuron = 1:NBR_OF_BITS
  for jNeuron = 1:NBR_OF_BITS
    outputPattern(iNeuron) = outputPattern(iNeuron) + weights(iNeuron,jNeuron)*distortedPattern(jNeuron);
  end
end
outputPattern = sign(outputPattern);

end