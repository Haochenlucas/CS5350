function errors = report_errors(w, b, testingdata)
% Author:
% Haochen Zhang
% UU
% Fall 2017

errors = 0;
for i = 1 : length(testingdata)
    y = testingdata(i, 68);
    x = testingdata(i, 1:67);
    if y * (w * x' + b) <= 0
        errors = errors + 1;
    end
end