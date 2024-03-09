function [mean_1,sigma_1,mean_2,sigma_2] = Parameters(omega_1,omega_2)
    %Calculate the mean values 
    mean_1 = mean(omega_1);
    mean_2 = mean(omega_2);
    
    %Calculate the covariances 
    sigma_1=[0 0; 0 0];
    sigma_2=[0 0; 0 0];
    
    for i =1:size(omega_1,1)
        sigma_1= sigma_1 + (omega_1(i,:)-mean_1).*(omega_1(i,:)-mean_1)';
    end
    sigma_1=sigma_1/size(omega_1,1);
    
    for i =1:size(omega_2,1)
        sigma_2= sigma_2 + (omega_2(i,:)-mean_2).*(omega_2(i,:)-mean_2)';
    end
    sigma_2 = sigma_2/size(omega_2,1);
end


    