clear all;
table = parse_data("BeijingPM20100101_20151231.csv");
[train,test]= separate_data(table);
train = parse_data_dynamicPerceptron(train);
test = parse_data_dynamicPerceptron(test);
good_percent = sum(train(:,end)== 1)/length(train);
[w,b,errors] = dynamicPerceptron(train(:,1:end),10,1000);
[correctNumber,result] = checkPerceptron(test(:,1:end),w,b);
winingRate = 100 * (correctNumber/length(test(:,1)));
disp("Beijing accuracy: " + winingRate + "%");

table = parse_data("ChengduPM20100101_20151231.csv");
[train,test]= separate_data(table);
train = parse_data_dynamicPerceptron(train);
test = parse_data_dynamicPerceptron(test);
good_percent = sum(train(:,end)== 1)/length(train);
[w,b,errors] = dynamicPerceptron(train(:,1:end),10,1000);
[correctNumber,result] = checkPerceptron(test(:,1:end),w,b);
winingRate = 100 * (correctNumber/length(test(:,1)));
disp("Chengdu accuracy: " + winingRate + "%");


% table = parse_data("GuangzhouPM20100101_20151231.csv");
% [train,test]= separate_data(table);
% train = parse_data_dynamicPerceptron(train);
% test = parse_data_dynamicPerceptron(test);
% good_percent = sum(train(:,end)== 1)/length(train);
% [w,b,errors] = dynamicPerceptron(train(:,1:end),10,1000);
% [correctNumber,result] = checkPerceptron(test(:,1:end),w,b);
% winingRate = 100 * (correctNumber/length(test(:,1)));
% disp("Guangzhou accuracy: " + winingRate + "%");


table = parse_data("ShanghaiPM20100101_20151231.csv");
[train,test]= separate_data(table);
train = parse_data_dynamicPerceptron(train);
test = parse_data_dynamicPerceptron(test);
good_percent = sum(train(:,end)== 1)/length(train);
[w,b,errors] = dynamicPerceptron(train(:,1:end),10,1000);
[correctNumber,result] = checkPerceptron(test(:,1:end),w,b);
winingRate = 100 * (correctNumber/length(test(:,1)));
disp("Shanghai accuracy: " + winingRate + "%");


table = parse_data("ShenyangPM20100101_20151231.csv");
[train,test]= separate_data(table);
train = parse_data_dynamicPerceptron(train);
test = parse_data_dynamicPerceptron(test);
good_percent = sum(train(end)== 1)/length(train);
[w,b,errors] = dynamicPerceptron(train(:,1:end),10,1000);
[correctNumber,result] = checkPerceptron(test(:,1:end),w,b);
winingRate = 100 * (correctNumber/length(test(:,1)));
disp("Shenyang accuracy: " + winingRate + "%");