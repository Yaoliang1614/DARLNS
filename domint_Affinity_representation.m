function [W]=domint_Affinity_representation(Z,k)
% k samples sparse representation
% written by LiangYao email:2508466534@qq.com
[dumb, idx] = sort( Z,"descend");%对列进行排序
[m,n]=size(Z);
W=zeros(m,n);
for i=1:n
    t=length(find(Z(:,i)>0));
    kk=k;
   if(t>k)
        kk=k;
    elseif(t<k||t==k)
        kk=t;
    end
    firstKindex=idx(1:kk,i);
    firstkSum=sum(dumb(1:kk,i));
    lambda=(firstkSum-1)/kk;
    W(firstKindex,i) = Z(firstKindex,i)-lambda; %z  
end
W(find(W<0))=0;

end