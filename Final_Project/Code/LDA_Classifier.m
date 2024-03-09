function [w_proj] = LDA_Classifier(omega_1,omega_2)

    m_omega_1 = mean(omega_1);  % mean of omega 1
    m_omega_2 = mean(omega_2);  % mean of omega 2
    points = cat(1,omega_1,omega_2);

    sigma_1 = cov(omega_1);   %Covariance of ω1
    sigma_2 = cov(omega_2);   %Covariance of ω2

    scatter_matrix = 0.8*sigma_1 + 0.2*sigma_2 ; % P(ω1)* S1 + P(ω2)*S2
    m0 = 0.8 * m_omega_1 + 0.2 * m_omega_2;
    Sb=0.8*(m_omega_1-m0).*(m_omega_1-m0)' + 0.2*(m_omega_2-m0).*(m_omega_2-m0)';

    [eigen_vectors_lda, ~] = eig(inv(scatter_matrix) * Sb);
    max_eigen_vector_lda = eigen_vectors_lda(:, end);

    % Project the training data onto the eigenvector
    w_proj = points * max_eigen_vector_lda;
    % Plot the scatter plot
    figure;
    scatter(w_proj(1:400, 1), ones(400,1), 'b', 'filled');
    hold on;
    scatter(w_proj(401:500, 1), ones(100,1), 'r', 'filled');
    hold off;
   
    % Set plot title and labels
    title('Scatter Plot LDA: One-dimensional projection based on the LDA algorithm');
    xlabel('x1');
    ylabel('x2');
    
    % Set plot limits
    xlim([-10, 10]);
    ylim([-10, 20]);
    % Add legend
    legend('LDA Class ω1', 'LDA Class ω2');

end

