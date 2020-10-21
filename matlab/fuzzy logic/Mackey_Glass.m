function Mackey_Glass 
% ���-����˹(Mackey-Glass)�����ӳ�΢�ַ��� 
N = 10000; 
t = zeros(N, 1); x = zeros(N, 1);  
x(1) = 1.2; t(1) = 0; 
a = 0.2; b = 0.1; h = 0.1;
tau = 17; 
for k = 1 : N-1; 
   t(k+1) = t(k) + h; 
   if t(k) < tau; 
       k1 = -b * x(k); 
       k2 = -b * (x(k) + h * k1 /2); 
       k3 = -b * (x(k) + k2 * h /2); 
       k4 = -b * (x(k) + k3 * h);
       x(k+1) = x(k) + (k1 + 2 * k2 + 2 * k3 + k4) * h /6; 
   else 
       n = floor((t(k) - tau - t(1)) /h + 1); 
       k1 = Df(x(n)) - b * x(k); 
       k2 = Df(x(n)) - b * (x(k) + h * k1 /2); 
       k3 = Df(x(n)) - b * (x(k) + 2 * k2 * h /2); 
       k4 = Df(x(n)) - b * (x(k) + k3 * h); 
       x(k+1) = x(k) + (k1 + 2 * k2 + 2 * k3 + k4) * h /6; 
   end 
end 
subplot(121); plot(t, x); 
Dt = 6;  % ��ͼʱ��� 
subplot(122); plot(x((Dt*10 + 1) : end), x(1 : end - 10*Dt));
dlmwrite('x.txt', x, '-append', 'delimiter', '\t');

