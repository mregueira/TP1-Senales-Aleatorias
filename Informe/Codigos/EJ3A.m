%% [3] Proceso aleatorio de Poisson
N = 10000; % Cantidad de funciones muestra
T = 1000; % Longitud de tiempo

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
figure;
plot(z,Qa);
xlabel('t');
ylabel('Q(t)');
print('Q','-dpng','-r600');