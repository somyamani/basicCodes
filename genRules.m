
function [G F]=genRules(d1,d2,n)

rng('shuffle');


G=densityG(n,d1*10);
F=densityF(n,d2);
