function distortedPattern = DistortPattern(pattern,distortionRate)

nbrOfBits = length(pattern);
nbrOfBitsToFlip = round(nbrOfBits*distortionRate);

% Get index of what bits that should be flipped
bitsToFlip = randsample(1:nbrOfBits,nbrOfBitsToFlip);

% Flip the bits in the distorted pattern
distortedPattern = pattern;
distortedPattern(bitsToFlip) = distortedPattern(bitsToFlip)*(-1);

end