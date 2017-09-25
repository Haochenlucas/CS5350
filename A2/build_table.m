function table = build_table(filename)
% Author:
% Haochen Zhang
% UU
% Fall 2017

% 68 col are the labels
delimiterIn = ' ';
temp = importdata(filename,delimiterIn);
temp = regexp(temp,' ', 'split');
len = length(temp);
table = zeros(len,68);
for i = 1:len
   line = regexp(temp{i},':', 'split');
   line_decomposed = [line{:}];
   for t = 1:length(line_decomposed)
       if t == 1
           table(i,68) = str2double(line_decomposed(t));
       elseif mod(t,2) == 0
           row = str2double(line_decomposed(t));
       elseif mod(t,2) == 1
           table(i,row) = str2double(line_decomposed(t)); 
       end
   end
end