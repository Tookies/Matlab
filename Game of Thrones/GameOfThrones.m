%% %Game of Thrones
clear;
filename = 'g_edges.csv';
table = readtable(filename);
G = digraph(table2array(table(:, 'Source')),table2array(table(:, 'Target')),table2array(table(:, 'Weight')));
p = plot(G);

indeg = indegree(G);
G.Nodes.NodeColors = 2*sqrt(indegree(G)-min(indegree(G))+0.2);
p.NodeCData = G.Nodes.NodeColors;
colorbar;

amount = 5;
answers = "";
for a = 1:1:amount-1
    answers = [answers;""];
end
for a=1:1:(size(indeg))(1)
    indeg(a,2) = a;
end
num = 0;
b = size(indeg);
for i= 1:1:b(1)-1
    j = i;
    while indeg((j + 1),1) >indeg(j,1)
        num = indeg((j + 1),1);
        indeg((j + 1),1) = indeg(j,1);
        indeg(j,1) = num;
        num = indeg((j + 1),2);
        indeg((j + 1),2) = indeg(j,2);
        indeg(j,2) = num;
        j=j-1;
        if j == 0 
            break;
        end
    end
end
for a = 1:1:amount
    answers(a) = G.Nodes{indeg(a,2),1}
end

P = shortestpath(G,'NED','TYRION');
