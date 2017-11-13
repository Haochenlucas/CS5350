function tree = ID3(s, attributes)
% ID3 - base decision tree algorithm
% Uses information gain to choose best attribute as node to form a decision
% tree.
% On input:
% S: the set of Examples	
% Label: the target attribute the prediction	
% Attributes: the set of measured attributes	
% On output:
% tree
% Call:
% tree = CS4300_agent_Astar([0,0,0,0,...], "feature", "invited");
% Author:
% Haochen Zhang
% UU
% Fall 2017
%

tree = struct('value', 'null', 'Yes', 'null', 'No', 'null');
labels_num = length(s(:,1));
all_same_label = 1;
sum_label = sum(s(:,7));
if sum_label ~= labels_num && sum_label ~= 0
    all_same_label = 0;
end

% IMPORTANT
% YES: -1 NO: 0
% YES: -1 NO: 0
% YES: -1 NO: 0
% IMPORTANT
if all_same_label
    if s(1,7) == 1
        tree.value = -1;
    else
        tree.value = 0;
    end
else
    % count_1 = 0;
    % for i = 1:labels_num
    %     if (s(i,7) == 1)
    %         count_1 = count_1 + 1;
    %     end
    % end
    % count_0 = labels_num - count_1;
    
    % entropy = - count_1 / labels_num * log2(count_1 / labels_num) - ...
    % count_0 / labels_num * log2(count_0 / labels_num);
    
    
    
    % Labels which attributes are available
    best = information_gain(s, attributes);
    tree.value = best;
    attributes(best) = 0;
    
    % split the data into two part
    s_y = [];
    s_n = [];
    for i = 1:labels_num
        if s(i, best) == 1
            s_y = [s_y;s(i,:)];
        else
            s_n = [s_n;s(i,:)];
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









