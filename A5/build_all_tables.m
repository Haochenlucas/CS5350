clear all;
traindata = build_table('speeches.train.liblinear');
testdata = build_table('speeches.test.liblinear');
training00 = build_table('training00.data');
training01 = build_table('training01.data');
training02 = build_table('training02.data');
training03 = build_table('training03.data');
training04 = build_table('training04.data');
save('data','traindata','testdata','training00',...
'training00','training01','training02',...
'training03','training04');