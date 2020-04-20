clc
clear

file = "C:\Users\15022\Documents\MATLAB\trainData\finalData.csv"
a = csvread(file)
la = size(a , 2)
lb = size(a , 1)
% [XTrain,YTrain] = japaneseVowelsTrainData;
XTrain = a( : , 2 : la )
YTrain = a ( :  , 1)
rowDist = ones( lb,1)
Xt = mat2cell(XTrain , rowDist)
% Yt = mat2cell( YTrain ,rowDist )
Yt = categorical( YTrain)
% figure
% plot(XTrain{1}')
% xlabel("Time Step")
% title("Training Observation 1")
% numFeatures = size(XTrain{1},1);
% legend("Feature " + string(1:numFeatures),'Location','northeastoutside')

% numObservations = numel(XTrain);
% for i=1:numObservations
%     sequence = XTrain{i};
%     sequenceLengths(i) = size(sequence,2);
% end
% 
% [sequenceLengths,idx] = sort(sequenceLengths);
% XTrain = XTrain(idx);
% YTrain = YTrain(idx);

% figure
% bar(sequenceLengths)
% ylim([0 30])
% xlabel("Sequence")
% ylabel("Length")
% title("Sorted Data")


inputSize = 1;
numHiddenUnits = 600;
numClasses = 20;

layers = [ ...
    sequenceInputLayer(inputSize)
    bilstmLayer(numHiddenUnits,'OutputMode','last')
    fullyConnectedLayer(numClasses)
    softmaxLayer
    classificationLayer]

maxEpochs = 300;
miniBatchSize = 27;

options = trainingOptions('adam', ...
    'ExecutionEnvironment','cpu', ...
    'GradientThreshold',1, ...
    'MaxEpochs',maxEpochs, ...
    'MiniBatchSize',miniBatchSize, ...
    'SequenceLength','longest', ...
    'Shuffle','never', ...
    'Verbose',0, ...
    'Plots','training-progress');

net = trainNetwork(Xt,Yt,layers,options);

file = "C:\Users\15022\Documents\MATLAB\testData\finalData.csv"
a = csvread(file)
la = size(a , 2)
% [XTest,YTest] = japaneseVowelsTestData;
XTest = a( : , 2 : la )
lb = size(a , 1)
rowDist = ones( lb,1)
XTest = mat2cell(XTest , rowDist)
YTest = categorical(a ( :  , 1))
XTest(1:3)

% numObservationsTest = numel(XTest);
% for i=1:numObservationsTest
%     sequence = XTest{i};
%     sequenceLengthsTest(i) = size(sequence,2);
% end
% [sequenceLengthsTest,idx] = sort(sequenceLengthsTest);
% XTest = XTest(idx);
% YTest = YTest(idx);
% miniBatchSize = 27;
YPred = classify(net,XTest, ...
    'MiniBatchSize',miniBatchSize, ...
    'SequenceLength','longest');
acc = sum(YPred == YTest)./numel(YTest)
avacc = zeros(lb / 10 ,1)
for i = 1 : lb/10
    avacc(i) = sum(YPred( 1 + 10 *(i-1) : 10 * i) == YTest( 1 + 10 *(i-1) : 10 * i))./10
end