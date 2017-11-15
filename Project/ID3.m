function tree = ID3(s, attributes)
% ID3 - base decision tree algorithm
%   Uses information gain to choose best attribute as node... 
%   to form a decision tree.
% On input:
%   S: the set of Examples	
%   Attributes: the set of measured attributes	
% On output:
%   tree
% Call:
%   tree = ID3(table, [0,0,0,0,...]);
% Author:
%   Haochen Zhang
%   UU
%   Fall 2017
%

labels_num = length(s(:,1));
all_same_label = 1;
% Col 11 is the label space
sum_label = sum(s(:,11));
if sum_label ~= labels_num && sum_label ~= 0
    all_same_label = 0;
end

if all_same_label
    tree = struct('value', 'null');
    switch s(1,11)
        case 1
            tree.value = 1;
        case 2
            tree.value = 2;
        case 3
            tree.value = 3;
        case 4
            tree.value = 4;
        case 5
            tree.value = 5;
        case 6
            tree.value = 6;
        case 7
            tree.value = 7;
        case 8
            tree.value = 8;
        otherwise
            tree.value = 0;
    end
else
    % Labels which attributes are available
    best = information_gain(s, attributes);
    [tree, node_num] = create_treenode(best);
    tree.value = best;
    attributes(best) = 0;
    
    % split the data into n parts
    % dependes on how many level the attribute has
    for i = 1:node_num
        sub_s = [];
        for j = 1:labels_num
            if s(i, best) == i
                sub_s = [sub_s;s(i,:)];
            end
        end
        
        if (isempty(sub_s)) || all(attributes(:) == 0)
            
        end
    end
    
    % iterate through the branch
    for i = 1:2
        if (i == 1 && isempty(s_y)) || (i == 2 && isempty(s_n))...
                || all(attributes(:) == 0)
            if i == 1 && isempty(s_y)
                if mode(s_n(:,7)) == 1
                    pruned_tree.Yes = -1;
                else
                    pruned_tree.Yes = 0;
                end
            elseif i == 2 && isempty(s_n)
                if mode(s_y(:,7)) == 1
                    pruned_tree.No = -1;
                else
                    pruned_tree.No = 0;
                end
            elseif i == 1
                if mode(s_y(:,7)) == 1
                    tree.Yes = -1;
                else
                    tree.Yes = 0;
                end
                %tree.Yes = mode(s(:,7));
            elseif i == 2
                if mode(s_n(:,7)) == 1
                    tree.No = -1;
                else
                    tree.No = 0;
                end
                %tree.No = mode(s(:,7));
            end
        else
            if i == 1
                tree.Yes = ID3(s_y, attributes);
            elseif i == 2
                tree.No = ID3(s_n, attributes);
            end
        end
    end
end









