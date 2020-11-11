training = ["first"; "first"; "first"; "second"; "first"; "third"; "first"; "second"];

model = dictionaryFT_train(training);

toTransform = ["first"; "second"; "first"; "fourth"; "fifth"];

out = dictionaryFT_transform(toTransform, model);


training

model

toTransform

out

