function w = SVM_ssgd(data,T,r,C)
% Author:
% Haochen Zhang
% UU
% Fall 2017

%70000+ features
w = zeros(70000,1);

% Run for T epoches
for i = 1: T
    % shuffle the data sets
    data = data(randperm(end));
    for j = 1 : length(data)
        label = data(j).label;
        y = label(1);
        features = label(2:end);
        len_feat = length(features);
        x = zeros(70000,1);
        for k = 1:len_feat
           x(features(k)) = 1;
        end
        
        if y * w' * x <= 1
            w = (1-r) * w + r * C * y * x;
        else
            w = (1-r);
        end
    end
end

