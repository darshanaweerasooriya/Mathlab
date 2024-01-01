% Load fisheriris dataset 
load fisheriris.mat;
data = meas; 


% Shuffled the data set 
% rng('default');
shuffleIdx = randperm(size(data,1));
shuffledata = data(shuffleIdx, :);
shufflelabel = species(shuffleIdx);


% Split the Data as 60% for Training and 40% for Testing 
splitIdx = round(0.6 * size(data, 1));
trainData = shuffledata(1:splitIdx,:);
testData = shuffledata(splitIdx + 1:end,:);
trainSpecies = shufflelabel(1:splitIdx);
testSpecies = shufflelabel(splitIdx + 1:end);


% Assigning Different k values
K_values = [5,7];


% Using for Loop for iteration 
for K= K_values
    fprintf('K-Nearest Neighbour with k = %d:\n',K);

    % K-Nearest Neighnour model TRainning
    knn_model = fitcknn(trainData, trainSpecies, 'NumNeighbors',K);

    % Predicting on the test dataset
    PredictedtestLables = predict(knn_model, testData);

    % Evaluate Performance 
    Confusionmatrix = confusionmat(testSpecies, PredictedtestLables);
    Accuracy = sum(diag(Confusionmatrix)) / sum(Confusionmatrix(:)) * 100 ;

    % Display the result of Confusion Mstrix 

    fprintf('Confusion Matrix : \n')
    disp(Confusionmatrix);

    fprintf(' Accuracy is : %.2f%%\n', Accuracy);

end