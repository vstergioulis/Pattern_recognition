function [probability] = Probability_in_class(points,means,covariance)
    probability = exp(-(1/2)*(points-means)*(inv(covariance))*(points-means)')/(2*pi*(det(covariance)^(1/2)));
end