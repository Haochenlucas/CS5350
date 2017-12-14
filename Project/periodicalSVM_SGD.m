function [w, b, errors] = periodicalSVM_SGD( data,learningRate,epochs)
 len = length(data(1,:));
 w= -0.01 + (0.02)*rand(1,len-1);
 b= -0.01 + (0.02)*rand(1);
     errors = 0;
     for epoch = 1:epochs
         data = data(randperm(end),:);
         for i = 1: length(data)
             y = data(i,len);
             x = data(i,1:len-1);
             if y*sin(w*x'+b) <= 0.025
                 dynamicRate = learningRate/step;
                 w = w+ dynamicRate*y*x*cos(w*x'+b);
                 b = b + dynamicRate*y*cos(w*x'+b);
                 errors = errors +1;
             end             
        end
     end
     
end