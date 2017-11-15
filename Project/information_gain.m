function max_gain = information_gain(s, attributes, node_num)
% information_gain - calculate the information gain and return the
%       attribute with the largest information gain...
%       Weighing the entropy of each partition by its size ...
%       relative to the original set	
% On input:
%   attributes: available attributes
%   s: set of examples
% On output:
%   information gain
% Call:
%   gain = information_gain(s, entropy_v)
% Author:
%   Haochen Zhang
%   UU
%   Fall 2017
%

num_labels = length(s(:,1));
num_attributes = length(s(1,:)) - 1;
infor_gain = zeros(num_attributes, 1);

for i = 1:num_attributes
    if attributes(i) == 1
        % get how many values each attribute have
        % Note that "tree" are not used in this case
        
        count_1_label = 0;
        count_1 = 0;
        count_2_label = 0;
        count_2 = 0;
        count_3_label = 0;
        count_3 = 0;
        count_4_label = 0;
        count_4 = 0;
        count_5_label = 0;
        count_5 = 0;
        count_6_label = 0;
        count_6 = 0;
        for j = 1:num_labels
            if s(j,i) == 1
                count_1 = count_1 + 1;
                if s(j,11) == 1
                    count_1_label = count_1_label + 1;
                end
            elseif s(j,i) == 2
                count_2 = count_2 + 1;
                if s(j,11) == 1
                    count_2_label = count_2_label + 1;
                end
            elseif s(j,i) == 3
                count_3 = count_3 + 1;
                if s(j,11) == 1
                    count_3_label = count_3_label + 1;
                end
            elseif s(j,i) == 4
                count_4 = count_4 + 1;
                if s(j,11) == 1
                    count_4_label = count_4_label + 1;
                end
            elseif s(j,i) == 5
                count_5 = count_5 + 1;
                if s(j,11) == 1
                    count_5_label = count_5_label + 1;
                end
            elseif s(j,i) == 6
                count_6 = count_6 + 1;
                if s(j,11) == 1
                    count_6_label = count_6_label + 1;
                end
            end
        end
    
        if count_1 == 0
            entropy_1 = 0;
        elseif (count_1_label / count_1) == 0 || (count_1_label / count_1) == 1 
            entropy_1 = 0;
        else
            entropy_1 = - (count_1_label / count_1) * log2(count_1_label / count_1) - ...
            (1 - (count_1_label / count_1)) * log2(1 - (count_1_label / count_1));
        end
        
        if count_2 == 0
            entropy_2 = 0;
        elseif (count_2_label / count_2) == 0 || (count_2_label / count_2) == 1 
            entropy_2 = 0;
        else
            entropy_2 = - (count_2_label / count_2) * log2(count_2_label / count_2) - ...
            (1 - (count_2_label / count_2)) * log2(1 - (count_2_label / count_2));
        end
        
        if count_3 == 0
            entropy_3 = 0;
        elseif (count_3_label / count_3) == 0 || (count_3_label / count_3) == 1 
            entropy_3 = 0;
        else
            entropy_3 = - (count_3_label / count_3) * log2(count_3_label / count_3) - ...
            (1 - (count_3_label / count_3)) * log2(1 - (count_3_label / count_3));
        end
        
        if count_4 == 0
            entropy_4 = 0;
        elseif (count_4_label / count_4) == 0 || (count_4_label / count_4) == 1 
            entropy_4 = 0;
        else
            entropy_4 = - (count_4_label / count_4) * log2(count_4_label / count_4) - ...
            (1 - (count_4_label / count_4)) * log2(1 - (count_4_label / count_4));
        end
        
        if count_5 == 0
            entropy_5 = 0;
        elseif (count_5_label / count_5) == 0 || (count_5_label / count_5) == 1 
            entropy_5 = 0;
        else
            entropy_5 = - (count_5_label / count_5) * log2(count_5_label / count_5) - ...
            (1 - (count_5_label / count_5)) * log2(1 - (count_5_label / count_5));
        end
        
        if count_6 == 0
            entropy_6 = 0;
        elseif (count_6_label / count_6) == 0 || (count_6_label / count_6) == 1 
            entropy_6 = 0;
        else
            entropy_6 = - (count_6_label / count_6) * log2(count_6_label / count_6) - ...
            (1 - (count_6_label / count_6)) * log2(1 - (count_6_label / count_6));
        end
        H = (count_1 / num_labels)*entropy_1 + (count_2 / num_labels)*entropy_2...
            + (count_3 / num_labels)*entropy_3 + (count_4 / num_labels)*entropy_4...
            + (count_5 / num_labels)*entropy_5 + (count_6 / num_labels)*entropy_6;

        infor_gain(i) = H;
    else
        % attribute is not an option, set to 2 which will be the highest
        infor_gain(i) = 2;
    end
end

[~,max_gain] = min(infor_gain);
