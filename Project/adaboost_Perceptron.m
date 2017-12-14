function [w_space,b_space,vote] = adaboost_Perceptron( data,learningRate,T, threshold)
len = length(data(1,:));

D = ones(1, length(data));
D = D / length(data);
vote = zeros(T,1);
w_space =[];
b_space = [];
w= -0.01 + (0.02)*rand(1,len-1);
b = -0.01 + (0.02)*rand(1);
epoch = 1;
while epoch <= T
    flag =1;
    for epoch_1 = 1:T
        data1 = data(randperm(end),:);
        for i = 1: length(data1)
            y = data1(i,len);
            x = data1(i,1:len-1);
            if y*(w*x'+b) <= 0
                dynamicRate = learningRate/epoch_1;
                w = w+ dynamicRate*y*x;
                b = b + dynamicRate*y;
            end 
        end
    end
    sum = 0;
    for i = 1:length(data)
        y = data1(i,len);
        x = data1(i,1:len-1);
        sum = sum +D(i)*(y*(w*x'+b)>0);
    end
    epsilon = 0.5-0.5*sum;
    if epsilon > threshold
        epoch= epoch-1;
        flag =0;
    end
    if flag
        for i = 1: length(data)
            y = data(i,len);
            x = data(i,1:len-1);
            if epoch == 1
                if y*(w*x'+b) <= 0
                    D(i) = D(i)*exp(vote(epoch));
                else
                    D(i) = D(i)*exp(-vote(epoch));
                end
            else
                if y*(w*x'+b) <= 0
                    D(i) = D(i)*exp(vote(epoch-1));
                else
                    D(i) = D(i)*exp(-vote(epoch-1));
                end
            end
            
            D = D/norm(D,1);
        end
        sum = 0;
        for i = 1:length(data)
            y = data(i,len);
            x = data(i,1:len-1);
            sum = sum +D(i)*y*(w*x'+b);
        end 
        epsilon = 0.5-0.5*sum;
        w_space(epoch).w = w;
        b_space(epoch) = b;
        vote(epoch) = 0.5*log((1-epsilon)/epsilon);
    end
    epoch= epoch+1;
end 
end