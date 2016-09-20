%% Home problem 1.1 - Deterministic Hopfield Model

clc
close all
clear all

% Parameters
nbrOfPatterns = [10, 20, 30, 40, 50, 75, 100, 150, 200];
nbrOfBits = [100, 200];
nbrOfTrials = 10;

results = zeros(size(nbrOfPatterns,2)*size(nbrOfBits,2),3);
text = sprintf('NbrOfPatterns \t NbrOfBits \t ErrorProb');
disp(text)

index = 0;
for iNbrOfPatterns = nbrOfPatterns
  for jNbrOfBits = nbrOfBits
    
    correctProb = 0;
    for kNbrOfTrials = 1:nbrOfTrials
      
      % Generate random patterns
      patterns = zeros(iNbrOfPatterns,jNbrOfBits);
      for iPatterns = 1:iNbrOfPatterns
        patterns(iPatterns,:) = sign(rand(jNbrOfBits,1)-0.5);
      end
      
      % Get the weight matrix
      weights = zeros(jNbrOfBits,jNbrOfBits);
      for iNeuron = 1:jNbrOfBits
        for jNeuron = 1:jNbrOfBits
          for kPatterns = 1:iNbrOfPatterns
            weights(iNeuron,jNeuron) = weights(iNeuron,jNeuron) + (patterns(kPatterns,iNeuron)*patterns(kPatterns,jNeuron))/jNbrOfBits;
          end
        end
        weights(iNeuron,iNeuron) = 0;
      end
      
      newPatterns = zeros(iNbrOfPatterns,jNbrOfBits);
      for iNeuron = 1:jNbrOfBits
        for jNeuron = 1:jNbrOfBits
          for kPatterns = 1:iNbrOfPatterns
            newPatterns(kPatterns,iNeuron) = newPatterns(kPatterns,iNeuron) + weights(iNeuron,jNeuron)*patterns(kPatterns,jNeuron);
          end
        end
      end
      newPatterns = sign(newPatterns);
      
      % Calculate the empirical probability
      correctProb = correctProb + sum(sum(patterns == newPatterns))/(size(patterns,1)*size(patterns,2));
      
    end
    
    % Calculate the empirical error probability
    correctProb = correctProb/nbrOfTrials;
    errorProb = 1-correctProb;
    text = sprintf('%10.4f \t %10.4f \t %10.4f',iNbrOfPatterns,jNbrOfBits,errorProb);
    disp(text)
    
    % Calculate the theoretical error probability
    stdDev = sqrt(iNbrOfPatterns/jNbrOfBits);
    errorProbTheory = (1-erf(1/(sqrt(2)*stdDev)))/2;
    
    % Save the results
    index = index + 1;
    results(index,:) = [iNbrOfPatterns/jNbrOfBits errorProb errorProbTheory];
    
  end
end

plot(results(:,1),results(:,2),'p',results(:,1),results(:,3),'o')
xlabel('p/N');
ylabel('Error probability');
legend('Empirical','Theory');
