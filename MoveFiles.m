function isSuccess = MoveFiles(class,file)
%file name is present at event indices in data according our data structure
data=dlmread(file,',',0,0);
groups = ['group1\';'group2\';'group3\'];
disp(data);
for i=1:size(data,1)
  pathTo=[groups(class(i),1)];
  disp(pathTo);
  pathFrom=""+data(i);
  disp(pathFrom);
  movefile(pathFrom,pathTo);
end