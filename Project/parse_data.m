function table = parse_data(filename)
% Author:
% Haochen Zhang
% UU
% Fall 2017

% Columns:
% year	month	day	hour	2ason	PM_Dongsi	PM_Dongsihuan	PM_Nongzhanguan	PM_US Post	DEWP	HUMI	PRES	TEMP	cbwd	Iws	precipitation	Iprec
% -1 means missing data
filename = 'BeijingPM20100101_20151231.csv';
table = csvread(filename,1,1);
end

