load("data.mat");
% Support Vector Machine
load("SVM_cv.mat");
len_SVMcv = length(SVM_cv);
highest = 0;
highest_index = -1;
for i = 1:len_SVMcv
    cur = SVM_cv(i).mean_acc;
    if cur > highest
        highest = cur;
        highest_index = i;
    end
end
SVM_highest = highest;
SVM_r = SVM_cv(highest_index).r;
SVM_C = SVM_cv(highest_index).C;
w = SVM_ssgd(traindata,1,SVM_r,SVM_C);
[SVM_trainacc, ~] = test_SVM_ssgd(traindata, w);
[SVM_testacc, ~] = test_SVM_ssgd(testdata, w);
disp("******************************************");
disp("Support Vector Machine:");
disp("Best hyper-parameters: r = " + SVM_r + ", C = " + SVM_C);
disp("Average cross-validation accuracy: " + SVM_highest);
disp("Training accuracy: " + SVM_trainacc);
disp("Test accuracy: " + SVM_testacc);


% Logistic regression
load("LR_cv.mat");
len_LRcv = length(LR_cv);
highest = 0;
highest_index = -1;
for i = 1:len_LRcv
    cur = LR_cv(i).mean_acc;
    if cur > highest
        highest = cur;
        highest_index = i;
    end
end
LR_highest = highest;
LR_r = LR_cv(highest_index).r;
LR_sigma_sqr = LR_cv(highest_index).sigma_sqr;
w = LR_ssgd(traindata,1,LR_r,LR_sigma_sqr);
[LR_trainacc, ~] = test_LR_ssgd(traindata, w);
[LR_testacc, ~] = test_LR_ssgd(testdata, w);
disp("******************************************");
disp("Logistic regression:");
disp("Best hyper-parameters: r = " + LR_r + ", sigma^2 = " + LR_sigma_sqr);
disp("Average cross-validation accuracy: " + LR_highest);
disp("Training accuracy: " + LR_trainacc);
disp("Test accuracy: " + LR_testacc);


% Naive Bayes
load("NB_cv.mat");
len_NBcv = length(NB_cv);
highest = 0;
highest_index = -1;
for i = 1:len_NBcv
    cur = NB_cv(i).mean_acc;
    if cur > highest
        highest = cur;
        highest_index = i;
    end
end
NB_highest = highest;
NB_lambda = NB_cv(highest_index).lambda;
[~, p] = Naive_Bayes(traindata,NB_lambda);
[NB_trainacc, ~] = test_NB(traindata, p);
[NB_testacc, ~] = test_NB(testdata, p);
disp("******************************************");
disp("Naive Bayes:");
disp("Best hyper-parameters: all the same (somehow)");
disp("Average cross-validation accuracy: " + NB_highest);
disp("Training accuracy: " + NB_trainacc);
disp("Test accuracy: " + NB_testacc);


% Bagged Forests
load("BF_cv.mat");

disp("******************************************");
disp("Bagged Forests:");
disp("Best hyper-parameters: not applicable");
disp("Average cross-validation accuracy: " + BF_cv(1).mean_acc);
disp("Training accuracy: " + BF_cv(1).train_acc);
disp("Test accuracy: " + BF_cv(1).test_acc);


% SVM over trees
SVM_T_r = 1;
SVM_T_C = 10;
SVM_T_highest = 83.32;
SVM_T_trainacc = 90.383;
SVM_T_testacc = 82.128;
disp("******************************************");
disp("SVM over trees:");
disp("Best hyper-parameters: r = " + SVM_T_r + ", C = " + SVM_T_C);
disp("Average cross-validation accuracy: " + SVM_T_highest);
disp("Training accuracy: " + SVM_T_trainacc);
disp("Test accuracy: " + SVM_T_testacc);


% Logistic regression over trees
LR_T_r = 1;
LR_T_sigma_sqr = 1;
LR_T_highest = 80.73;
LR_T_trainacc = 81.263;
LR_T_testacc = 77.872;
disp("******************************************");
disp("Logistic regression over trees:");
disp("Best hyper-parameters: r = " + LR_T_r + ", sigma^2 = " + LR_T_sigma_sqr);
disp("Average cross-validation accuracy: " + LR_T_highest);
disp("Training accuracy: " + LR_T_trainacc);
disp("Test accuracy: " + LR_T_testacc);
