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
    % 12 months: a to l
    case 1
        tree = struct('value', 'null', 'a', 'null', 'b', 'null'...
            ,'c', 'null', 'd', 'null', 'e', 'null'...
            , 'f', 'null', 'g', 'null', 'h', 'null'...
            , 'i', 'null', 'j', 'null', 'k', 'null'...
            ,'l', 'null');
        node_num = 12;
        
    % Day 1-5 is labeled as a;
    % Day 6-10 is labeled as b;
    % Day 11-15 is labeled as c;
    % Day 16-20 is labeled as d;
    % Day 21-25 is labeled as e;
    % Day 26-31 is labeled as f;
    case 2
        tree = struct('value', 'null', 'a', 'null', 'b', 'null',...
            'c', 'null', 'd', 'null', 'e', 'null'...
            , 'f', 'null');
        node_num = 6;
        
    % 24 hours: a to l
    case 3
        tree = struct('value', 'null', 'a', 'null', 'b', 'null'...
            ,'c', 'null', 'd', 'null', 'e', 'null'...
            , 'f', 'null', 'g', 'null', 'h', 'null'...
            , 'i', 'null', 'j', 'null', 'k', 'null'...
            , 'l', 'null');
        node_num = 24;
        
    % 4 seasons(a:Spring, b:Summer, c:Fall, d:Winter)
    case 4
        tree = struct('value', 'null', 'a', 'null', 'b', 'null'...
            ,'c', 'null', 'd', 'null');
        node_num = 4;
        
    % Dew Point -40 - -30 is labeled as a;
    % Dew Point -30 - -20 is labeled as b;
    % Dew Point -20 - -10 is labeled as c;
    % Dew Point -10 - 0 is labeled as d;
    % Dew Point 0 - -10 is labeled as e;
    % Dew Point 10 - 20 is labeled as f;
    % Dew Point 20 - 30 is labeled as g;
    case 5
        tree = struct('value', 'null', 'a', 'null', 'b', 'null'...
            ,'c', 'null', 'd', 'null', 'e', 'null'...
            , 'f', 'null', 'g', 'null');
        node_num = 7;
        
    % Humidity 0 - 10 is labeled as a;
    % Humidity 11 - 20 is labeled as b;
    % Humidity 21 - 30 is labeled as c;
    % Humidity 31 - 40 is labeled as d;
    % Humidity 41 - 50 is labeled as e;
    % Humidity 51 - 60 is labeled as f;
    % Humidity 61 - 70 is labeled as g;
    % Humidity 71 - 80 is labeled as h;
    % Humidity 81 - 90 is labeled as i;
    % Humidity 91 - 100 is labeled as j;
    case 6
        tree = struct('value', 'null', 'a', 'null', 'b', 'null'...
            ,'c', 'null', 'd', 'null', 'e', 'null'...
            , 'f', 'null', 'g', 'null', 'h', 'null'...
            , 'i', 'null', 'j', 'null');
        node_num = 10;
        
    % Pressure 991 - 1000 is labeled as a;
    % Pressure 1001 - 1010 is labeled as b;
    % Pressure 1011 - 1020 is labeled as c;
    % Pressure 1021 - 1030 is labeled as d;
    % Pressure 1031 - 1046 is labeled as e;
    case 7
        tree = struct('value', 'null', 'a', 'null', 'b', 'null'...
            ,'c', 'null', 'd', 'null', 'e', 'null');
        node_num = 5;
        
    % Temperature -20 - -10 is labeled as a;
    % Temperature -10 - 0 is labeled as b;
    % Temperature 0 - 10 is labeled as c;
    % Temperature 10 - 20 is labeled as d;
    % Temperature 20 - 30 is labeled as e;
    % Temperature 30 - 42 is labeled as f;
    case 8
        tree = struct('value', 'null', 'a', 'null', 'b', 'null'...
            ,'c', 'null', 'd', 'null', 'e', 'null'...
            , 'f', 'null');
        node_num = 6;
        
    % Combined wind direction NE is labeled as a;
    % Combined wind direction SE is labeled as b;
    % Combined wind direction SW is labeled as c;
    % Combined wind direction NW is labeled as d;
    case 9
        tree = struct('value', 'null', 'a', 'null', 'b', 'null',...
            'c', 'null', 'd', 'null');
        node_num = 4;
        
    % Cumulated wind speed 0 -100 is labeled as a;
    % Cumulated wind speed 100 -200 is labeled as b;
    % Cumulated wind speed 200 -300 is labeled as c;
    % Cumulated wind speed 300 -400 is labeled as d;
    % Cumulated wind speed 400 -500 is labeled as e;
    % Cumulated wind speed 500 -600 is labeled as f;
    case 10
        tree = struct('value', 'null', 'a', 'null', 'b', 'null'...
            ,'c', 'null', 'd', 'null', 'e', 'null'...
            , 'f', 'null');
        node_num = 6;
        
    otherwise
        disp("create_treenode error: best is not in the domain");
end

end

