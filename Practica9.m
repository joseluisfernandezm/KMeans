clear all
close all
clc

%{
CONTENIDOS:

El objetivo de esta practica es implementear el algoritmo K-means. 
Recordamos que el algoritmo es no supervisado, lo que significa que no
vamos a contar con las etiquetas de los datos de entrenamiento.
Vamos a ejecutar K-means sobre un conjunto de datos bidimensional. 

%}

%% Carga de datos

load('datos_P9.mat'); %cargamos los datos del fichero con load en la variable X

% extraemos los datos en 2 vectores x1 y  para hacerlo generico

x1=X(:,1);%(Datos de entrenamiento)
x2=X(:,2);%(Datos de entrenamiento)


%% Visualizacion de los datos 

%plot de los datos

figure()
plot(x1,x2,'ko');
title('Datos datos_P9.mat')
xlabel('x1')
ylabel('x2')

%% Paso 1 Asignacion de los datos a un cluster

initial_centroids=[[3,3];[6,2];[8,5]];%me lo dan en el guion

[idx,J] = findClosestCentroids(X, initial_centroids);

%% Paso 2 Recalcular los centroides

%{
Para ello se calcula la media de los puntos asignados a cada centroide
%}

K=size(initial_centroids,1);
centroids = computeCentroids(X, idx, K);

%% Ejecutando K-means

max_iters=8;%te lo tienen que indicar

[centroids, idx, J] = runkMeans(X, initial_centroids, max_iters, 1);

figure()
plot(J);
title('Evolucion de J(Theta)')
xlabel('N iters')
ylabel('Coste J(Theta)')

%{
PREGUNTAS:

¿El resultado es el esperado?

¿Cuantas iteraciones ha tardado en converger el algoritmo?

¿Cree que el algoritmo ha convergido al minimo global?
%}

