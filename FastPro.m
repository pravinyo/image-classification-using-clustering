function isError = FastPro(image)

fprintf('\nRunning K-Means clustering on pixels from an image.\n\n');

%  Load an image
A = double(imread(image));


A = A / 255; % Divide by 255 so that all values are in the range 0 - 1

% Size of the image
img_size = size(A);

% Reshape the image into an Nx3 matrix where N = number of pixels.
% Each row will contain the Red, Green and Blue pixel values
% This gives us our dataset matrix X that we will use K-Means on.
X = reshape(A, img_size(1) * img_size(2), 3);

% Run your K-Means algorithm on this data
% You should try different values of K and max_iters here
K = 8;
max_iters = 7;

% When using K-Means, it is important the initialize the centroids
% randomly. 

initial_centroids = kMeansInitCentroids(X, K);

% Run K-Means
[centroids, idx,color] = runkMeans(X, initial_centroids, max_iters); %if you want to see visual effect
% add fourth parameter as true it will show you graph at each iteration of the algorithm


[M,I]=max(color(:,1));
dlmwrite('test.txt',color(I,:),'-append');


[M,I]=max(color(:,1));
[path,name,ext]=fileparts(image);
dlmwrite('test.txt',[image],'-append');
dlmwrite('test2.txt',[name path],'-append');


end