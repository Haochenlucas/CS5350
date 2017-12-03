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
    
    
    total_acc = total_acc + acc;
end
mean_acc = total_acc / 5;


% Support Vector Machine
% Initial learning rate:?0?{10,1,0.1,0.01,0.001,0.0001}
% The regularization/loss tradeoff parameter:C?{10,1,0.1,0.01,0.001,0.0001}
r = [10,1,0.1,0.01,0.001,0.0001];
C = [10,1,0.1,0.01,0.001,0.0001];
for i = 1:length(r)
    for j = 1:length(C)
        w = SVM_ssgd(traindata,1,r(i),C(j));
        [acc, ~] = test_SVM_ssgd(testdata, w);
        disp("accuracy with r = " + r(i) + "C = " + C(j) + ": " + acc);
    end
end


% Logistic regression
% Initial learning rate:r{1,0.1,0.01,0.001,0.0001,0.00001}
% Tradeoff:sigma_sqr{0.1,1,10,100,1000,10000}
r = [1,0.1,0.01,0.001,0.0001,0.00001];
sigma_sqr = [0.1,1,10,100,1000,10000];
for i = 1:length(r)
    for j = 1:length(sigma_sqr)
        w = LR_ssgd(traindata,1,r(i),sigma_sqr(j));
        [acc, ~] = test_LR_ssgd(testdata, w);
        disp("accuracy with r = " + r(i) + "sigma_sqr = " +...
            sigma_sqr(j) + ": " + acc);
    end
end
    

% Naive Bayes
% Hyper-parameter:  Smoothing term:(2,1.5,1.0,0.5}
lambda = [2,1.5,1.0,0.5];
for i = 1:length(r)
    [prior, p] = Naive_Bayes(traindata,lambda(i));
    [acc, ~] = test_NB(testdata, p);
    disp("accuracy with lambda = " + lambda(i) + ": " + acc);
end


% % Bagged Forests1
trees = Bagged_Forest(traindata,3,1000,100);
predict_table = [];
[acc, predict_table] = test_BF(testdata, trees);


% SVM over trees
% Learning rate??{100,10?1,10?2,10?3,10?4,10?5}
% TradeoffC?{101,100,10?1,10?2,10?3,10?4,10?5}
r = [1,0.1,0.01,0.001,0.0001,0.00001];
C = [10,1,0.1,0.01,0.001,0.0001,0.00001];
% Transform table
for i = 1: length(traindata(:,1))
    predict_table(end+1,i) = predict(i);
end
for i = 1:length(r)
    for j = 1:length(C)
        w = SVM_over_tree(predict_table,1,r(i),C(j));
        [acc, ~] = test_SVM_ssgd(testdata, w);
        disp("accuracy with r = " + r(i) + "C = " + C(j) + ": " + acc);
    end
end


% Logistic regression over trees
% Initial learning rate:?0?{100,10?1,10?2,10?3,10?4,10?5}
% Tradeoff:?2?{10?1,100,101,102,103,104}
r = [1,0.1,0.01,0.001,0.0001,0.00001];
sigma_sqr = [0.1,1,10,100,1000,10000];
for i = 1:length(r)
    for j = 1:length(C)
        w = LR_ssgd(predict_table,1,r(i),sigma_sqr(j));
        [acc, ~] = test_LR_ssgd(testdata, w);
        disp("accuracy with r = " + r(i) + "sigma_sqr = " +...
            sigma_sqr(j) + ": " + acc);
    end
end

