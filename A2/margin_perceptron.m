function [w,b] = margin_perceptron(data, r, margin, epoch)
% Author:
% Haochen Zhang
% UU
% Fall 2017

% Initialize w and b
w = 0.02 * rand(1,68) - 0.01;
b = 0.02 * rand - 0.01;
t = 0;
% Run for x epoches
for i = 1: epoch
    % shuffle the data sets
    data = data(randperm(end), :);
    for j = 1 : length(data)
        y = data(j, 68);
        x = data(j, 1:67);
        if y * (w * x' + b) < margin
            w = w + r * y * x;
            b = b + r * y;
            t = t + 1;
            r = r /(1 + t);
        end
    end
end