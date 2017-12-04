function w = SVM_ssgd(data,T,r,C)

%70000+ features
w = zeros(70000,1);

% Run for T epoches
for i = 1: T
    % shuffle the data sets
    data = data(randperm(end));
    t = 0;
    for j = 1 : length(data)
        label = data(j).label;
        y = label(1);
        features = label(2:end);
        len_feat = length(features);
        x = zeros(70000,1);
        for k = 1:len_feat
           x(features(k)) = 1;
        end
        
        cur_r = r / (1+t);
        if y * w' * x <= 1
            w = (1-cur_r) * w + cur_r * C * y * x;
        else
            w = (1-cur_r) * w;
        end
        t = t + 1;
    end
end

