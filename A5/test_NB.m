function [acc, mistakes] = test_NB(data, p)
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
    % 1
    y_1 = 0;
    % -1
    y_n1 = 0;
    for i = 1: 70000
        if label(1) == 1
            if length(features) >= 1 && i == features(1)
               y_1 = y_1 + log(p(i,1));
               y_n1 = y_n1 + log(p(i,3));
            else
               y_1 = y_1 + log(p(i,2));
               y_n1 = y_n1 + log(p(i,4));
            end
        end
    end
    
    if (y_1 > y_n1 && y == 0) || (y_1 <= y_n1 && y == 1)
        error = error + 1;
        mistakes = [mistakes; j];
    end
end

error = error/length(data);
acc = 1 - error;

