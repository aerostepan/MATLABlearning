load('MNIST_data.mat')

n = length(YTrain);
idx=randi(n,32,1);

for i=1:32
   subplot(4,8,i)
   imshow(XTrain(:,:,:,idx(i)));
   title(YTrain(idx(i)));
end

layers=[imageInputLayer([28,28,1])
    fullyConnectedLayer(200)
    reluLayer
    fullyConnectedLayer(50)
    reluLayer
    fullyConnectedLayer(10) 
    softmaxLayer
    classificationLayer];

options=trainingOptions('adam',...
    'Shuffle','every-epoch',...
    'InitialLearnRate',0.01,...
    'MaxEpochs', 10,...
    'MiniBatchSize',600,...
    'ValidationData',{XTest,YTest},...
    'ValidationFrequency',10,...
    'Plots','training-progress');

net=trainNetwork(XTrain,YTrain,layers,options);

%Netzwerk testen
YTest = classify(net,XTest);
YTrue = YTest;
confMat = confusionmat(YTrue, YTest);
disp(confMat)
figure;
confusionchart(YTrue,YTest)