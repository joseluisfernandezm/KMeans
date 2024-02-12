function [idx,J] = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);%vamos a tomasr como K el numero de centroides que asignemos

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);
a = zeros(size(X,1), 1);

%{
====================== YOUR CODE HERE ======================
Instructions: Go over every example, find its closest centroid, and store
              the index inside idx at the appropriate location.
              Concretely, idx(i) should contain the index of the centroid
              closest to example i. Hence, it should be a value in the 
              range 1..K

Note: You can use a for-loop over the examples to compute this.

=============================================================
%}

m=size(X,1);%numero de datos
J=0;%inicializamos j


for i = 1:m
    d=zeros(K,1);
    for k = 1:K
            %formula de la distancia euclidea de cada dato X a cada uno
            %de los centroides y luego me quiero quedar con el que
            %tengo distancia minima                            
            d(k) = sqrt(sum((X(i, :) - centroids(k, :)).^2));            
    end
    [min_d,idx(i)]=min(d);%con esta linea sacamos la distacioa minima y el indice en d
    J=J+min_d;%asi calculamos el sumatorio de la formula
end

J=J/m;%dividimos entre m como dice la formula de la funcion de coste

end

