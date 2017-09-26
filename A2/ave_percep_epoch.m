function [a,b_a,e] = ave_percep_epoch(data, r, w, b)
% Author:
% Haochen Zhang
% UU
% Fall 2017

a = 0;
b_a = 0;

% shuffle the data sets
data = data(randperm(end), :);
for j = 1 : length(data)
    y = data(j, 68);
    x = data(j, 1:67);
    if y * (w * x' + b) <= 0
        w = w + r * y * x;
        b = b + r * y;
    end
    a = a + w;
    b_a = b_a + b;
end