function [omega_1,omega_2,N1,N2] = Data_generation()
    % Set the number of samples for each class
    N1 = 400; % Number of samples for class ω1
    N2 = 100; % Number of samples for class ω2
    
    % Generate the data for ω1 
    x1 = rand(N1,1)*6+2; % x1 between [2,8]
    y1 = rand(N1,1)*1+1; % x2 between [1,2] 
    
    % Generate the data for ω1 
    x2 = rand(N2,1)*2+6;    % x1 between [6,8]
    y2 = rand(N2,1)*3+2.5;  % x2 between [2.5,5.5] 
    
    % Stack each x and y coordinate for each class
    omega_1 = [x1,y1];
    omega_2 = [x2,y2];
    
    % Plot the samples
    figure;
    scatter(x1, y1, 'b', 'filled'); % Scatter plot for class ω1 (blue)
    hold on;
    scatter(x2, y2, 'r', 'filled'); % Scatter plot for class ω2 (red)
    hold off;

    % Set plot title and labels
    title('Scatter Plot of Class ω1 and Class ω2 Samples');
    xlabel('x1');
    ylabel('x2');

    % Set plot limits
    xlim([0, 10]);
    ylim([0, 6]);

    % Add legend
    legend('Class ω1', 'Class ω2');
end

