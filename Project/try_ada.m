clear all;
% table = parse_data("BeijingPM20100101_20151231.csv");
% [train,test]= separate_data(table);
% train = parse_data_dynamicPerceptron(train);
% test = parse_data_dynamicPerceptron(test);
% save('train.mat','train');
% save('test.mat','test');
load('train.mat');
load('test.mat');
winingRate = 0;
for i = 1:20
    [w_space,b_space,vote] = adaboost_Perceptron(train(:,1:end),0.1,5,0.2);
    [correctNumber,result] = checkAdaboost( test(:,1:end), w_space, b_space, vote);
    winingRate =winingRate+ correctNumber/length(test(:,1));
end
winingRate = winingRate/20;