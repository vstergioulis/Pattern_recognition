function [projection] = PCA_Classifier(omega_1,omega_2)

    % Compute a new matrix for all classes
    points = cat(1,omega_1,omega_2);
    mean_of_all = mean(points);

    centered_points = points - mean_of_all;
    % Compute the covariance matrix
    matrix = cov(points) ;

    % Compute the eigenvectors and eigenvalues
    [eigenvectors, eigenvalues] = eig(matrix);

    % Sort the eigenvectors in descending order based on eigenvalues
    [~, indices] = max(diag(eigenvalues));
    eigenvectors_sorted = eigenvectors(:, indices);

    % Select the eigenval corresponding to the largest eigenvalue
    projection = centered_points * eigenvectors_sorted;
    
    % Plot the scatter plot
    figure;
    scatter(projection(1:400),  ones(400, 1), 'b', 'filled');
    hold on;
    scatter(projection(401:500), ones(100,1), 'r', 'filled');
    hold off;

    % Set plot title and labels
    title('Scatter Plot of PCA: One-dimensional projection based on the PCA algorithm');
    xlabel('x1');
    ylabel('x2');
    
    
    
    
    % Add legend
    legend('PCA Class ω1', 'PCA Class ω2');

end

