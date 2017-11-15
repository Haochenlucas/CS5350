function [train, test] = DT_transform_features( ini_table )
% DT_transform_features - 	use	thresholds or ranges to get...
%                           Boolean/discrete alternatives
% On input:
%       ini_table: the data table;
% On output:
%       table: the new data talbe after features transformation
% Call:
%       table = DT_transform_features(table);
% Author:
%       Haochen Zhang
%       UU
%       Fall 2017

%--------------------------------------------------------
% After transform
% Table explanation
% Columns:
% 1: month
% 2: day
% 3: hour
% 4: season(1:Spring, 2:Summer, 3:Fall, 4:Winter)
% 5: Dew Point (Celsius Degree)
% 6: Humidity (%)
% 7: Pressure (hPa)
% 8: Temperature (Celsius Degree)
% 9: Combined wind direction 
% 10: Cumulated wind speed (m/s)
% 11: PM2.5 concentration (ug/m^3)
% --------------------------------------------------------

% Day 1-5 is labeled as 1;
% Day 6-10 is labeled as 2;
% Day 11-15 is labeled as 3;
% Day 16-20 is labeled as 4;
% Day 21-25 is labeled as 5;
% Day 26-31 is labeled as 6;
len = length(ini_table(:,1));
for i = 0:len-1
    if ini_table(len-i,3) >= 1 && ini_table(len-i,3) < 6
        ini_table(len-i,3) = 1;
    elseif ini_table(len-i,3) >= 6 && ini_table(len-i,3) < 11
        ini_table(len-i,3) = 2;
    elseif ini_table(len-i,3) >= 11 && ini_table(len-i,3) < 16
        ini_table(len-i,3) = 3;
    elseif ini_table(len-i,3) >= 16 && ini_table(len-i,3) < 21
        ini_table(len-i,3) = 4;
    elseif ini_table(len-i,3) >= 21 && ini_table(len-i,3) < 26
        ini_table(len-i,3) = 5;
    elseif ini_table(len-i,3) >= 26 && ini_table(len-i,3) <= 31
        ini_table(len-i,3) = 6;
    end
end

% Hour 0-1 is labeled as 1;
% Hour 2-3 is labeled as 2;
% Hour 4-5 is labeled as 3;
% Hour 6-7 is labeled as 4;
% Hour 8-9 is labeled as 5;
% Hour 10-11 is labeled as 6;
% Hour 12-13 is labeled as 7;
% Hour 14-15 is labeled as 8;
% Hour 16-17 is labeled as 9;
% Hour 18-19 is labeled as 10;
% Hour 20-21 is labeled as 11;
% Hour 22-23 is labeled as 12;
len = length(ini_table(:,1));
for i = 0:len-1
    ini_table(len-i,4) = floor(ini_table(len-i,4) / 2) + 1;
end

% Dew Point -40 - -30 is labeled as 1;
% Dew Point -30 - -20 is labeled as 2;
% Dew Point -20 - -10 is labeled as 3;
% Dew Point -10 - 0 is labeled as 4;
% Dew Point 0 - -10 is labeled as 5;
% Dew Point 10 - 20 is labeled as 6;
% Dew Point 20 - 30 is labeled as 7;

for i = 0:len-1
    if ini_table(len-i,7) >= -40 && ini_table(len-i,7) < -31
        ini_table(len-i,7) = 1;
    elseif ini_table(len-i,7) >= -31 && ini_table(len-i,7) < -21
        ini_table(len-i,7) = 2;
    elseif ini_table(len-i,7) >= -21 && ini_table(len-i,7) < -11
        ini_table(len-i,7) = 3;
    elseif ini_table(len-i,7) >= -11 && ini_table(len-i,7) < 1
        ini_table(len-i,7) = 4;
    elseif ini_table(len-i,7) >= 1 && ini_table(len-i,7) < 11
        ini_table(len-i,7) = 5;
    elseif ini_table(len-i,7) >= 11 && ini_table(len-i,7) < 21
        ini_table(len-i,7) = 6;
    elseif ini_table(len-i,7) >= 21 && ini_table(len-i,7) < 31
        ini_table(len-i,7) = 7;
    end
end

% Humidity 0 - 10 is labeled as 1;
% Humidity 11 - 20 is labeled as 2;
% Humidity 21 - 30 is labeled as 3;
% Humidity 31 - 40 is labeled as 4;
% Humidity 41 - 50 is labeled as 5;
% Humidity 51 - 60 is labeled as 6;
% Humidity 61 - 70 is labeled as 7;
% Humidity 71 - 80 is labeled as 8;
% Humidity 81 - 90 is labeled as 9;
% Humidity 91 - 100 is labeled as 10;

for i = 0:len-1
    if ini_table(len-i,8) >= 0 && ini_table(len-i,8) < 11
        ini_table(len-i,8) = 1;
    elseif ini_table(len-i,8) >= 11 && ini_table(len-i,8) < 21
        ini_table(len-i,8) = 2;
    elseif ini_table(len-i,8) >= 21 && ini_table(len-i,8) < 31
        ini_table(len-i,8) = 3;
    elseif ini_table(len-i,8) >= 31 && ini_table(len-i,8) < 41
        ini_table(len-i,8) = 4;
    elseif ini_table(len-i,8) >= 41 && ini_table(len-i,8) < 51
        ini_table(len-i,8) = 5;
    elseif ini_table(len-i,8) >= 51 && ini_table(len-i,8) < 61
        ini_table(len-i,8) = 6;
    elseif ini_table(len-i,8) >= 61 && ini_table(len-i,8) < 71
        ini_table(len-i,8) = 7;
    elseif ini_table(len-i,8) >= 71 && ini_table(len-i,8) < 81
        ini_table(len-i,8) = 8;
    elseif ini_table(len-i,8) >= 81 && ini_table(len-i,8) < 91
        ini_table(len-i,8) = 9;
    elseif ini_table(len-i,8) >= 91 && ini_table(len-i,8) < 100
        ini_table(len-i,8) = 10;
    end
end

% Pressure 991 - 1000 is labeled as 1;
% Pressure 1001 - 1010 is labeled as 2;
% Pressure 1011 - 1020 is labeled as 3;
% Pressure 1021 - 1030 is labeled as 4;
% Pressure 1031 - 1046 is labeled as 5;

for i = 0:len-1
    if ini_table(len-i,9) >= 991 && ini_table(len-i,9) < 1001
        ini_table(len-i,9) = 1;
    elseif ini_table(len-i,9) >= 1001 && ini_table(len-i,9) < 1011
        ini_table(len-i,9) = 2;
    elseif ini_table(len-i,9) >= 1011 && ini_table(len-i,9) < 1021
        ini_table(len-i,9) = 3;
    elseif ini_table(len-i,9) >= 1021 && ini_table(len-i,9) < 1031
        ini_table(len-i,9) = 4;
    elseif ini_table(len-i,9) >= 1031 && ini_table(len-i,9) < 1047
        ini_table(len-i,9) = 5;
    end
end

% Temperature -20 - -10 is labeled as 1;
% Temperature -10 - 0 is labeled as 2;
% Temperature 0 - 10 is labeled as 3;
% Temperature 10 - 20 is labeled as 4;
% Temperature 20 - 30 is labeled as 5;
% Temperature 30 - 42 is labeled as 6;

for i = 0:len-1
    if ini_table(len-i,10) >= -20 && ini_table(len-i,10) < -9
        ini_table(len-i,10) = 1;
    elseif ini_table(len-i,10) >= -10 && ini_table(len-i,10) < 1
        ini_table(len-i,10) = 2;
    elseif ini_table(len-i,10) >= 1 && ini_table(len-i,10) < 11
        ini_table(len-i,10) = 3;
    elseif ini_table(len-i,10) >= 11 && ini_table(len-i,10) < 21
        ini_table(len-i,10) = 4;
    elseif ini_table(len-i,10) >= 21 && ini_table(len-i,10) < 31
        ini_table(len-i,10) = 5;
    elseif ini_table(len-i,10) >= 31 && ini_table(len-i,10) < 42
        ini_table(len-i,10) = 6;
    end
end

% Cumulated wind speed 0 -100 is labeled as 1;
% Cumulated wind speed 100 -200 is labeled as 2;
% Cumulated wind speed 200 -300 is labeled as 3;
% Cumulated wind speed 300 -400 is labeled as 4;
% Cumulated wind speed 400 -500 is labeled as 5;
% Cumulated wind speed 500 -600 is labeled as 6;

for i = 0:len-1
    if ini_table(len-i,12) >= 0 && ini_table(len-i,12) < 101
        ini_table(len-i,12) = 1;
    elseif ini_table(len-i,12) >= 101 && ini_table(len-i,12) < 201
        ini_table(len-i,12) = 2;
    elseif ini_table(len-i,12) >= 201 && ini_table(len-i,12) < 301
        ini_table(len-i,12) = 3;
    elseif ini_table(len-i,12) >= 301 && ini_table(len-i,12) < 401
        ini_table(len-i,12) = 4;
    elseif ini_table(len-i,12) >= 401 && ini_table(len-i,12) < 501
        ini_table(len-i,12) = 5;
    elseif ini_table(len-i,12) >= 501 && ini_table(len-i,12) < 601
        ini_table(len-i,12) = 6;
    end
end

% Remove the Column: year, Cumulated precipitation, hourly precipitation from the table
% note that it need to be done backward
ini_table(:,13) = [];
ini_table(:,6) = [];
[train, test] = separate_data(ini_table);
train(:,1) = [];
test(:,1) = [];
end

