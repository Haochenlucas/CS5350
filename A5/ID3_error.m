function report = ID3_error(tree, data)

report = 0;
num_data = length(data(:,1));

% IMPORTANT
% YES: -1 NO: 0
% YES: -1 NO: 0
% YES: -1 NO: 0
% IMPORTANT

for i = 1:num_data
    workingtree = tree;
    j = 1;
    while 1 == 1
        if j >= 1
            j = workingtree.value;
        end
        if j == -1
            if data(i, 7) == 0
                report = report + 1;
            end
            break;
        elseif j == 0
            if data(i, 7) == 1
                report = report + 1;
            end
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
