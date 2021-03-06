%% [3] Proceso aleatorio de Poisson
clear Workspace;
clc;
N = 1000; % Cantidad de funciones muestra
T = 10000; % Longitud de tiempo

%% Item A
Qa = zeros(N,1);
for i=2:N
   xa = rand;
   ya = log(1/(1-xa));
   if (ya > 7.5)
       Qa(i) = Qa(i-1) + 1;
   else
       Qa(i) = Qa(i-1);
   end
end
z = 1:1:N;
% figure;
% plot(z,Qa);
% xlabel('t');
% ylabel('Q(t)');
% print('Q','-dpng','-r600');

%% Item B

Qb = zeros(T,N);
for i=1:N
   for j=1:T
       xb = rand;
       yb = (log(1/(1-xb)));
       if (j == 1)
           if (yb > 6.9)
               Qb(j,i) = 1;
           else
               Qb(j,i) = 0;
           end       
       else
           if (yb > 6.9)
               Qb(j,i) = Qb(j-1,i) + 1;
           else
               Qb(j,i) = Qb(j-1,i);
           end
       end

   end
end
% Media en t = 4N
mean_Q4 = mean(Qb(4.*N,:));
% Varianza en t = 7
var_Q7 = var(Qb(7.*N,:));
% Rxx(5,8)
Rxx5_8 = R(Qb,5.*N,8.*N);
% rxx(2,3)
rxx2_3 = C(Qb,2.*N,3.*N)/(sqrt(C(Qb,2.*N,2.*N).*C(Qb,3.*N,3.*N)));

