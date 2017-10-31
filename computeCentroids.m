function [centroids,color] = computeCentroids(X, idx, K)
%COMPUTECENTROIDS returns the new centroids by computing the means of the 
%data points assigned to each centroid.
%   centroids = COMPUTECENTROIDS(X, idx, K) returns the new centroids by 
%   computing the means of the data points assigned to each centroid. It is
%   given a dataset X where each row is a single data point, a vector
%   idx of centroid assignments (i.e. each entry in range [1..K]) for each
%   example, and K, the number of centroids. You should return a matrix
%   centroids, where each row of centroids is the mean of the data points
%   assigned to it.
%

% Useful variables
[m n] = size(X);

% You need to return the following variables correctly.
centroids = zeros(K, n);



%added
color=zeros(K,n+1);

for i=1:K
    indices = idx == i;
    for j=1:n
        centroids(i, j) = sum(X(:, j).*indices) / sum(indices);
    end
    %added
    color(i,:)=[sum(indices) centroids(i,:)];
end





% =============================================================


end

