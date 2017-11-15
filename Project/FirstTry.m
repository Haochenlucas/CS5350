[train, test] = DT_transform_features(City);
attributes = ones(length(train(1,:))-1, 1);
tree = ID3(train, attributes);