function [acc, mistakes] = test_SVM_tree(data, w)
% Author:
% Haochen Zhang
% UU
% Fall 2017

error = 0;
mistakes = [];
for j = 1 : length(data(1,:))
    label = data(:,j);
    y = label(length(data));
    x = label(1:end-1);
    
    if y * w' * x < 0
        error = error + 1;
        mistakes = [mistakes; j];
    end
end

error = error/length(data);
acc = 100 * (1 - error);