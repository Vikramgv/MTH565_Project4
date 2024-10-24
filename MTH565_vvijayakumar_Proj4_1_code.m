%Vikram Vijayakumar (02068559)
%MTH 565 Project 4_1

n = 200;  %Number of vertices, n is changed for partb
max_t = n*(n-1)/2;  %Maximum number of possible edges

%Initialize the graph with n vertices and no edges
    G = graph();  
    G = addnode(G, n);  %Add n vertices to the graph

node = 1:n;  %For all vertices of n

% Track the number of edges added (t)
for t = 1:max_t
    % Select two random vertices 
    while true
        [i, j] = deal(randi(n), randi(n));  % Randomly select two vertices
        if i ~= j && node(i) ~= node(j)
            break;  % Ensure that i and j are in different components
        end
    end
    
    % Add the edge between i and j
    G = addedge(G, i, j);  % Add the edge
    
    %Merge the vertices of i and j
    node(node == node(j)) = node(i);  % Merge components

    %Update the graph with the new edge
    h = plot(G, 'Layout', 'force');  
    pause(0.05);  

    %Check if the graph is connected
    if isconnected(G)
        disp(['Graph became connected at t = ', num2str(t)]);
        break;
    end
end

%Calculate the average vertex degree k
k = 2 * numedges(G) / n;
disp(['Average vertex degree k at t = ', num2str(t), ' is ', num2str(k)]);

% Final display of the connected graph
title(['Random Graph Gt( ', num2str(n), ' - Final Connected Graph at t = ', num2str(t)]);
hold off;


function connected = isconnected(G)
    % ISCONNECTED checks if the graph G is connected.
    % Returns true if the graph is connected, false otherwise.

    % Get the connected components of the graph
    components = conncomp(G);

    % Check if there is only one connected component
    if max(components) == 1
        connected = true;  %Graph is connected
    else
        connected = false; %Graph is not connected
    end
end