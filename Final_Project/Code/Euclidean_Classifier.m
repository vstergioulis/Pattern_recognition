function [Classification_error] = Euclidean_Classifier(omega_1,omega_2,mean_1,mean_2)
    
    % Classify the training set data using the minimum Euclidean distance classifier
    N1=400;
    N2=100;
    predictions = zeros(N1+N2,1);
    labels = [ones(N1,1);2*ones(N2,1)];
    
   
   
    % Classify ω1
    for i = 1:N1
        sample_1 = omega_1(i,:);
        distance_1 = norm(sample_1 - mean_1); %Euclidean distance of a point with the mean (cluster) in ω1
        distance_2 = norm(sample_1 - mean_2); %Euclidean distance of a point with the mean (cluster) in ω2

        if distance_1<distance_2
            predictions(i) = 1; %Classify to ω1
            
        else
            predictions(i) = 2; %Classify to ω2
        end
    end
     
    
    
    % Classify ω2
    for i = 1:N2
        sample_2 = omega_2(i,:);
        distance_1 = norm(sample_2 - mean_1); %Euclidean distance of a point with the mean (cluster) in ω1
        distance_2 = norm(sample_2 - mean_2); %Euclidean distance of a point with the mean (cluster) in ω2
        

        if distance_1<distance_2
            predictions(i+N1) = 1; %Classify to ω1
        else
            predictions(i+N1) = 2; %Classify to ω2
        end
    end
        
    % Find the error 
    Classification_error = sum(predictions ~= labels) / (N1 + N2) * 100;
    
    
    misclasses = find(predictions ~= labels);
    
    misclassed_1 = misclasses(misclasses <= N1);
    misclassed_2 = misclasses(misclasses > N1) - 400;
    
    % Plot the scatter plot with misclassified samples highlighted
    figure;
    scatter(omega_1(:, 1), omega_1(:, 2), 'b ', 'filled');
    hold on;
    scatter(omega_2(:, 1), omega_2(:, 2), 'r', 'filled');   
    
    %In case there are misclassified data
    if misclassed_1 ~= 0
        scatter(omega_1(misclassed_1,1),omega_1(misclassed_1,2),'k','filled')
    end
    if misclassed_2 ~=0
        scatter(omega_2(misclassed_2,1),omega_2(misclassed_2,2),'k','filled')
    end
    hold off;
   
    % Set plot title and labels
    title('Classification Results with Minimum Euclidean Distance Classifier');
    xlabel('x1');
    ylabel('x2');
    
    % Set plot limits
    xlim([0, 10]);
    ylim([0, 6]);
    
    % Add legend
    legend('Class ω1', 'Class ω2', 'Misclassified Samples');

end
    
     