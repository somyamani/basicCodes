% vecdec2binarray:
% input: decimal vector(row or column)
% output: binary array with number of rows='dig'( column i = ith decimal number of the input)
function A=vecdec2binarray(vec,dig)
svec=size(diag(vec));
A=zeros(dig,svec(1)); 
for ii=1:svec(1)
A(:,ii)=str2num((dec2bin(vec(ii),dig))'); % dec2bin gives out a str output...
end
