%% [3] Proceso aleatorio de Poisson
clear Workspace;
clc;
N = 10000; % Cantidad de funciones muestra
T = 1000; % Longitud de tiempo

%% Item A
Qa = zeros(N,1);
for i=2:N
   xa = rand;
   ya = 2.*log(1/(1-xa));
   if (ya > 0.75)
       Qa(i) = Qa(i-1) + 1;
   else
       Qa(i) = Qa(i-1);
   end
end
% z = 1:1:N;
% plot(z,Q);

%% Item B

Qb = zeros(T,N);
for i=1:N
   for j=1:T
       xb = rand;
       yb = log(1/(1-xb));
       if (j == 1)
           if (yb > 0.75)
               Qb(j,i) = 1;
           else
               Qb(j,i) = 0;
           end       
       else
           if (yb > 0.75)
               Qb(j,i) = Qb(j-1,i) + 1;
           else
               Qb(j,i) = Qb(j-1,i);
           end
       end

   end
end
% Media en t = 4
mean_Q4 = mean(Qb(4,:))
% Varianza en t = 7
var_Q7 = var(Qb(7,:));
% Rxx(5,8)
Rxx5_8 = R(Qb,5,8);
% rxx(2,3)
rxx2_3 = C(Qb,2,3)/(sqrt(C(Qb,2,2).*C(Qb,3,3)));

