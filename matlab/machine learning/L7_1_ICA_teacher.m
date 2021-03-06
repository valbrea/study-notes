clear all; close all;
L = 5000;
n = 3;
v1 = randn(1,L)* 0.1;
v2 = randn(1,L)* 3;
vn = rand(1,L);
s1 = v2.* (vn>0.9) + v1.*(vn<=0.9);
v1 = randn(1,L)* 0.1;
v2 = randn(1,L)* 3;
vn = rand(1,L);
s2 = v2.* (vn>0.95) + v1.*(vn<=0.95);
% s2 = randn(1,L);
s3 = sin( (1:L)/ 500);
%% normalization;
s1 = s1 - mean(s1); s1 = s1 / std(s1);
s2 = s2 - mean(s2);s2 = s2 / std(s2);
s3 = s3 - mean(s3);s3 = s3 / std(s3);
S = [s1; s2; s3];
%% whiten
Rx = S * S' / L ;
[UU, AA, VV] = svd(Rx);
M = UU * AA^(-0.5) * UU';
S= M * S;
Rs = S * S' / L;

%% mixture
A = randn(n);
X = A * S;
%% step 1 whiten
Rx = X * X' / L ;
[UU, AA, VV] = svd(Rx);
M = UU * AA^(-0.5) * UU';
Y = M * X;
Ry = Y * Y' / L;

%% step 2 fast-ICA
Num =200;
W = randn(n);
for ii = 1 : Num
    for jj = 1 : n
        w = W(:, jj);
        z = w' * Y;
        z_g = tanh(z);
        z_h = 1 - z_g.^2;
        Eg = zeros(n,1);
        for kk = 1 : n
            Eg(kk) = mean(z_g.*  Y(kk,:) );
        end
        w = mean(z_h) * w - Eg;
        w = w / norm(w);
        W(:,jj) = w;
    end
   W = W * real(inv(W'*W)^0.5);
%      W = orth(W);
Err(ii) = CTPI(W' *M * A);
end

Z = W' * Y;

%% method 2, SOS ICA
for ii = 1:100
p = ii;
Y1 = Y(:, 1:end-p);
Y2 = Y( :, p+1: end);
[ UU, AA, VV] = svd(Y1 * Y2'/L);
Err_SOS(ii) = CTPI(UU' *M * A);

end
Z2 = UU' * Y;

 figure,plot(Err);       
figure,plot(Err_SOS);     

figure,
subplot(311),plot(s1);
subplot(312),plot(s2);
subplot(313),plot(s3);

figure,
subplot(311),plot(X(1,:));
subplot(312),plot(X(2,:));
subplot(313),plot(X(3,:));
figure,
subplot(311),plot(Z(1,:));
subplot(312),plot(Z(2,:));
subplot(313),plot(Z(3,:));
figure,
subplot(311),plot(Z2(1,:));
subplot(312),plot(Z2(2,:));
subplot(313),plot(Z2(3,:));