function [train, test] = separate_data(table)
% separate_data - separate the whole table to two table one for training,
%                 one for testing. Training data is from 2010 to 2014.
%                 Testing data is in 2015.
% On input:
%       the data table
% On output:
%       the new data table: train and test.
% Call:
%       table = reform_data(table);
% Author:
%       Yucheng Yang
%       UU
%       Fall 2017
index = 1;
while table(index,1)~= 2015
   index= index + 1; 
end
train = table(1:index-1,:);
test = table(index:end,:);
end