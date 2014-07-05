% find SCCs in input adjacency matrix


function t4=findSCC(ti)

tin1=(ti+eye(size(ti))>0)^size(ti,1)>0;
tin2=(ti'+eye(size(ti))>0)^size(ti,1)>0;
%t3=ti&ti';
t4=tin1&tin2;
%t4=logical(t4-diag(sum(t4,2)==1)+t3);
t4=	unique((t4)>0,'rows');% each row is an scc
