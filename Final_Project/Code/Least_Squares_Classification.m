function [total_error, Wcoeff] = Least_Squares_Classification(omega_1,omega_2)

    X = cat(1,omega_1,omega_2); % getting all the class points to one matrix
    y = ones(500,1);   % create a 3rd pseudo - dimension for the extended matrix
    X = cat(2,X,y);   % Now we have the extended matrix
    
    for i = 1:100
        y(i+400,1) = -1 ; % Now we have created the y matrix 
    end

    cor_mat = X'*X;
    d = X'*y;
    Wcoeff = linsolve(cor_mat,d); % The coefficients of the seperation line (in order to plot it and find the error

    coeffx1 = Wcoeff(1);
    coeffx2 = Wcoeff(2);
    c = Wcoeff(3);
    sum_error = 0;
    Num_of_mis_points = 0;

    % Computing The J[w] or the Error 
    for i = 1:400
        if (coeffx1*omega_1(i,1)+ coeffx2*omega_1(i,2) + c) < 0
            sum_error = sum_error + (1 - (coeffx1*omega(i,1)+ coeffx2*omega_1(i,2) + c))^2 ; 
            Num_of_mis_points = Num_of_mis_points +1;
        end
    end

    for i = 1:100
        if (coeffx1*omega_2(i,1)+ coeffx2*omega_2(i,2) + c) > 0
            sum_error = sum_error + (-1 - (coeffx1*omega_2(i,1)+ coeffx2*omega_2(i,2) + c))^2 ; 
            Num_of_mis_points = Num_of_mis_points +1;
        end
    end

    total_error = sum_error/ Num_of_mis_points ; 
    % Plot the scatter plot
    x1 = linspace(0, 20);
    %x2 = linspace(0, 20);
    line = -(coeffx1*x1+c)/coeffx2 ;
    
    figure;
    scatter(omega_1(:, 1), omega_1(:, 2), 'b', 'filled');
    hold on;
    scatter(omega_2(:, 1), omega_2(:, 2), 'r', 'filled');
    plot(x1,line,'k-');
    hold off;
    
    % Set plot title and labels
    title('Linear Classifiers in Two-Dimensional Space:Least Squared');
    xlabel('x1');
    ylabel('x2');
    
    
    % Set plot limits
    xlim([0, 10]);
    ylim([0, 6]);

    % Add legend
    legend('Class ω1', 'Class ω2','Least Squared Line');
    
    
end

