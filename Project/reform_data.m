function table = reform_data(ini_table)
% reform_data - reform the column of PM value to the end of table, ...
%               clear rows with PM2.5 equal to -1 (missing lable space) ...
%               and put PM2.5 into ranks
% On input:
%       the data table;
% On output:
%       the new data talbe
% Call:
%       table = reform_data(table);
% Author:
%       Yucheng Yang
%       UU
%       Fall 2017

% Clear rows with PM2.5 equal to -1
len = length(ini_table(:,6));
for i = 0:len-1
    if ini_table(len-i,6) == -1
        ini_table(len-i,:) =[];
    end
end

% Reform the column of PM value to the end of table
temp = ini_table(:,6);
ini_table(:,6) = ini_table(:,end);
ini_table(:,end) = temp;

% Put PM2.5 into ranks
% PM2.5 AQI conversion scale: 
%       http://aqicn.org/faq/2013-09-09/revised-pm25-aqi-breakpoints/
% 1: 0-12
% 2: 12-35.5
% 3: 35.5-55.5
% 4: 55.5-150.5
% 5: 150.5-250.5
% 6: 250.5-350.5
% 7: 350.5-500
% 8: 500-

len = length(ini_table(:,1));
for i = 0:len-1
    if ini_table(len-i,end) >= 0 && ini_table(len-i,end) < 12
        ini_table(len-i,end) = 1;
    elseif ini_table(len-i,end) >= 12 && ini_table(len-i,end) < 35.5
        ini_table(len-i,end) = 2;
    elseif ini_table(len-i,end) >= 35.5 && ini_table(len-i,end) < 55.5
        ini_table(len-i,end) = 3;
    elseif ini_table(len-i,end) >= 55.5 && ini_table(len-i,end) < 150.5
        ini_table(len-i,end) = 4;
    elseif ini_table(len-i,end) >= 150.5 && ini_table(len-i,end) < 250.5
        ini_table(len-i,end) = 5;
    elseif ini_table(len-i,end) >= 250.5 && ini_table(len-i,end) < 350.5
        ini_table(len-i,end) = 6;
    elseif ini_table(len-i,end) >= 350.5 && ini_table(len-i,end) < 500
        ini_table(len-i,end) = 7;
    elseif ini_table(len-i,end) >= 500
        ini_table(len-i,end) = 8;
    end
end

% Delete the rows with missing data on multiple attributes
len = length(ini_table(:,1));
for i = 0:len-1
    counter = 0;
    for j = 1:14
        if ini_table(len-i,j) == -1
            counter = counter + 1;
        end
    end
    if counter >= 2
        ini_table(len-i,:) = [];
    end
end

table = ini_table;
City = table;
save('Beijing.mat', 'City');

end