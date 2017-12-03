folds = [];
folds(1).fold = training00;
folds(2).fold = training01;
folds(3).fold = training02;
folds(4).fold = training03;
folds(5).fold = training04;

for i = 1:5
    index_1 = mod(i+1,5)+1;
    index_2 = mod(i+2,5)+1;
    index_3 = mod(i+3,5)+1;
    index_4 = mod(i+4,5)+1;
    train_fold = [folds(index_1).fold, folds(index_2).fold, folds(index_3).fold, folds(index_4).fold];
    test_fold = folds(i);
end

% % Support Vector Machine
% % Initial learning rate:?0?{10,1,0.1,0.01,0.001,0.0001}
% % The regularization/loss tradeoff parameter:C?{10,1,0.1,0.01,0.001,0.0001}
% r = [10,1,0.1,0.01,0.001,0.0001];
% C = [10,1,0.1,0.01,0.001,0.0001];
% w = SVM_ssgd(traindata,1,r(2),C(2));
% [acc, mistakes] = test_SVM_ssgd(testdata, w);

% % Logistic regression
% % Initial learning rate:?0?{1,0.1,0.01,0.001,0.0001,0.00001}
% % Tradeoff:?2?{0.1,1,10,100,1000,10000}
% r = [1,0.1,0.01,0.001,0.0001,0.00001];
% sigma_sqr = [0.1,1,10,100,1000,10000];
% w = LR_ssgd(traindata,1,r(2),sigma_sqr(4));
% [acc, mistakes] = test_LR_ssgd(testdata, w);
    
% % Naive Bayes
% % ??{2,1.5,1.0,0.5}
% lambda = [2,1.5,1.0,0.5];
% [prior, p] = Naive_Bayes(traindata,lambda(1));
% [acc, mistakes] = test_NB(testdata, p);