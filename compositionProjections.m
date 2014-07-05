function ci=compositionProjections(n)


compositions=vecdec2binarray(0:2^n-1,n);

comp1=repmat(compositions,2^n,1);
comp1=reshape(comp1,n,2^(2*n));
comp2=repmat(compositions,1,2^n);
comp3=comp1.*comp2;
comp3=binarray2vecdec(comp3);
ci=reshape(comp3,2^n,2^n);