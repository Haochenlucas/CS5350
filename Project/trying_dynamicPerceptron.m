clear all;
table = parse_data("BeijingPM20100101_20151231.csv");
[train,test]= separate_data(table);
train = parse_data_dynamicPerceptron(train);
test = parse_data_dynamicPerceptron(test);
[w,b,errors] = dynamicPerceptron(train(:,1:end),10,1000);
[correctNumber,result] = checkPerceptron(test(:,1:end),w,b);
winingRate = length(test(:,1))/correctNumber;