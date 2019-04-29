%% [3] Proceso aleatorio de Poisson
clear Workspace;
clc;
N = 1000;
%% Item A
Qa = zeros(N,1);
for i=2:N
   x = rand;
   y = (0.2).*log(1/(1-x));
   if (y > 1)
       Qa(i) = Qa(i-1) + 1;
   else
       Qa(i) = Qa(i-1);
   end
end
% z = 1:1:N;
% plot(z,Q);

%% Item B

Qb = zeros(10,N);
for k=1:N
    for i=2:10
       x = rand;
       y = (2).*log(1/(1-x));
       if (y > 1)
           Qb(i,k) = Qb(i-1,k) + 1;
       else
           Qb(i,k) = Qb(i-1,k);
       end
    end
end

% Media en t = 4
mean_Q4 = mean(Qb(4,:));
% Varianza en t = 7
var_Q7 = var(Qb(7,:));
% Rxx(5,8)
Rxx5_8 = R(Qb,5,8);
% rxx(2,3)
rxx2_3 = C(Qb,2,3)/(sqrt(C(Qb,2,2).*C(Qb,3,3)));

