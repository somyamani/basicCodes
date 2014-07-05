
% binarray2vecdec
% input: binary array
% output: row vector (iith number= decimal equivalent of iith column of input)
function A=binarray2vecdec(ar)
sar=size(ar);
A=zeros(1,sar(2));
for ii=1:sar(2)
A(ii)=bin2dec(num2str(ar(:,ii)'));
end