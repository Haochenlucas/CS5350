function [a,b_a,e] = averaged_perceptron(data, r, epoch)
% Author:
% Haochen Zhang
% UU
% Fall 2017

% Initialize w and b
w = 0.02 * rand(1,67) - 0.01;
b = 0.02 * rand - 0.01;

a = 0;
b_a = 0;
e = 0;

% Run for x epoches
for i = 1: epoch
    % shuffle the data sets
    data = data(randperm(end), :);
    for j = 1 : length(data)
        y = data(j, 68);
        x = data(j, 1:67);
        if y * (w * x' + b) <= 0
            w = w + r * y * x;
            b = b + r * y;
            e = e + 1;
        end
        a = a + w;
        b_a = b_a + b;
    end
end
e = e / epoch;