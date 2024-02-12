function [centroids, idx, Jvect] = runkMeans(X, initial_centroids, max_iters, plot_progress)
%{
RUNKMEANS runs the K-Means algorithm on data matrix X, where each row of X
%is a single example
%   [centroids, idx] = RUNKMEANS(X, initial_centroids, max_iters, ...
%   plot_progress) runs the K-Means algorithm on data matrix X, where each 
%   row of X is a single example. It uses initial_centroids used as the
%   initial centroids. max_iters specifies the total number of interactions 
%   of K-Means to execute. plot_progress is a true/false flag that 
%   indicates if the function should also plot its progress as the 
%   learning happens. This is set to false by default. runkMeans returns 
%   centroids, a Kxn matrix of the computed centroids and idx, a m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%}

centroids = cell(1, max_iters); % Evolucion de los centroides
actual_centroids = initial_centroids;
Datos_centroide = cell(1, size(initial_centroids,1));
K=size(initial_centroids,1);
colores=['r';'g';'c';'m';'y';'z';'b'];

figure()
for i=1:max_iters
    [idx,J] = findClosestCentroids(X, actual_centroids);
    for aux=1:K
        condicion=(idx==aux);
        Datos_centroide{aux}=X(condicion,:);
    end

    Jvect(i)=J;    
    centroids{i} = computeCentroids(X, idx, K);

    if(plot_progress==1) 
        hold on
        Centroides=centroids{i};
        plot(Centroides(:,1),Centroides(:,2),'kx');
        for aux=1:K
            Datos=Datos_centroide{aux};           
            plot(Datos(:,1),Datos(:,2),[colores(aux),'o']);       
        end
        title('Datos + Evolucion centroides, iteracion final numero ',int2str(i))
        xlabel('x1')
        ylabel('x2')
    end
    
    pause(1)
    
    if (centroids{i} == actual_centroids)
        fprintf(['El algoritmo se ejecuta ', num2str(i), ' veces \n']);
        break;
    end
    actual_centroids = centroids{i}; % Actualizar los centroides
    
end


end

