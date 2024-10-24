%Vikram Vijayakumar (02068559)
%MTH 565 Project 4_3

v = 100;  %vertices, we will change this for n = 100, 1000 and 10000
k = 10;
p = k/(v-1);

for sample = 1:10
    A = rand(v) < p;  %Generate random adjacency matrix
    A = triu(A, 1);   %Ensures that the matrix is symmetric by rating the upper traingular part
    A = A + A';       %Symmetric adjacency matrix
    
    G = graph(A);     %Creating a graph from the adjacency matrix
    figure;
    plot(G, 'Layout', 'force');
    title(['Sample:', num2str(sample), ' Random Graph for n = ', num2str(v), ' and p=', num2str(p)]);

    %Calculate density of the graph
    num_edges = numedges(G);  %Number of edges in the graph
    density = 2 * num_edges / (v * (v - 1));
    disp(['n = ', num2str(v), ', p = ', num2str(p), ', Density: ', num2str(density)]);

     %Calculate the diameter of the graph
    D = distances(G); %path between two vertices
    diameter = max(D(:)); %longest path between two vertices
    disp(['Diameter = ', num2str(diameter)]);
end
