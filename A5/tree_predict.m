function predict = tree_predict(tree, data)

num_data = length(data(:,1));

% IMPORTANT
% YES: -1 NO: 0
% YES: -1 NO: 0
% YES: -1 NO: 0
% IMPORTANT

num_1 = 0;
num_n1 = 0;

for i = 1:num_data
    workingtree = tree;
    j = 1;
    while 1 == 1
        if j >= 1
            j = workingtree.value;
        end
        % -1 is yes and 0 is no
        if j == -1
            predict(i) = 1;
            break;
        elseif j == 0
            predict(i) = 0;
            break;
        else
            if data(i,j) == 1
                if isa(workingtree.Yes, 'double')
                    j = workingtree.Yes;
                else
                    workingtree = workingtree.Yes;
                end
            else
                if isa(workingtree.No, 'double')
                    j = workingtree.No;
                else
                    workingtree = workingtree.No;
                end
            end
        end
    end
end
