train = build_table('updated_train.txt');
attributes = ones(length(train(1,:))-1, 1);
tree = ID3(train, attributes);

disp("6 depth tree:");
error = report_error(tree, train);
disp("Error in training: " + error);
disp("Accuracy in training: " + (100 - 100 * error / 455) + "%");

test_data = build_table('updated_test.txt');
error = report_error(tree, test_data);
disp("Error in testing: " + error);
disp("Accuracy in testing: " + (100 - 100 * error / 111) + "%");

training_0 = build_table('updated_training00.txt');
training_1 = build_table('updated_training01.txt');
training_2 = build_table('updated_training02.txt');
training_3 = build_table('updated_training03.txt');

disp(newline);


Accuracy_without_training00 = zeros(5,1);
Accuracy_without_training01 = zeros(5,1);
Accuracy_without_training02 = zeros(5,1);
Accuracy_without_training03 = zeros(5,1);
Mean_accuracy = zeros(5,1);
Standrd_deviation = zeros(5,1);

for i = 1:5

    fold_wo_0 = [training_1; training_2; training_3];
    tree_wo_0 = cross_validation(fold_wo_0, attributes, i);
    error_wo_0 = report_error(tree_wo_0, training_0);
    
    fold_wo_1 = [training_0; training_2; training_3];
    tree_wo_1 = cross_validation(fold_wo_0, attributes, i);
    error_wo_1 = report_error(tree_wo_1, training_1);

    fold_wo_2 = [training_0; training_1; training_3];
    tree_wo_2 = cross_validation(fold_wo_2, attributes, i);
    error_wo_2 = report_error(tree_wo_0, training_2);

    fold_wo_3 = [training_0; training_1; training_2];
    tree_wo_3 = cross_validation(fold_wo_0, attributes, i);
    error_wo_3 = report_error(tree_wo_3, training_3);
    
    accuracy_0 = 100 - 100 * error_wo_0 / 111;
    accuracy_1 = 100 - 100 * error_wo_1 / 111;
    accuracy_2 = 100 - 100 * error_wo_2 / 111;
    accuracy_3 = 100 - 100 * error_wo_3 / 111;
    accuracy_mean = (accuracy_0 + accuracy_1 + accuracy_2 + accuracy_3) / 4;
    
    accuracy_var = (accuracy_mean - accuracy_0) ^ 2 + (accuracy_mean - accuracy_1) ^ 2 + ...
        (accuracy_mean - accuracy_2) ^ 2 + (accuracy_mean - accuracy_3) ^ 2;
    
    accuracy_sd = sqrt(accuracy_var / 4);
    
    Accuracy_without_training00(i) = accuracy_0;
    Accuracy_without_training01(i) = accuracy_1;
    Accuracy_without_training02(i) = accuracy_2;
    Accuracy_without_training03(i) = accuracy_3;
    Mean_accuracy(i) = accuracy_mean;
    Standrd_deviation(i) = accuracy_sd;
end

disp("5 depth tree trained on updated_train.txt and test with updated_test.txt:");
train_5 = build_table('updated_train.txt');
attributes = ones(length(train(1,:))-1, 1);
tree_5 = cross_validation(train, attributes,5);

test_5_data = build_table('updated_test.txt');
error = report_error(tree, test_data);
disp("Error in testing: " + error);
disp("Accuracy in testing: " + (100 - 100 * error / 111) + "%");

% depth = {'1_depth';'2_depth';'3_depth';'4_depth'; '5_depth'};
% T = table(Accuracy_without_training00,Accuracy_without_training01,Accuracy_without_training02,Accuracy_without_training03,...
%     Mean_accuracy,Standrd_deviation, 'RowNames',depth);
% disp(T);

T = table(categorical({'1_depth';'2_depth';'3_depth';'4_depth'; '5_depth'}), Accuracy_without_training00,...
    Accuracy_without_training01, Accuracy_without_training02, Accuracy_without_training03, Mean_accuracy, Standrd_deviation,...
    'VariableNames',{'depth' 'Accuracy_without_training00' 'Accuracy_without_training01' 'Accuracy_without_training02' 'Accuracy_without_training03' ...
     'Mean_accuracy' 'Standrd_deviation'});
 disp(T);

