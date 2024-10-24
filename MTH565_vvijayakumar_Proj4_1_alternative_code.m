%Vikram Vijayakumar (02068559)
%MTH 565 Project 4_1(alternative)

n = 100;  %Number of vertices, n is changed for partb
max_t = n*(n-1)/2;  % Maximum number of possible edges

    %Initialize the graph with n vertices and no edges
    G = graph();  
    G = addnode(G, n);  %Add n vertices to the graph

    %Track the number of edges added (t)
    for t = 1:max_t
        % elect two random vertices that are not yet connected by an edge
        [i, j] = deal(randi(n), randi(n));  % Randomly select two vertices

        %Ensure that i and j are not the same and there is no existing edge between them
        while i == j || ismember([i j], G.Edges.EndNodes, 'rows') || ismember([j i], G.Edges.EndNodes, 'rows')
            [i, j] = deal(randi(n), randi(n));  %Randomly select two different vertices
        end

        %Add the edge between i and j
        G = addedge(G, i, j);  % Add the edge

        %Check if the graph is connected
        if isconnected(G)
            disp(['Sample ', num2str(sample), ': Graph became connected at t = ', num2str(t)]);
            break;
        end
    end

    %Calculate the average vertex degree k
    k = 2 * numedges(G) / n;
    disp(['Sample ', num2str(sample), ': Average vertex degree k at t = ', num2str(t), ' is ', num2str(k)]);

    %Plot the graph
    figure;
    plot(G, 'Layout', 'force'); 
    title(['Random Graph Gt( ', num2str(n), ') Average vertex degree k at t = ', ...
        num2str(t), ' is ', num2str(k)]);


function connected = isconnected(G)
    % ISCONNECTED checks if the graph G is connected.
    % Returns true if the graph is connected, false otherwise.

    % Get the connected components of the graph
    components = conncomp(G);

    %Check if there is only one connected component
    if max(components) == 1
        connected = true;  %Graph is connected
    else
        connected = false; %Graph is not connected
    end
end