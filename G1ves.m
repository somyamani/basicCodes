% G st there is 1 entry in each column..



function G=G1ves(n)

G=false(2^n);
gal=G_all(n);
gal(:,1)=0;


for ii=1:2^n

f=find(gal(ii,:));
if isempty(f)==0 
del=f(randi(length(f)));
G(ii,del)=1;
end
end










