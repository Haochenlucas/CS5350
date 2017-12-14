function [correctNumber,result] = checkPeriodical( data, w, b)    
    correctNumber = 0;
    result =[];
    for i = 1: length(data)
        y = data(i,end);
        x = data(i,1:end-1);
        yPredict = sin(w*x'+b);
        if yPredict > 0 && y == 1
            correctNumber = correctNumber +1;
            result =[result,i];
        elseif yPredict <= 0 && y == -1
            correctNumber = correctNumber +1;
            result =[result,i];
        end
    end
end