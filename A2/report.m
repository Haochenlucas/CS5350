% learning rate, epoch, margin
epoch = 10;
r = 0;
margin = 0;

simpleTable = cell(4, 7);
dynamicTable = cell(4, 7);
marginTable = cell(7, 7);
averagedTable = cell(4, 7);

% counter for marginTable
count_mar = 0;

for i = 1:3
    
    if i == 1
        r = 1;
    elseif i == 2
        r = 0.1;
    elseif i == 3
        r = 0.01;
    end
    
    % report for simple_perceptron
    [w,b,e] = simple_perceptron(wo_training00, r, epoch);
    errors_00 = report_errors(w, b, training00);
    [w,b,e] = simple_perceptron(wo_training01, r, epoch);
    errors_01 = report_errors(w, b, training01);
    [w,b,e] = simple_perceptron(wo_training02, r, epoch);
    errors_02 = report_errors(w, b, training02);
    [w,b,e] = simple_perceptron(wo_training03, r, epoch);
    errors_03 = report_errors(w, b, training03);
    [w,b,e] = simple_perceptron(wo_training04, r, epoch);
    errors_04 = report_errors(w, b, training04);
    if (i == 1)
        [w,b,e] = simple_perceptron(phishing_train, r, 20);
        disp("Simple Perceptron updates while learning rate is 1: " + e);
        errors_dev = report_errors(w, b, phishing_dev);
        errors_test = report_errors(w, b, phishing_test);
        disp("errors in dev set: " + 100 * (1 - (errors_dev / length(phishing_dev))));
        disp("errors in test set: " + 100 * (1 - (errors_test / length(phishing_test))));
        disp("---------------------------------------------------");
        
        x_sim = [];
        y_sim = [];
        w = 0.02 * rand(1,67) - 0.01;
        b = 0.02 * rand - 0.01;
        for ep = 1:20
            [w,b] = sim_percep_epoch(phishing_train, r, w, b);
            errors_dev = report_errors(w, b, phishing_dev);
            x_sim(end+1) = ep;
            y_sim(end+i) = 100 * (1 - (errors_dev / length(phishing_dev)));
        end        
    end
    
    simpleTable{i + 1, 1} = "r = " + r;
    simpleTable{i + 1, 1 + 1} = 100 * (1 - (errors_00 / length(training00)));
    simpleTable{i + 1, 2 + 1} = 100 * (1 - (errors_01 / length(training01)));
    simpleTable{i + 1, 3 + 1} = 100 * (1 - (errors_02 / length(training02)));
    simpleTable{i + 1, 4 + 1} = 100 * (1 - (errors_03 / length(training03)));
    simpleTable{i + 1, 5 + 1} = 100 * (1 - (errors_04 / length(training04)));
    simpleTable{i + 1, 6 + 1} = 100 * (1 - ((errors_00 + errors_01 + errors_02 + errors_03 + errors_04) / ...
    (length(training00) + length(training01) + length(training02) + length(training03) + length(training04))));
    
    % report for dynamicR_perceptron    
    [w,b,e] = dynamicR_perceptron(wo_training00, r, epoch);
    errors_00 = report_errors(w, b, training00);
    [w,b,e] = dynamicR_perceptron(wo_training01, r, epoch);
    errors_01 = report_errors(w, b, training01);
    [w,b,e] = dynamicR_perceptron(wo_training02, r, epoch);
    errors_02 = report_errors(w, b, training02);
    [w,b,e] = dynamicR_perceptron(wo_training03, r, epoch);
    errors_03 = report_errors(w, b, training03);
    [w,b,e] = dynamicR_perceptron(wo_training04, r, epoch);
    errors_04 = report_errors(w, b, training04);
    if (i == 1)
        [w,b,e] = dynamicR_perceptron(phishing_train, r, 20);
        disp("Dynamic Perceptron updates while learning rate is 1: " + e);
        errors_dev = report_errors(w, b, phishing_dev);
        errors_test = report_errors(w, b, phishing_test);
        disp("errors in dev set: " + 100 * (1 - (errors_dev / length(phishing_dev))));
        disp("errors in test set: " + 100 * (1 - (errors_test / length(phishing_test))));
        disp("---------------------------------------------------");
        
        x_dym = [];
        y_dym = [];
        w = 0.02 * rand(1,67) - 0.01;
        b = 0.02 * rand - 0.01;
        for ep = 1:20
            [w,b] = dya_percep_epoch(phishing_train, r, w, b);
            errors_dev = report_errors(w, b, phishing_dev);
            x_dym(end+1) = ep;
            y_dym(end+i) = 100 * (1 - (errors_dev / length(phishing_dev)));
        end
        
    end
    
    dynamicTable{i + 1, 1} = "r = " + r;
    dynamicTable{i + 1, 1 + 1} = 100 * (1 - (errors_00 / length(training00)));
    dynamicTable{i + 1, 2 + 1} = 100 * (1 - (errors_01 / length(training01)));
    dynamicTable{i + 1, 3 + 1} = 100 * (1 - (errors_02 / length(training02)));
    dynamicTable{i + 1, 4 + 1} = 100 * (1 - (errors_03 / length(training03)));
    dynamicTable{i + 1, 5 + 1} = 100 * (1 - (errors_04 / length(training04)));
    dynamicTable{i + 1, 6 + 1} = 100 * (1 - ((errors_00 + errors_01 + errors_02 + errors_03 + errors_04) / ...
    (length(training00) + length(training01) + length(training02) + length(training03) + length(training04))));
    
    % report for margin_perceptron 
    for j = 1:3
        count_mar = count_mar + 1;
        if j == 1
            margin = 1;
        elseif j == 2
            margin = 0.1;
        elseif j == 3
            margin = 0.01;
        end
        
        [w,b,e] = margin_perceptron(wo_training00, r, margin, epoch);
        errors_00 = report_errors(w, b, training00);
        [w,b,e] = margin_perceptron(wo_training01, r, margin, epoch);
        errors_01 = report_errors(w, b, training01);
        [w,b,e] = margin_perceptron(wo_training02, r, margin, epoch);
        errors_02 = report_errors(w, b, training02);
        [w,b,e] = margin_perceptron(wo_training03, r, margin, epoch);
        errors_03 = report_errors(w, b, training03);
        [w,b,e] = margin_perceptron(wo_training04, r, margin, epoch);
        errors_04 = report_errors(w, b, training04);
        
        if (i == 1 && j == 2)
            [w,b,e] = margin_perceptron(phishing_train, r, margin, 20);
            disp("Margin Perceptron updates while learning rate is 1 and margin is 0.1: " + e);
            errors_dev = report_errors(w, b, phishing_dev);
            errors_test = report_errors(w, b, phishing_test);
            disp("errors in dev set: " + 100 * (1 - (errors_dev / length(phishing_dev))));
            disp("errors in test set: " + 100 * (1 - (errors_test / length(phishing_test))));
            disp("---------------------------------------------------");
            
            x_mar = [];
            y_mar = [];
            w = 0.02 * rand(1,67) - 0.01;
            b = 0.02 * rand - 0.01;
            for ep = 1:20
                [w,b] = mar_percep_epoch(phishing_train, r, margin, w, b);
                errors_dev = report_errors(w, b, phishing_dev);
                x_mar(end+1) = ep;
                y_mar(end+i) = 100 * (1 - (errors_dev / length(phishing_dev)));
            end
            
        end
        
        marginTable{count_mar + 1, 1} = "r = " + r + ", m = " + margin;
        marginTable{count_mar + 1, 1 + 1} = 100 * (1 - (errors_00 / length(training00)));
        marginTable{count_mar + 1, 2 + 1} = 100 * (1 - (errors_01 / length(training01)));
        marginTable{count_mar + 1, 3 + 1} = 100 * (1 - (errors_02 / length(training02)));
        marginTable{count_mar + 1, 4 + 1} = 100 * (1 - (errors_03 / length(training03)));
        marginTable{count_mar + 1, 5 + 1} = 100 * (1 - (errors_04 / length(training04)));
        marginTable{count_mar + 1, 6 + 1} = 100 * (1 - ((errors_00 + errors_01 + errors_02 + errors_03 + errors_04) / ...
        (length(training00) + length(training01) + length(training02) + length(training03) + length(training04))));
    end

    % report for averaged_perceptron    
    [w,b,e] = averaged_perceptron(wo_training00, r, epoch);
    errors_00 = report_errors(w, b, training00);
    [w,b,e] = averaged_perceptron(wo_training01, r, epoch);
    errors_01 = report_errors(w, b, training01);
    [w,b,e] = averaged_perceptron(wo_training02, r, epoch);
    errors_02 = report_errors(w, b, training02);
    [w,b,e] = averaged_perceptron(wo_training03, r, epoch);
    errors_03 = report_errors(w, b, training03);
    [w,b,e] = averaged_perceptron(wo_training04, r, epoch);
    errors_04 = report_errors(w, b, training04);
    
    if (i == 1)
        [w,b,e] = averaged_perceptron(phishing_train, r, 20);
        disp("Averaged Perceptron updates while learning rate is 1: " + e);
        errors_dev = report_errors(w, b, phishing_dev);
        errors_test = report_errors(w, b, phishing_test);
        disp("errors in dev set: " + 100 * (1 - (errors_dev / length(phishing_dev))));
        disp("errors in test set: " + 100 * (1 - (errors_test / length(phishing_test))));
        disp("---------------------------------------------------");
        
        x_ave = [];
        y_ave = [];
        w = 0.02 * rand(1,67) - 0.01;
        b = 0.02 * rand - 0.01;
        for ep = 1:20
            [a,b_a] = ave_percep_epoch(phishing_train, r, w, b);
            errors_dev = report_errors(a, b_a, phishing_dev);
            x_ave(end+1) = ep;
            y_ave(end+i) = 100 * (1 - (errors_dev / length(phishing_dev)));
        end
        
    end
    
    averagedTable{i + 1, 1} = "r = " + r;
    averagedTable{i + 1, 1 + 1} = 100 * (1 - (errors_00 / length(training00)));
    averagedTable{i + 1, 2 + 1} = 100 * (1 - (errors_01 / length(training01)));
    averagedTable{i + 1, 3 + 1} = 100 * (1 - (errors_02 / length(training02)));
    averagedTable{i + 1, 4 + 1} = 100 * (1 - (errors_03 / length(training03)));
    averagedTable{i + 1, 5 + 1} = 100 * (1 - (errors_04 / length(training04)));
    averagedTable{i + 1, 6 + 1} = 100 * (1 - ((errors_00 + errors_01 + errors_02 + errors_03 + errors_04) / ...
    (length(training00) + length(training01) + length(training02) + length(training03) + length(training04))));
end

disp("Simple Perceptron accuracy data:");
simpleTable{1, 1} = "test on: ";
simpleTable{1, 2} = "trainning00";
simpleTable{1, 3} = "trainning01";
simpleTable{1, 4} = "trainning02";
simpleTable{1, 5} = "trainning03";
simpleTable{1, 6} = "trainning04";
simpleTable{1, 7} = "average accuracy";
disp(simpleTable);
disp("---------------------------------------------------");

disp("Dynamic Perceptron accuracy data:");
dynamicTable{1, 1} = "test on: ";
dynamicTable{1, 2} = "trainning00";
dynamicTable{1, 3} = "trainning01";
dynamicTable{1, 4} = "trainning02";
dynamicTable{1, 5} = "trainning03";
dynamicTable{1, 6} = "trainning04";
dynamicTable{1, 7} = "average accuracy";
disp(dynamicTable);
disp("---------------------------------------------------");

disp("Margin Perceptron accuracy data:");
marginTable{1, 1} = "test on: ";
marginTable{1, 2} = "trainning00";
marginTable{1, 3} = "trainning01";
marginTable{1, 4} = "trainning02";
marginTable{1, 5} = "trainning03";
marginTable{1, 6} = "trainning04";
marginTable{1, 7} = "average accuracy";
disp(marginTable);
disp("---------------------------------------------------");

disp("Averaged Perceptron accuracy data:");
averagedTable{1, 1} = "test on: ";
averagedTable{1, 2} = "trainning00";
averagedTable{1, 3} = "trainning01";
averagedTable{1, 4} = "trainning02";
averagedTable{1, 5} = "trainning03";
averagedTable{1, 6} = "trainning04";
averagedTable{1, 7} = "average accuracy";
disp(averagedTable);
disp("---------------------------------------------------");
