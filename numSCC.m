% number of scc in a graph...

function n=numSCC(graph)

n=length(graph);
g1=(graph+eye(n))^n>0;
g2=(g1'+eye(n))^n>0;
g3=unique(g1+g2==2,'rows');
n=size(g3,1);