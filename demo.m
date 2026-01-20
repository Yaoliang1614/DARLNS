clc;
clear;
%%
load 'ORL_32x32'; 
X=fea';
gt=gnd;
X=NormalizeFea(X,0);
%%
K{1}=X'*X;
K{2}=corr(X,X,'type','Spearman');

%%
num_cls=length(unique(gt));
temp=0;
alf=10;
k=  [8];

%%
[W ,ZZ,JZ]=	DARLNS(K,alf,k);
toc;
P= mySpectralClustering(W,num_cls);
for rep=1:10
    [nmi(rep),acc(rep),f(rep),purity(rep)]=zhixing_Kmeans(P,num_cls,gt);
end
ACC=mean(acc);
NMI=mean(nmi);
Fscore=mean(f);
Purity=mean(purity);
[ACC,NMI,Fscore, Purity]


