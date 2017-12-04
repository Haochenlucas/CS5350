function w = SVM_over_tree(data,T,r,C)

% length of tree
w = zeros(length(data)-1,1);

% Run for T epoches
for i = 1: T
    % shuffle the data sets
    t = 0;
    for j = 1 : length(data(1,:))
        label = data(:,j);
        y = label(length(data));
        x = label(1:end-1);
        
        cur_r = r / (1+t);
        if y * w' * x <= 1
            w = (1-cur_r) * w + cur_r * C * y * x;
        else
            w = (1-cur_r) * w;
        end
        t = t + 1;
    end
end


