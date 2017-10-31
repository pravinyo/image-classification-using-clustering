fprintf('Running Algorithm');
pkg load parallel;
%temporarly store the processed data
% KMeanClusterOn('images.jpg');
% KMeanClusterOn('kh (3).jpg');

files = glob('*.jpg');

parcellfun(8,@FastPro,files);

% Compute on the data present in database

data=dlmread('test.txt',',',0,0);
disp(data);
% data is Mx5 matrix
%occurance , R,G,B,name

% assuming only three groups there
mkdir(pwd(),'group1');
mkdir(pwd(),'group2');
mkdir(pwd(),'group3');

leader_1 =data(1,2:4);
leader_2 =data(3,2:4);
leader_3 =data(5,2:4);

leaders = [leader_1;leader_2;leader_3];
class=zeros(size(data,1),1);
for j=1:size(leaders,1)
	class(j)=j;
end
disp("index started after leader");
d=zeros(size(leaders,1),1);
for i=size(leaders,1):size(data,1)/2
  for j=1:size(leaders,1)
    d(j) = norm(leaders(j)-data(i+2,2:4),2);
  end
  disp(d);
	[MIN,INDEX] = min(d);
	class(i)=INDEX;
  fprintf("\nIndex %f , MIn %f",INDEX,MIN);
end

fprintf("\n -%f",class);
%tMoveFiles(class,'test2.txt');