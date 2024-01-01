% Task 2.2 Neural network (PUSL 3123)
% Group 21 

% Loading the dataset 
load fisheriris.mat
data = size(meas,1);

% Shuffle the dataset randomly 
rng('default');
Shuffleindx = randperm(data);

% Spliting the data 
Rate_of_train = 0.6;
TrainIndi = Shuffleindx(1:round(Rate_of_train*data));
testIndi = Shuffleindx(round(Rate_of_train*data)+ 1:end);

TrainData = meas(TrainIndi, :);
TestData = meas(testIndi,:);
TraininTarget = categorical(species(TrainIndi));
TestingTarget = categorical(species(testIndi));

HiddenLayerSizes = [10,15,20];

NuofExperiment = 4 ;

for iteration = 1: length(HiddenLayerSizes)
    Layer = HiddenLayerSizes(iteration);
    fprintf('------------------------------\n')
    fprintf('Hidden Laayer Size:%d\n',Layer);

    for experiment =1:NuofExperiment
        fprintf('Number of experiment: %d \n',experiment);

        net = feedforwardnet(Layer);

        in_binary = dummyvar(double(TraininTarget));

        net = train(net, TrainData',in_binary');

        view(net);

        % Testing 
        NNprediction = net(TestData');

        Prediction_Label = vec2ind(NNprediction);

        NNAccuracy =sum(Prediction_Label == double(TestingTarget')) / length(TestingTarget);

        fprintf('\nAccuracy: %.2f%%\n',NNAccuracy*100);
    end
end
