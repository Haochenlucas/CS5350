function [prior, p] = Naive_Bayes(data,lambda)
% Author:
% Haochen Zhang
% UU
% Fall 2017

%70000+ features
% x(~,1): y = 1, xi = 1
% x(~,2): y = 1, xi = 0
% x(~,3): y = -1, xi = 1
% x(~,4): y = -1, xi = 0
p = zeros(70000,4);

prior = [0,0];
for j = 1 : length(data)
    label = data(j).label;
    y = label(1);
    if y == 1
        prior(1) = prior(1) + 1;
    end
    features = label(2:end);
    len_feat = length(features);
    for i = 1: 70000
        if label(1) == 1
            if length(features) >= 1 && i == features(1)
               p(features(1),1) = p(features(1),1) + 1;
               features = features(2:end);
            else
               p(i,2) = p(i,2) + 1;
            end
        else
            if length(features) >= 1 && i == features(1)
               p(features(1),3) = p(features(1),3) + 1;
               features = features(2:end);
            else
               p(i,4) = p(i,4) + 1;
            end
        end
    end
end

prior(2) = length(data) - prior(1);
p(:,1:2) = (p(:,1:2) + lambda) / (prior(1) + 2 * lambda);
p(:,3:4) = (p(:,3:4) + lambda) / (prior(2) + 2 * lambda);

prior(1) = (prior(1) + lambda) / (length(data) + 2 * lambda);
prior(2) = (prior(2) + lambda) / (length(data) + 2 * lambda);

