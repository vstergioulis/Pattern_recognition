function [Error ,coeffx1 , coeffx2  ,c ] = Perceptron_Batch_Classifier(omega_1,omega_2)

    w0 = [ 0 -1 3]'; % wo: y=3
    r = 0.001;
    j = 1;
    
    coeffx1 = w0(1);
    coeffx2 = w0(2);
    c = w0(3);
    
    misclassed = zeros(500,1); %Misclassed will return the position of misclassified points 
    iter=0;
    Error = 100;
    
    y1 = ones(400,1);
    y2 = ones(100,1);
    omega_1 = cat(2,omega_1,y1);
    omega_2 = cat(2,omega_2,y2);
    
    %Initialization
    while (Error ~=0 )
        j=1;
        for i = 1:400
            if (coeffx1*omega_1(i,1)+ coeffx2*omega_1(i,2) + c) < 0
                misclassed(j) = i;
               
                j=j+1;
            end 
        end

        k=j;

        for i = 1:100
            if (coeffx1*omega_2(i,1)+ coeffx2*omega_2(i,2) + c) > 0
                misclassed(j) = i;
                
                j=j+1;
            end 
        end

        if k==1
            w1 = w0 - r*(sum(omega_2(misclassed(k:j-1),:)',2));
        elseif k==j && k ~=1
            w1 = w0 + r*(sum(omega_1(misclassed(1:j-1),:)',2));
        else
            w1 = w0 + r*(sum(omega_1(misclassed(1:k),:)',2)) - r*(sum(omega_2(misclassed(k:j-1),:)',2));
        end
     
        iter = iter+1;
        Error = (j-1)/500;
        fprintf('Perceptron classifier error for %d iteration: %.4f%%\n',iter,Error)
        w0=w1;
        coeffx1 = w0(1);
        coeffx2 = w0(2);
        c = w0(3);
    end
    x1 = linspace(0, 20);
    line = -(coeffx1*x1+c)/coeffx2 ;

    figure;
    scatter(omega_1(:, 1), omega_1(:, 2), 'b', 'filled');
    hold on;
    scatter(omega_2(:, 1), omega_2(:, 2), 'r', 'filled');
    plot(x1,line,'k-');
    hold off;
    
    % Set plot title and labels
    title('Linear Classifiers in Two-Dimensional Space:Perceptron Batch');
    xlabel('x1');
    ylabel('x2');
    
    % Set plot limits
    xlim([0, 10]);
    ylim([0, 6]);
    
    
    % Add legend
    legend(' Class ω1', ' Class ω2', 'Perceptron Batch Line');
 
end

        
        
    




