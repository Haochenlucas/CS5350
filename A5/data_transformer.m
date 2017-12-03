function new_format = data_transformer(data, num_examples)
% Author:
% Haochen Zhang
% UU
% Fall 2017

data = data(randperm(end));
new_format =[];
for i = 1:num_examples
   instance = data(i).label;
   len_instan = length(instance);
   new_instan = zeros(70000,1);
   if instance(1) == 1
       new_instan(70000) = 1;
   else
       new_instan(70000) = 0;
   end
   if len_instan >1
       for j = 2:len_instan
           new_instan(instance(j)) = 1;     
       end
   end
   new_format =[new_format; new_instan'];
end