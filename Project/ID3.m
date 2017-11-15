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
    best = information_gain(s, attributes, 6);
    tree = struct('value', 'null', 'a', 'null', 'b', 'null',...
            'c', 'null', 'd', 'null', 'e', 'null'...
            , 'f', 'null');
    node_num = 6;
    tree.value = best;
    attributes(best) = 0;
    
    % split the data into n parts
    % dependes on how many level the attribute has
    for i = 1:node_num
        sub_s = [];
        for j = 1:labels_num
            if s(j, best) == i
                sub_s = [sub_s;s(i,:)];
            end
        end
      
        if isempty(sub_s)
            switch i
                case 1
                    if mode(s(:,11)) == 1
                        tree.a = 1;
                    else
                        tree.a = 0;
                    end
                case 2
                    if mode(s(:,11)) == 1
                        tree.b = 1;
                    else
                        tree.b = 0;
                    end
                case 3
                    if mode(s(:,11)) == 1
                        tree.c = 1;
                    else
                        tree.c = 0;
                    end
                case 4
                    if mode(s(:,11)) == 1
                        tree.d = 1;
                    else
                        tree.d = 0;
                    end
                case 5
                    if mode(s(:,11)) == 1
                        tree.e = 1;
                    else
                        tree.e = 0;
                    end
                case 6
                    if mode(s(:,11)) == 1
                        tree.f = 1;
                    else
                        tree.f = 0;
                    end
                otherwise
                    disp("Error in assign value (1)");
            end
        elseif all(attributes(:) == 0)
            switch i
                case 1
                    if mode(sub_s(:,11)) == 1
                        tree.a = 1;
                    else
                        tree.a = 0;
                    end
                case 2
                    if mode(sub_s(:,11)) == 1
                        tree.b = 1;
                    else
                        tree.b = 0;
                    end
                case 3
                    if mode(sub_s(:,11)) == 1
                        tree.c = 1;
                    else
                        tree.c = 0;
                    end
                case 4
                    if mode(sub_s(:,11)) == 1
                        tree.d = 1;
                    else
                        tree.d = 0;
                    end
                case 5
                    if mode(sub_s(:,11)) == 1
                        tree.e = 1;
                    else
                        tree.e = 0;
                    end
                case 6
                    if mode(sub_s(:,11)) == 1
                        tree.f = 1;
                    else
                        tree.f = 0;
                    end
                otherwise
                    disp("Error in assign value (2)");
            end
        else
            switch i
                case 1
                    tree.a = ID3(sub_s, attributes);
                case 2
                    tree.b = ID3(sub_s, attributes);
                case 3
                    tree.c = ID3(sub_s, attributes);
                case 4
                    tree.d = ID3(sub_s, attributes);
                case 5
                    tree.e = ID3(sub_s, attributes);
                case 6
                    tree.f = ID3(sub_s, attributes);
                otherwise
                    disp("Error in iterating tree nodes");
            end
        end
    end
end









