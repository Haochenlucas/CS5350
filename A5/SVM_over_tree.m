function w = SVM_over_tree(data,T,r,C)

% length of tree + 1
w = zeros(length(data),1);

% Run for T epoches
for i = 1: T
    % shuffle the data sets
    data = data(randperm(end));
    for j = 1 : length(data)
        label = data(j,:);
        y = label(length(data));
        features = label(1:end-1);
        len_feat = length(features);
        x = zeros(length(data),1,1);
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


