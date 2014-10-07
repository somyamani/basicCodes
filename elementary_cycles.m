% 8/05/2013
% breaks an adjacency matrix into strongly connected components (Tarjan's
% algorithm) and finds all elementary circuits in the whole graph scc by
% scc.
% uses the recursive subroutine "circuits"
% inputs: adjacency matrix
% outputs: cell list of all elementary circuits... 
% vertices involved are listed in a column in decimal...0 indicates end of list
function cycle_list=find_elementary_cycles(adjmat)
% nodes are already ordered...
% split into induced subgraphs of sccs
% all vertices within an scc fall into cycles....
% find all cycles in induced subgraphs

scc_list=tarjan(adj2adjL(adjmat));% list (cell array) of vertices in SCCs
num_scc=size(scc_list,2);% number of sccs
cycle_list=false(size(adjmat,2),1);
count=0;
for ii=1:num_scc
nodes=cell2mat(scc_list(ii));
adjmat2=adjmat(nodes,nodes);% induced subgraph containing only vertices in scc ii
n=length(nodes);% number of nodes
for jj=1:n
source=jj;% source node: all other nodes in path have to be greater than source; no nodes in the path can be repeated
if jj>1
    % only the nodes greater than the source node matter
    adjmat2=adjmat2(2:end,2:end);% no nodes lesser than the source node can figure in a path extended from it
    nodes=nodes(2:end);
end
path=zeros(length(adjmat2),1);% stores current elementary path (column vector)
x=diag(nodes)*circuit(1,1,path,adjmat2,0,path);
if isempty(find(x,1))==0
for kk=1:size(x,2)
x2=x((logical(x(:,kk))),kk);
count=count+1;
x1=false(length(adjmat),1);
x1(x2)=1;
cycle_list(:,count)=x1;% list of elementary circuits in scc ii...circuit is a recursive subroutine which finds elementary ckts in adjmats using tiernan's algorithm
end
end
end
end

function ckts=circuit(source1,nextnode,path,adjmat,count,ckts)
% source1 =original source; source=next node in path; adjmat2=reduced
% adjacency matrix which blocks all nodes already seen; path= current path
% being followed; count=number of nodes seen
path(nextnode)=1;
adjmat2=adjmat;
adjmat2(:,logical(path))=0;% once a node has been added to the path, it cannot be repeated (blocked)
f=find(adjmat2(nextnode,:));% list of all nodes the node just added to the path connects to
if isempty(f)==0% if a dead end hasn,t been hit
    if adjmat(nextnode,source1)==1% check if a cycle has been hit anyway
    count=count+1;
    ckts(:,count)=path;% if so, store it
    end
for ii=1:length(f)
    if isempty(find(ckts,1))==1
ckts=circuit(source1,f(ii),path,adjmat,0,ckts);
    else
ckts=circuit(source1,f(ii),path,adjmat,size(ckts,2),ckts);
    end
end
else
if adjmat(nextnode,source1)==1
    count=count+1;
    ckts(:,count)=path;
end
end
