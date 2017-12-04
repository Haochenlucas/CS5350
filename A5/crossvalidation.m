load('train_fold.mat')
load('test_fold.mat')

% % Support Vector Machine
% % Initial learning rate:?0?{10,1,0.1,0.01,0.001,0.0001}
% % The regularization/loss tradeoff parameter:C?{10,1,0.1,0.01,0.001,0.0001}
% SVM_cv = [];
% r = [10,1,0.1,0.01,0.001,0.0001];
% C = [10,1,0.1,0.01,0.001,0.0001];
% Accuracy_s = zeros(5,1);
% counter = 1;
% for i = 1:length(r)
%     for j = 1:length(C)
%         for k = 1:5
%             w = SVM_ssgd(train_fold(k).fold,1,r(i),C(j));
%             [acc, ~] = test_SVM_ssgd(test_fold(k).fold, w);
%             Accuracy_s(k) = acc;
%         end
%         mean_acc = mean(Accuracy_s);
%         SVM_cv(counter).r = r(i);
%         SVM_cv(counter).C = C(j);
%         SVM_cv(counter).mean_acc = mean_acc;
%         counter = counter + 1;
%     end
% end
% save('SVM_cv','SVM_cv');

% % Logistic regression
% % Initial learning rate:r{1,0.1,0.01,0.001,0.0001,0.00001}
% % Tradeoff:sigma_sqr{0.1,1,10,100,1000,10000}
% LR_cv = [];
% r = [1,0.1,0.01,0.001,0.0001,0.00001];
% sigma_sqr = [0.1,1,10,100,1000,10000];
% Accuracy_s = zeros(5,1);
% counter = 1;
% for i = 1:length(r)
%     for j = 1:length(sigma_sqr)
%         for k = 1:5
%             w = LR_ssgd(train_fold(k).fold,1,r(i),sigma_sqr(j));
%             [acc, ~] = test_LR_ssgd(test_fold(k).fold, w);
%             Accuracy_s(k) = acc;
%         end
%         mean_acc = mean(Accuracy_s);
%         LR_cv(counter).r = r(i);
%         LR_cv(counter).sigma_sqr = sigma_sqr(j);
%         LR_cv(counter).mean_acc = mean_acc;
%         counter = counter + 1;
%     end
% end
% save('LR_cv','LR_cv');
    

% % Naive Bayes
% % Hyper-parameter:  Smoothing term:(2,1.5,1.0,0.5}
% NB_cv = [];
% lambda = [2,1.5,1.0,0.5];
% Accuracy_s = zeros(5,1);
% counter = 1;
% for i = 1:length(lambda)
%     for k = 1:5
%         [prior, p] = Naive_Bayes(train_fold(k).fold,lambda(i));
%         [acc, ~] = test_NB(test_fold(k).fold, p);
%         Accuracy_s(k) = acc;
%     end
%         mean_acc = mean(Accuracy_s);
%         NB_cv(counter).lambda = lambda(i);
%         NB_cv(counter).mean_acc = mean_acc;
%         counter = counter + 1;
% end
% save('NB_cv','NB_cv');
    

% % Bagged Forests
% load('1000trees.mat')
% BF_cv = [];
% [acc, pred_train] = test_BF(traindata, trees);
% BF_cv(1).train_acc = acc;
% [acc, pred_test] = test_BF(testdata, trees);
% BF_cv(1).test_acc = acc;
% 
% Accuracy_s = zeros(5,1);
% pred_folds = [];
% for i = 1:5
%     [acc, pred_fold] = test_BF(test_fold(i).fold, trees);
%     Accuracy_s(i) = acc;
%     pred_folds(i).pred = pred_fold;
% end
% save('pred_folds','pred_folds');
% save('pred_train','pred_train');
% save('pred_test','pred_test');
% 
% BF_cv(1).mean_acc = mean(Accuracy_s);
% save('BF_cv','BF_cv');


% SVM over trees
% Learning rate??{100,10?1,10?2,10?3,10?4,10?5}
% TradeoffC?{101,100,10?1,10?2,10?3,10?4,10?5}
r = [1,0.1,0.01,0.001,0.0001,0.00001];
C = [10,1,0.1,0.01,0.001,0.0001,0.00001];
pred_train_folds = [];
for i = 1:5
    [acc, pred_fold] = test_BF(train_fold(i).fold, trees);
    pred_train_folds(i).pred = pred_fold;
end
save('pred_train_folds','pred_train_folds');

for i = 1:length(r)
    for j = 1:length(C)
        for k = 1:5
            predict_table = pred_folds(k).pred;
            % Transform table
            predict_table(end+1,:) = zeros(1,length(predict_table(1,:)));
            for i = 1: length(predict_table(1,:))
                predict_table(end,i) = test_fold(k).fold(i).label(1);
            end
            w = SVM_over_tree(predict_table,1,r(i),C(j));
            [acc, ~] = test_SVM_tree(predict_table, w);
            disp("accuracy with r = " + r(i) + "C = " + C(j) + ": " + acc);
        end
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

