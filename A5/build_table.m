function table = build_table(filename)
% Author:
% Haochen Zhang
% UU
% Fall 2017

fid = fopen(filename);
tline = fgetl(fid);
index = 1;
while ischar(tline)
    tline = regexp(tline,' ', 'split');
    tline = regexp(tline,':', 'split');
    len = length(tline);
    label = [];
    for i = 1:len
        if i == 1
            label(i) = str2double(tline{1});
        else
            if length(tline{i}(1,:)) > 1
                label(i) = str2double(tline{i}(1,1));
            end
        end
    end
    table(index).label = label;
    tline = fgetl(fid);
    index = index + 1;
end
fclose(fid);