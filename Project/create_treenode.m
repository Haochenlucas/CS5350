function [tree, node_num] = create_treenode(best)
% create_treenode - create a tree struct based on the attribute index
% On input:
%   best(int): index of the chosen attribute
%   node_num(int): number of levels of the chosen attribute
% On output:
%   tree
% Call:
%   tree = create_treenode(best);
% Author:
%   Haochen Zhang
%   UU
%   Fall 2017
%

% total 10 attributes
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

switch best
    % 12 months
    case 1
        tree = struct('value', 'null', '1', 'null', '2', 'null',...
            '3', 'null', '4', 'null', '5', 'null'...
            , '6', 'null', '7', 'null', '8', 'null'...
            , '9', 'null', '10', 'null', '11', 'null',...
            '12', 'null');
        node_num = 12;
        
    % Day 1-5 is labeled as 1;
    % Day 6-10 is labeled as 2;
    % Day 11-15 is labeled as 3;
    % Day 16-20 is labeled as 4;
    % Day 21-25 is labeled as 5;
    % Day 26-31 is labeled as 6;
    case 2
        tree = struct('value', 'null', '1', 'null', '2', 'null',...
            '3', 'null', '4', 'null', '5', 'null'...
            , '6', 'null');
        node_num = 6;
        
    % 24 hours
    case 3
        tree = struct('value', 'null', '1', 'null', '2', 'null',...
            '3', 'null', '4', 'null', '5', 'null'...
            , '6', 'null', '7', 'null', '8', 'null'...
            , '9', 'null', '10', 'null', '11', 'null'...
            , '12', 'null', '13', 'null', '14', 'null'...
            , '15', 'null', '16', 'null', '17', 'null'...
            , '18', 'null', '19', 'null', '20', 'null'...
            , '21', 'null', '22', 'null', '23', 'null'...
            , '24', 'null');
        node_num = 24;
        
    % 4 seasons(1:Spring, 2:Summer, 3:Fall, 4:Winter)
    case 4
        tree = struct('value', 'null', '1', 'null', '2', 'null',...
            '3', 'null', '4', 'null');
        node_num = 4;
        
    % Dew Point -40 - -30 is labeled as 1;
    % Dew Point -30 - -20 is labeled as 2;
    % Dew Point -20 - -10 is labeled as 3;
    % Dew Point -10 - 0 is labeled as 4;
    % Dew Point 0 - -10 is labeled as 5;
    % Dew Point 10 - 20 is labeled as 6;
    % Dew Point 20 - 30 is labeled as 7;
    case 5
        tree = struct('value', 'null', '1', 'null', '2', 'null',...
            '3', 'null', '4', 'null', '5', 'null'...
            , '6', 'null', '7', 'null');
        node_num = 7;
        
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
    case 6
        tree = struct('value', 'null', '1', 'null', '2', 'null',...
            '3', 'null', '4', 'null', '5', 'null'...
            , '6', 'null', '7', 'null', '8', 'null'...
            , '9', 'null', '10', 'null');
        node_num = 10;
        
    % Pressure 991 - 1000 is labeled as 1;
    % Pressure 1001 - 1010 is labeled as 2;
    % Pressure 1011 - 1020 is labeled as 3;
    % Pressure 1021 - 1030 is labeled as 4;
    % Pressure 1031 - 1046 is labeled as 5;
    case 7
        tree = struct('value', 'null', '1', 'null', '2', 'null',...
            '3', 'null', '4', 'null', '5', 'null');
        node_num = 5;
        
    % Temperature -20 - -10 is labeled as 1;
    % Temperature -10 - 0 is labeled as 2;
    % Temperature 0 - 10 is labeled as 3;
    % Temperature 10 - 20 is labeled as 4;
    % Temperature 20 - 30 is labeled as 5;
    % Temperature 30 - 42 is labeled as 6;
    case 8
        tree = struct('value', 'null', '1', 'null', '2', 'null',...
            '3', 'null', '4', 'null', '5', 'null'...
            , '6', 'null');
        node_num = 6;
        
    % Combined wind direction NE is labeled as 1;
    % Combined wind direction SE is labeled as 2;
    % Combined wind direction SW is labeled as 3;
    % Combined wind direction NW is labeled as 4;
    case 9
        tree = struct('value', 'null', '1', 'null', '2', 'null',...
            '3', 'null', '4', 'null');
        node_num = 4;
        
    % Cumulated wind speed 0 -100 is labeled as 1;
    % Cumulated wind speed 100 -200 is labeled as 2;
    % Cumulated wind speed 200 -300 is labeled as 3;
    % Cumulated wind speed 300 -400 is labeled as 4;
    % Cumulated wind speed 400 -500 is labeled as 5;
    % Cumulated wind speed 500 -600 is labeled as 6;
    case 10
        tree = struct('value', 'null', '1', 'null', '2', 'null',...
            '3', 'null', '4', 'null', '5', 'null'...
            , '6', 'null');
        node_num = 6;
        
    otherwise
        disp("create_treenode error: best is not in the domain");
end

end

