% Task 2.3
% Loading the dataset
load ("kmeansdata.mat");

% Ploting the data set for myself
figure;
plot(X(:,1), X(:,2), 'o');
title('Kmean dataset');

% k values assignation 
KValues=[3, 4, 5];
KvalueLength = length(KValues);

% Creating arrays to store the values 
meanSilhouette = zeros(size(KValues));
ForClusters = cell(size(KValues));
ForCentroids = cell(size(KValues));

% iterate the K value using forloop for the clustering
for value = 1:length(KValues)
    k=KValues(value);

    % kmean Clustering 
    [ForClusters{value} , ForCentroids{value}] = kmeans(X, k, 'MaxIter',100);
    % KMean Clustering 
    [idx ,C] = kmeans(X,k);


    % Calculating Silhouette 
    silhouette_Value = silhouette(X, ForClusters{value});
    meanSilhouette(value)= mean(silhouette_Value);

   

    % Ploting the Centroids and Clustering 
    figure;
    % subplot(1, KvalueLength, value);
    gscatter(X(:,1), X(:,2), idx);
    hold on 
    plot(C(:,1), C(:,2), 'kx', 'MarkerSize', 15, 'LineWidth', 2);
    legend('Cluster 1,','Cluster 2','Cluster 3','Centroids','Location', 'NW')
    title(['Number of clusters = ' num2str(k)]);
    hold off;

    % Display the Silhouette plot
    figure;
    [silh, h] = silhouette(X, idx, 'sqEuclidean');
    title(["Number of clusters =" int2str(k)]);
    xlabel('Silhouette Value');
    ylabel('Clusters');
    mean_silh = mean(silh);


    % % Plot Silhouette values
    % subplot(2, length(K_values), value + length(K_values));
    % silhouette(clusterIndices{value}, silhouetteValues);
    % title(['Silhouette Values for K = ', num2str(k)]);
end

%  Best number of clusters 
[Best_Mean_Silhouette, bestK] =  max(meanSilhouette);
bestK = KValues(bestK);

% Best Number of CLusters display 
disp(['Best number of Cluster is ', num2str(bestK), ' with mean Silhouette = ', num2str(Best_Mean_Silhouette)]);