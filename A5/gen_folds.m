load('data.mat')

folds = [];
folds(1).fold = training00;
folds(2).fold = training01;
folds(3).fold = training02;
folds(4).fold = training03;
folds(5).fold = training04;
train_fold = [];
test_fold = [];
for i = 1:5
    index_1 = mod(i+1,5)+1;
    index_2 = mod(i+2,5)+1;
    index_3 = mod(i+3,5)+1;
    index_4 = mod(i+4,5)+1;
    train_fold(i).fold = [folds(index_1).fold, folds(index_2).fold, folds(index_3).fold, folds(index_4).fold];
    test_fold(i).fold = folds(i).fold;
end
save('train_fold','train_fold');
save('test_fold','test_fold');