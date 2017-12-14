function table = parse_data_dynamicPerceptron(table)
% parse_data_dynamicPerceptron - I want to change the PM column to good(1)
%                                and bad(-1). Considering hat Beijing is highly polluted, I think below level 4   
                    % Put PM2.5 into ranks
                    % PM2.5 AQI conversion scale: 
                    %       http://aqicn.org/faq/2013-09-09/revised-pm25-aqi-breakpoints/
                    % 1: 0-12 (good)
                    % 2: 12-35.5 (good)
                    % 3: 35.5-55.5 (good)
                    % 4: 55.5-150.5 (good)
                    % 5: 150.5-250.5 (bad)
                    % 6: 250.5-350.5 (bad)
                    % 7: 350.5-500 (bad)
                    % 8: 500- (bad)
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

len = length(table(:,1));
for i = 1:len
    table(i,1:end-1) = table(i,1:end-1)./norm(table(i,1:end-1));
    if table(i,end)< 4
        table(i,end) = 1;
    else
        table(i,end) = -1;
    end
end
end