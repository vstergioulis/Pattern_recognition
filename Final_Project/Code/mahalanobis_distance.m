function [distance]=mahalanobis_distance(points,mean,covariance)

    distance = ((points - mean)*(inv(covariance))*(points - mean)')^(1/2);
end
