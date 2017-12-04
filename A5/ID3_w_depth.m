function pruned_tree = ID3_w_depth(s, attributes, depth)

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
depth = depth - 1;
pruned_tree = struct('value', 'null', 'Yes', 'null', 'No', 'null');
labels_num = length(s(:,1));
all_same_label = 1;
sum_label = sum(s(:,70000));
if sum_label ~= labels_num && sum_label ~= 0 && labels_num ~= 0
    all_same_label = 0;
end

% IMPORTANT
% YES: -1 NO: 0
% YES: -1 NO: 0
% YES: -1 NO: 0
% IMPORTANT
if all_same_label
    switch s(1,70000) 
        case 1
            pruned_tree.value = -1;
        case -1
            pruned_tree.value = 0;
        otherwise
            pruned_tree.value = 0;
    end
else
    % Labels which attributes are available
    best = information_gain(s, attributes);
    pruned_tree.value = best;
    attributes(best) = 0;
    
    for i = 1:2
        sub_s = [];
        for j = 1:labels_num
            if i == 1
                if s(j, best) == i
                    sub_s = [sub_s;s(j,:)];
                end
            else
                if s(j, best) == 0
                    sub_s = [sub_s;s(j,:)];
                end
            end
        end
        
        if isempty(sub_s)
            switch i
                case 1
                    if mode(s(:,70000)) == 1
                        pruned_tree.Yes = -1;
                    else
                        pruned_tree.Yes = 0;
                    end
                case 2
                    if mode(s(:,70000)) == 1
                        pruned_tree.No = -1;
                    else
                        pruned_tree.No = 0;
                    end
            end
        elseif all(attributes(:) == 0) || depth == 0
            switch i
                case 1
                    if mode(sub_s(:,70000)) == 1
                        pruned_tree.Yes = -1;
                    else
                        pruned_tree.Yes = 0;
                    end
                case 2  
                    if mode(sub_s(:,70000)) == 1
                        pruned_tree.No = -1;
                    else
                        pruned_tree.No = 0;
                    end
            end
        else
            if i == 1
                pruned_tree.Yes = ID3_w_depth(sub_s, attributes,depth);
            elseif i == 2
                pruned_tree.No = ID3_w_depth(sub_s, attributes,depth);
            end
        end
    end
end
