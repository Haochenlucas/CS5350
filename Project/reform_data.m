function table = reform_data(ini_table)
% reform_data - reform the column of PM value to the end of table.
% On input:
%       the data table;
% On output:
%       the new data talbe
% Call:
%       a = clear_data(table);
% Author:
%       Yucheng Yang
%       UU
%       Fall 2017
temp = ini_table(:,6);
ini_table(:,6) = ini_table(:,end);
ini_table(:,end) = temp;
table = ini_table;
end