test = build_table('phishing.test');
test_result = test(:, 68);
dev = build_table('phishing.dev');
dev_result = dev(:, 68);

err_test = 0;
err_dev = 0;

mode_test = mode(test_result);
mode_dev = mode(dev_result);

t = length(find(test_result == -mode_test));
disp("Majority baseline accuracy on test set is " + 100 * (1 - (t / length(test_result))) + "%.");
 
d = length(find(dev_result == -mode_dev));
disp("Majority baseline accuracy on development set is " + 100 * (1 - (d / length(dev_result))) + "%.");