clear all; close all;
xr = 100 * rand(1, 100);
yr = 100 * rand(1, 100);
 
cntx = sum(xr)/100;
cnty = sum(yr)/100;

D = sqrt((yr - cnty).^2 + (xr - cntx).^2);
D = D / max(D) * 10;

x1 = D; % ������ľ���
x2 = rand(1,100) * 10; % ����[1,10]�����
x3 = rand(1,100) * 10; % �ƶ���[1,10]�����
 