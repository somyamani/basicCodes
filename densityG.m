% generate random G
% n=number of molecules
% d=density of ones (0-1)
function G=densityG(n,d)

apv=G_all(n);
G=false(2^n);
f=find(apv);
r=rand(length(f),1)<=d;
G(f(r))=1;