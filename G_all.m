% 16-9-2013
% budding matrix encoding for all possible vesicles
function apv= G_all(n)

c=vecdec2binarray(0:2^n-1,n)==0;% what the compartment ii does not contain
v=vecdec2binarray(0:2^n-1,n);
apv=c'*v==0;
