 function [Aff,Z_tensor,JZ]=DARLNS(K,alf,k)

m=size(K,2);
n=size(K{1},2);
sX=[n,n,m];
for i=1:m
    Z{i}=zeros(n);
    J{i}=zeros(n);
    W{i}=zeros(n);
end
iter=0;
iterMax=30;
mu=1e-4;
muMax=1e10;
rho=2;
%epsi=1e-7;
epsi=1e-10;
while iter<iterMax
    iter=iter+1;
    fprintf("%d ",iter);
    for i=1:m
        Z{i}=(2*K{i}+mu*eye(n))\(2*K{i}-W{i}+mu*J{i});
        Z{i}=domint_Affinity_representation(Z{i},k);
    end
    
    Z_tensor=cat(3,Z{:,:});
    W_tensor=cat(3,W{:,:});
    z=Z_tensor(:);
    w=W_tensor(:);
%    [j, tensorvalues] = wshrinkObj(z +w/mu,1/mu,sX,0,3);
    j=TNNfromPython(Z_tensor+W_tensor/mu, alf/mu);
       J_tensor = reshape(j, sX);
%     %更新拉格朗日橙子
    w=w+mu*(z-j);
   W_tensor=reshape(w,sX);
  for i=1:m
        W{i}=W_tensor(:,:,i);
        J{i}=J_tensor(:,:,i);
    end
 
%   
    mu=min(muMax,rho*mu);
    tempJZ=0;
    for i=1:m
        errJZ(i)=norm(Z{i}-J{i},inf);
        tempJZ=tempJZ+errJZ(i);
    end
%     if errJZ<epsi
%         break;
%     end
    JZ(iter)=tempJZ;
end


Aff=zeros(n);
for i=1:m
    Aff=Aff+Z{i}/2;
   % Aff=Aff+J{i}/2;
end
ZZ=Aff;
 Aff=domint_Affinity_representation(Aff,k);
Aff=(Aff+Aff')/2;


fprintf("\n");

end