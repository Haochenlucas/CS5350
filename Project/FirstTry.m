clear all;
table = parse_data("BeijingPM20100101_20151231.csv");
[train, test] = DT_transform_features( table );