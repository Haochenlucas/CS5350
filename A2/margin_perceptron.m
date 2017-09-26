function [w,b,e] = margin_perceptron(data, r, margin, epoch)
% Author:
% Haochen Zhang
% UU
% Fall 2017

% Initialize w and b
w = 0.02 * rand(1,67) - 0.01;
b = 0.02 * rand - 0.01;
e = 0;
t = 0;
% Run for x epoches
for i = 1: epoch
    % shuffle the data sets
    data = data(randperm(end), :);
    for j = 1 : length(data)
        y = data(j, 68);
        x = data(j, 1:67);
        if y * (w * x' + b) < margin
            R = r /(1 + t);
            w = w + R * y * x;
            b = b + R * y;
            e = e + 1;
        end
        t = t + 1;
    end
end