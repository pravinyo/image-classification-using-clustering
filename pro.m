pkg load parallel;

fprintf('\nRunning K-Means clustering on pixels from an image.\n\n');

%  Load an image
image = '1.jpg';
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


idx_new=zeros(size(idx),K);
idx_new=idx_new+1;
for i =1:size(idx)
	for j=1:K
		if idx(i) == j
			idx_new(i,j)=j;
		end
	end
end

figure

for i=1:K
	subplot(4,2,i);
	X_recovered = centroids(idx_new(:,i),:);
	X_recovered = reshape(X_recovered, img_size(1), img_size(2), 3);
	imagesc(X_recovered);
end

[M,I]=max(color(:,1));
dlmwrite('test.txt',color(I,:),'-append');


[M,I]=max(color(:,1));
[path,name,ext]=fileparts(image);
dlmwrite('test.txt',[image],'-append');
dlmwrite('test2.txt',[name image],'-append');

%{
fprintf('centroids\n %f %f %f ',centroids );
fprintf('Colors frequency and RGB\n');
fprintf(' %f %f %f %f \n' , color');


% We can now recover the image from the indices (idx) by mapping each pixel
% (specified by its index in idx) to the centroid value
X_recovered = centroids(idx,:);

% Reshape the recovered image into proper dimensions
X_recovered = reshape(X_recovered, img_size(1), img_size(2), 3);

% Display the original image 
subplot(1, 2, 1);
imagesc(A);
title('Original');

% Display compressed image side by side
subplot(1, 2, 2);
imagesc(X_recovered)
title(sprintf('Compressed, with %d colors.', K));
}%


% hsv=rgb2hsv(color(:,2:4))