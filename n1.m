delimiterOut = ',';


%--------------------------------reading train
filename = 'train.txt';
train1=0;
[train1,delimiterOut]=importdata(filename);

%--------------------------------reading test
filename1 = 'test.txt';
test1=0;
[test1,delimiterOut]=importdata(filename1);

C = train1;
train2=(C(:,2:10));

D = test1;
test2=(D(:,2:10));

%----------------------------------------label

E = C;
label2=(E(:,11));

F = D;
label3=(F(:,11));

%---------------------------------------------

Mdl = fitcknn(train2,label2,'NumNeighbors',15,'Standardize',1);
%Mdl = fitcknn(train2,label2);
mdl = predict(Mdl,test2);


%-------------------------------------------

count = 0;
for i=1:1:55
count(i) = i;
end;

count = count';
header1 = 'id';
header2 = 'label';
fid=fopen('output1.csv','w');
fprintf(fid, [ header1 ',' header2 '\n']);
fclose(fid);
M(:,1) = count;
M(:,2) = mdl;

dlmwrite('output1.csv', M(1:end,:), '-append') ;


%==================]=
count3 = 0;
for i = 1:1:55
if mdl(i)==label3(i)
count3 = count3+1;
end
end
%===================
mdl
fprintf('the accuracy is')
tot = (count3/55)*100;
tot
