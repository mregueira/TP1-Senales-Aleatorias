N = 1000; % Cantidad de funciones muestra
T = 10000; % Longitud de tiempo

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
% Varianza en t = 7N
var_Q7 = var(Qb(7.*N,:));
% Rxx(5,8)
Rxx5_8 = R(Qb,5.*N,8.*N);
% rxx(2,3)
rxx2_3 = C(Qb,2.*N,3.*N)/(sqrt(C(Qb,2.*N,2.*N).*C(Qb,3.*N,3.*N)));