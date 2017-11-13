function table = parse_data(filename)
% parse_data - parse the data into tables
%   On input:
%       filename: the name of the file that contains data
%   On output:
%       table
%   Call:
%       table = parse_data('BeijingPM20100101_20151231.csv')
%   Author:
%       Haochen Zhang
%       UU
%       Fall 2017
%

% Table explanation
% Columns:
% 1: year
% 2: month
% 3: day
% 4: hour
% 5: season(1:Spring, 2:Summer, 3:Fall, 4:Winter)
% 6: PM2.5 concentration (ug/m^3)
% 7: Dew Point (Celsius Degree)
% 8: Humidity (%)
% 9: Pressure (hPa)
% 10: Temperature (Celsius Degree)
% 11: Combined wind direction 
% 12: Cumulated wind speed (m/s)
% 13: hourly precipitation (mm) 
% 14: Cumulated precipitation (mm)

% -1 as valuse means missing data

table = csvread(filename,1,1);
table = clear_data(table);
table = reform_data(table);

end

