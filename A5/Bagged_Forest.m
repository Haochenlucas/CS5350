function  trees  = Bagged_Forest(data,depth,num_tree,num_examples)
% Author:
% Haochen Zhang
% UU
% Fall 2017

trees = [];
for k = 1:num_tree
   new_format = data_transformer(data, num_examples);
   trees(k).tree = ID3_w_depth(new_format, ones(70000,1), 3);
end
