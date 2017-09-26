function [w,b] = mar_percep_epoch(data, r, margin, w, b)
% Author:
% Haochen Zhang
% UU
% Fall 2017

t = 0;
% shuffle the data sets
data = data(randperm(end), :);
for j = 1 : length(data)
    y = data(j, 68);
    x = data(j, 1:67);
    if y * (w * x' + b) < margin
        R = r /(1 + t);
        w = w + R * y * x;
        b = b + R * y;
    end
    t = t + 1;
end