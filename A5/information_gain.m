function max_gain = information_gain(s, attributes)
% information_gain - calculate the information gain and return the...
%                   attribute with the largest information gain...
%                   Weighing the entropy of each partition by its size...
%                   relative to the original set	
%   On input:
%       attributes: available attributes
%       s: set of examples
%   On output:
%       information gain
%   Call:
%       gain = information_gain(0.341, entropy_v)
%   Author:
%       Haochen Zhang
%       UU
%       Fall 2017
%

num_labels = length(s(:,1));
num_attributes = length(s(1,:)) - 1;
infor_gain = zeros(num_attributes, 1);

for i = 1:num_attributes
    if attributes(i) == 1
        count_1_invit1 = 0;
        count_1 = 0;
        count_0_invit1 = 0;
        count_0 = 0;
        for j = 1:num_labels
            if s(j,i) == 1
                count_1 = count_1 + 1;
                if s(j,70000) == 1
                    count_1_invit1 = count_1_invit1 + 1;
                end
            else
                count_0 = count_0 + 1;
                if s(j,70000) == 1
                    count_0_invit1 = count_0_invit1 + 1;
                end
            end
        end
    
        if count_1 == 0
            entropy_1 = 0;
        elseif (count_1_invit1 / count_1) == 0 || (count_1_invit1 / count_1) == 1 
            entropy_1 = 0;
        else
            entropy_1 = - (count_1_invit1 / count_1) * log2(count_1_invit1 / count_1) - ...
            (1 - (count_1_invit1 / count_1)) * log2(1 - (count_1_invit1 / count_1));
        end
        
        if count_0 == 0
            entropy_0 = 0;
        elseif (count_0_invit1 / count_0) == 0 || (count_0_invit1 / count_0) == 1 
            entropy_0 = 0;
        else
            entropy_0 = - (count_0_invit1 / count_0) * log2(count_0_invit1 / count_0) - ...
            (1 - (count_0_invit1 / count_0)) * log2(1 - (count_0_invit1 / count_0));
        end
        H = (count_1 / num_labels)*entropy_1 + (count_0 / num_labels)*entropy_0;

        infor_gain(i) = H;
    else
        % attribute is not an option, set to 1 which will be the highest
        infor_gain(i) = 2;
    end
end

[~,max_gain] = min(infor_gain);
