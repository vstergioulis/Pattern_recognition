function [Classification_error] = Euclidean_Classifier_LDA(projection)
    mean_1 = mean(projection(1:400));
    mean_2 = mean(projection(401:500));
    N1=400;
    N2=100;
    predictions = zeros(N1+N2,1);
    labels = [ones(N1,1);2*ones(N2,1)];
    
    for i = 1:400
        distance_1 = norm(projection(i)-mean_1);
        distance_2 = norm(projection(i)-mean_2);
        
        if distance_1<distance_2
            predictions(i)=1;
            %class_1(p) = projection(i);
            %p = p + 1;
        
        else 
            predictions(i)=2;
            %class_2(j) = projection(i) ;
            %j = j + 1;
            %misclass(k) = projection(i);
            %flag_error  = 1+flag_error;
            %k = k + 1;
        end
    end
   
    
    
    for i = 400:500
        
        distance_1 = norm(projection(i)-mean_1);
        distance_2 = norm(projection(i)-mean_2);
        
        if distance_1>distance_2
            predictions(i)=1;
            %class_1(p) = projection(i) ;
            %p = p + 1;
            %misclass(k) = projection(i);
            %k = k + 1;
        else
            predictions(i)=2;
            %class_2(j)= projection(i);
            %j=j+1;
        end
    end
    
    % Compute the classification error (%)
     Classification_error = sum(predictions ~= labels) / (N1 + N2) * 100;
   
end