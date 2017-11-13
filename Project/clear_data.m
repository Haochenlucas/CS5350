function table = clear_data(ini_table)
len = length(ini_table(:,6));
for i = 0:len-1
    if ini_table(len-i,6) == -1
        ini_table(len-i,:) =[];
    end
end
table = ini_table;
end