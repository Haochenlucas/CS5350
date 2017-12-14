function [correctNumber,result] = checkAdaboost( data, w_space, b_space, vote)    
    voting = 0;
    result =[];
    len = length(w_space);
    correctNumber = 0;
    for i = 1: length(data)
        y = data(i,end);
        x = data(i,1:end-1);
        for j = 1:len     
            yPredict = w_space(j).w*x'+b_space(j);
            voting = 0;
            if yPredict > 0
                prior = 1;
                voting = voting +prior*vote(j);
            elseif yPredict <= 0 
                prior = -1;
                voting = voting +prior*vote(j);
            end
        end
        if voting*y > 0
            correctNumber = correctNumber+1;
        end
        result =[result,i];
    end
end