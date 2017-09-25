training00 = build_table('training00.data');
training01 = build_table('training01.data');
training02 = build_table('training02.data');
training03 = build_table('training03.data');
training04 = build_table('training04.data');

wo_training00 = [training01; training02; training03; training04];
wo_training01 = [training00; training02; training03; training04];
wo_training02 = [training00; training01; training03; training04];
wo_training03 = [training00; training01; training02; training04];
wo_training04 = [training00; training01; training02; training03];

phishing_dev = build_table('phishing.dev');
phishing_test = build_table('phishing.test');
phishing_train = build_table('phishing.train');