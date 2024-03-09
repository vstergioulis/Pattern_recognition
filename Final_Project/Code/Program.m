function Program()
    [omega_1,omega_2] = Data_generation();
    [mean_1,sigma_1,mean_2,sigma_2] = Parameters(omega_1,omega_2);
    [Error_1] = Euclidean_Classifier(omega_1,omega_2,mean_1,mean_2);
    [Error_2] = Mahalanobis_Classifier(omega_1,omega_2,mean_1,mean_2,sigma_1,sigma_2);
    [Error_3] = Bayesian_Classifier(omega_1,omega_2,mean_1,mean_2,sigma_1,sigma_2);
    [projection] = PCA_Classifier(omega_1,omega_2);
    [Error_4] = Euclidean_classifier_PCA(omega_1,omega_2,projection);
    [projection1] = LDA_Classifier(omega_1,omega_2);
    [Error_5] = Euclidean_Classifier_LDA(projection1);
    [Error_6, Wcoeff_1] = Least_Squares_Classification(omega_1,omega_2);
    
    disp('Mean Value Maximum Likelihood Estimator for Omega 1 :')
    disp(mean_1)
    fprintf('\n');
    disp('Mean Value Maximum Likelihood Estimator for Omega 2 :')
    disp(mean_2)
    fprintf('\n');
    disp('Covariance Matrix Maximum Likelihood Estimator for Omega 1 : ')
    disp(sigma_1)
    fprintf('\n');
    disp('Covariance Matrix Maximum Likelihood Estimator for Omega 2 : ')
    disp(sigma_2)
    fprintf('\n');
    fprintf('Euclidean Classifier Error : %.2f%%\n',Error_1 );
    fprintf('Mahalanobis Classifier Error : %.2f%%\n',Error_2);
    fprintf('Bayesian Classifier Error : %.2f%%\n',Error_3);
    fprintf('Euclidean Classifier for PCA Error : %.2f%%\n',Error_4);
    fprintf('Euclidean Classifier for LDA Error : %.2f%%\n',Error_5);
    fprintf('Least Squeares Classifier for Error : %.2f%%\n',Error_6);
    [Error_7 , coeffx1 ,coeffx2 ,c] = Perceptron_Batch_Classifier(omega_1,omega_2);
    fprintf('Perceptron Batch Classifier Error : %.2f%%\n',Error_7);
    
end
