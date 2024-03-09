function [Classification_error] = Bayesian_Classifier(omega_1,omega_2,mean_1,mean_2,sigma_1,sigma_2)
    
    % Classify the training set data using the minimum Euclidean distance classifier
   
    N1=400;
    N2=100;
    predictions = zeros(N1+N2,1);
    labels = [ones(N1,1);2*ones(N2,1)];
    
    for i = 1 :N1
       
        prob_1 = (size(omega_1,1)/size(omega_1,1)+size(omega_2,1))*Probability_in_class(omega_1(i,:),mean_1,sigma_1); % Propability of x belongs to ω1
        prob_2 = (size(omega_2,1)/size(omega_1,1)+size(omega_2,1))*Probability_in_class(omega_1(i,:),mean_2,sigma_2); % Propability of x belongs to ω2
        
        if prob_1 > prob_2
            predictions(i) = 1; % Classify ω1
        else
            predictions(i) = 2; % Classify ω2
        end
    end
    
    for i = 1 : N2
        
        prob_1 = (size(omega_1,1)/size(omega_1,1)+size(omega_2,1))*Probability_in_class(omega_2(i,:),mean_1,sigma_1); % Propability of x belongs to ω1
        prob_2 = (size(omega_2,1)/size(omega_1,1)+size(omega_2,1))*Probability_in_class(omega_2(i,:),mean_2,sigma_2); % Propability of x belongs to ω2
        
        if prob_1 > prob_2
            predictions(i+400) = 1; % Classify ω1
        else
            predictions(i+400) = 2; % Classify ω2
        end
            
    end
    
    % Compute the classification error (%)
    Classification_error = sum(predictions ~= labels) / (N1 + N2) * 100;
    misclasses = find(predictions ~= labels);
    misclassed_1 = misclasses(misclasses <= N1);
    misclassed_2 = misclasses(misclasses > N1) - 400;
    
    % Plot the scatter plot with misclassified samples highlighted
    figure;
    scatter(omega_1(:, 1), omega_1(:, 2), 'b', 'filled');
    hold on;
    scatter(omega_2(:, 1), omega_2(:, 2), 'r', 'filled');
    
    %In case there are misclassified data
    if misclassed_1 ~= 0
        scatter(omega_1(misclassed_1,1),omega_1(misclassed_1,2),'k','filled')
    end
    if misclassed_2 ~= 0
        scatter(omega_2(misclassed_2,1),omega_2(misclassed_2,2),'k','filled')
    end
    hold off;
   
    % Set plot title and labels
    title('Classification Results with Maximum Bayesian Propability Classifier');
    xlabel('x1');
    ylabel('x2');
    
    % Set plot limits
    xlim([0, 10]);
    ylim([0, 6]);
    
    % Add legend
    legend('Class ω1', 'Class ω2');
    if misclassed_1 ~= 0
        legend('Class ω1', 'Class ω2','Misclassed');
    end

end