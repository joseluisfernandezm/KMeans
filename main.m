%% Initialization
clear ; close all; clc

%% ================= Part 1: Find Closest Centroids ====================
%  To help you implement K-Means, we have divided the learning algorithm 
%  into two functions -- findClosestCentroids and computeCentroids. In this
%  part, you shoudl complete the code in the findClosestCentroids function. 
%
fprintf('Finding closest centroids.\n\n');

% Load an example dataset that we will be using
load('datos_P9.mat');
plot(X(:,1), X(:,2),'MarkerSize',10,'Marker','x','LineWidth',2,'LineStyle','none','Color',[0 0 0]);
% Create xlabel
xlabel('x1');
% Create ylabel
ylabel('x2');

% Select an initial set of centroids
K = 3; % 3 Centroids
initial_centroids = [3 3; 6 2; 8 5];

x1=X(:,1);%(Datos de entrenamiento)
x2=X(:,2);%(Datos de entrenamiento)

% Find the closest centroids for the examples using the
% initial_centroids


%Your code here

[idx,J] = findClosestCentroids(X, initial_centroids);



%% ===================== Part 2: Compute Means =========================
%  After implementing the closest centroids function, you should now
%  complete the computeCentroids function.
%
fprintf('\nComputing centroids means.\n\n');

%  Compute means based on the closest centroids found in the previous part.


%Your code here

centroids = computeCentroids(X, idx, K);



%% =================== Part 3: K-Means Clustering ======================
%  After you have completed the two functions computeCentroids and
%  findClosestCentroids, you have all the necessary pieces to run the
%  kMeans algorithm. In this part, you will run the K-Means algorithm on
%  the example dataset we have provided. 
%
fprintf('\nRunning K-Means clustering on example dataset.\n\n');
close all
% Load an example dataset
load('datos_P9.mat');

% Settings for running K-Means
K = 3;
max_iters = 10;

% For consistency, here we set centroids to specific values
% but in practice you want to generate them automatically, such as by
% settings them to be random examples (as can be seen in
% kMeansInitCentroids).
initial_centroids = [3 3; 6 2; 8 5];

% Run K-Means algorithm. The 'true' at the end tells our function to plot
% the progress of K-Means

%Your code here

[centroids, idx, J] = runkMeans(X, initial_centroids, max_iters, 1);


figure()
plot(J);
title('Evolucion de J(Theta)')
xlabel('N iters')
ylabel('Coste J(Theta)')

