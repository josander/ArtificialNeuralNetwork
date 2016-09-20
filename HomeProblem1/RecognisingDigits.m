%% Home problem 1.2 - Recognising digits

clc
clear all

% Parameters
distortionRate = 0.00:0.05:0.75;
patternToBeFed = 1:5;
nbrOfTrials = 100;
nbrOfUpdates = 1;

% Constants
NBR_OF_PATTERNS = 5;
NBR_OF_BITS = 160;
WIDTH_PATTERN = 10;
HEIGHT_PATTERN = 16;

% Get and store patterns
patterns = GetPatterns(NBR_OF_PATTERNS,NBR_OF_BITS,WIDTH_PATTERN);

correctProbability = zeros(length(patternToBeFed),length(distortionRate));
for iPattern = patternToBeFed;
  for iDistortion = distortionRate
    correctTrials = 0;
    for iTrial = 1:nbrOfTrials
      
      distortedPattern = DistortPattern(patterns(iPattern,:),iDistortion);
      
      % Get the weight matrix
      weights = GetWeightMatrix(patterns,NBR_OF_PATTERNS,NBR_OF_BITS);
      
      % Feed distorted pattern and update
      for iUpdates = 1:nbrOfUpdates
        outputPattern = UpdatePattern(distortedPattern,NBR_OF_BITS,weights);
        
        % Draw patterns
        %DrawPatterns(distortedPattern,WIDTH_PATTERN,HEIGHT_PATTERN,iDistortion,outputPattern);
        
        distortedPattern = outputPattern;
      end
      
      % Evaluation
      if outputPattern == patterns(iPattern,:)'
        correctTrials = correctTrials + 1;
      end
      
    end
    
    correctProbability(iPattern,find(distortionRate == iDistortion)) = correctTrials/nbrOfTrials;
    
  end
end

figure(2)
for iPattern = 1:length(patternToBeFed)
  plot(distortionRate,correctProbability(iPattern,:),'-*')
  hold on
end
hold off
N = patternToBeFed;
legendCell=strcat('P=',strtrim(cellstr(num2str(N(:)))));
legend(legendCell)
xlabel('Distortion rate')
ylabel('Probability of correct pattern')
