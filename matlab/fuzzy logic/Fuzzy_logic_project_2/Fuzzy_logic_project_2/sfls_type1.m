%% sfls_type1.m

%% Compute the output(s) of a singleton type-1 FLS, when the antecedent 
%% membership functions are Gaussian (Chapter 5 of Uncertain Rule-Based 
%% Fuzzy Logic Systems: Introduction and New Directions, by Jerry M. Mendel, 
%% and published by Prentice-Hall, 2000).

%% M, sigma ��these two symbols are mxn��ά�ȣ� matrix denotes the mean����ֵ�� and std����� of
%% antecedent Gaussian MFs (m rules, with n antecedent in each rule)
%% C is mx1��ά�ȣ� vector, which denotes the height of consequents
%% X is input matrix, Lxn��ά�ȣ� matrix, each row is an input.


function [OUT]=sfls_1(M,sigma,C,X)

OUT=[];
[L,n]=size(X);  %��ʾ����L��rule��n��
[m,n]=size(M);  %��ʾ����m��rule��n��

%cΪyֵ

for i=1:L   %���ÿ��input
    U=[];
    for j=1:m  %m rules
        u=1;
        for t=1:n  % n antecedent
            u=u*gaussmf(X(i,t),[sigma(j,t),M(j,t)]);  %X(i,t)��ʾ�������i�е�t�У�sigmaΪsigma�ķ��MΪ��j�е�t��
        end
        U=[U,u];  %���Ӧ����ƴ�Ӱɣ���ÿһ�ε����ݰ��µ�һ�м�¼����
    end
    
    fa=U/sum(U);  %
    f=fa*C;  %
    OUT=[OUT,f];   %��ʾÿ��input�����
end
