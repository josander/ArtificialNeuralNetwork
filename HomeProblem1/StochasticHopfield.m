%% Home problem 1.3 - Stochastic Hopfield models

clc
close all
clear all

% Parameters
NBR_OF_BITS = 500;
nbrOfPatterns = 50:50:NBR_OF_BITS;
nbrOfTrials = 2;

results = zeros(size(nbrOfPatterns,2)*size(NBR_OF_BITS,2),3);
text = sprintf('Alpha \t ErrorProb');
disp(text)
orderParameter = zeros(length(nbrOfPatterns),1);
alpha = nbrOfPatterns/NBR_OF_BITS;

index = 0;
for iNbrOfPatterns = nbrOfPatterns
  
  correctProb = 0;
  for kNbrOfTrials = 1:nbrOfTrials
    
    % Generate random patterns
    patterns = zeros(iNbrOfPatterns,NBR_OF_BITS);
    for iPatterns = 1:iNbrOfPatterns
      patterns(iPatterns,:) = sign(rand(NBR_OF_BITS,1)-0.5);
    end
    
    % Get the weight matrix
    weights = GetWeightMatrix(patterns,iNbrOfPatterns,NBR_OF_BITS);
    
    % Update pattern
    newPatterns = zeros(iNbrOfPatterns,NBR_OF_BITS);
    for iNeuron = 1:NBR_OF_BITS
      for jNeuron = 1:NBR_OF_BITS
        for kPatterns = 1:iNbrOfPatterns
          newPatterns(kPatterns,iNeuron) = newPatterns(kPatterns,iNeuron) + weights(iNeuron,jNeuron)*patterns(kPatterns,jNeuron);
        end
      end
    end
    newPatterns = sign(newPatterns);
    
    % Calculate the empirical probability
    correctProb = correctProb + sum(sum(patterns == newPatterns))/(size(patterns,1)*size(patterns,2));
    
    % Calculate the order parameter
    for iPatterns = 1:iNbrOfPatterns
      for iNeuron = 1:NBR_OF_BITS
        orderParameter(find(iNbrOfPatterns == nbrOfPatterns)) = orderParameter(find(iNbrOfPatterns == nbrOfPatterns)) + newPatterns(iPatterns,iNeuron)*patterns(iPatterns,iNeuron)/NBR_OF_BITS;
      end
    end
    
    orderParameter(find(iNbrOfPatterns == nbrOfPatterns)) = orderParameter(find(iNbrOfPatterns == nbrOfPatterns))/iNbrOfPatterns;

    
  end
  
  % Calculate the empirical error probability
  correctProb = correctProb/nbrOfTrials;
  text = sprintf('%8.4f \t %8.4f',iNbrOfPatterns/NBR_OF_BITS,correctProb);
  disp(text)
  
  % Calculate the theoretical error probability
  stdDev = sqrt(iNbrOfPatterns/NBR_OF_BITS);
  correctProbTheory = 1-(1-erf(1/(sqrt(2)*stdDev)))/2;
  
  % Save the results
  index = index + 1;
  results(index,:) = [iNbrOfPatterns/NBR_OF_BITS correctProb correctProbTheory];
  
  orderParameter = orderParameter/nbrOfTrials;
  
end
figure(1)
plot(results(:,1),results(:,2),'p',results(:,1),results(:,3),'o')
xlabel('p/N');
ylabel('Error probability');
legend('Empirical','Theory');

figure(2)
plot(alpha,orderParameter)