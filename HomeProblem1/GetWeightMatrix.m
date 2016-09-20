function weights = GetWeightMatrix(patterns,NBR_OF_PATTERNS,NBR_OF_BITS)

weights = zeros(NBR_OF_BITS,NBR_OF_BITS);
for iNeuron = 1:NBR_OF_BITS
  for jNeuron = 1:NBR_OF_BITS
    for kPatterns = 1:NBR_OF_PATTERNS
      weights(iNeuron,jNeuron) = weights(iNeuron,jNeuron) + (patterns(kPatterns,iNeuron)*patterns(kPatterns,jNeuron))/NBR_OF_BITS;
    end
  end
  weights(iNeuron,iNeuron) = 0;
end

end