function [acc, mistakes] = test_SVM_ssgd(data, w)
% Author:
% Haochen Zhang
% UU
% Fall 2017

error = 0;
mistakes = [];
for j = 1 : length(data)
    label = data(j).label;
    y = label(1);
    
    features = label(2:end);
    instance = zeros(70000,1);
    for feat = 1: length(features)
        instance(features(feat)) = 1;
    end
    
    if y * w' * instance < 0
        error = error + 1;
        mistakes = [mistakes; j];
    end
end

error = error/length(data);
acc = 100 * (1 - error);
