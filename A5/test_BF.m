function [acc, predict_table] = test_BF(data, trees)

error = 0;
num_tree = length(trees);

new_format = data_transformer(data, length(data));
num_labels = length(new_format(:,1));

predict_table = [];
for i = 1: num_tree
    predict = tree_predict(trees(i).tree, new_format);
    for j = 1:num_labels
        predict_table(i,j) = predict(j);
    end
end

for k = 1: num_labels
    predicts = predict_table(:,k);
    p_sum = sum(predicts);
    if p_sum >= num_tree/2
        predict_f = 1;
    else
        predict_f = 0;
    end
    if new_format(k,70000) ~= predict_f
        error = error + 1;
    end
end

error = error / length(data);
acc = 1 - error;
