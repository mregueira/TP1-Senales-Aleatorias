%% Valores de media y varianza personalizados
mu_x = 3;
var_x = 1;

b = mu_x;
a = sqrt(var_x);

%% Item A
% Generacion de variables aleatorias uniformes en [0,1]
x1 = rand(1000,1);
x2 = rand(1000,1);
x3 = rand(5000,1);
x4 = rand(5000,1);
x5 = rand(50000,1);
x6 = rand(50000,1);

% Generacion de variables aleatorias gaussianas a partir de dos uniformes
y1 = a.*(sqrt(-2.*log(x1)).*cos(2.*pi.*x2)) + b;
y2 = a.*(sqrt(-2.*log(x3)).*cos(2.*pi.*x4)) + b;
y3 = a.*(sqrt(-2.*log(x5)).*cos(2.*pi.*x6)) + b;

% Curva teorica de comparacion
xi = (-4*a+b):0.001:(4*a+b);
z = normpdf(xi,mu_x,sqrt(var_x));

bars = 100; %Numero de barras

% Histogramas normalizados
figure;
histogram(y1,bars,'Normalization','pdf');
hold on;
plot(xi,z,'red','linewidth',2);
xlabel('X1');
legend('Histograma','Curva teorica X1~N(3,1)');
%print('X1_1000','-dpng','-r600');

figure;
histogram(y2,bars,'Normalization','pdf');
hold on;
plot(xi,z,'red','linewidth',2);
xlabel('X2');
legend('Histograma','Curva teorica X2~N(3,1)');
%print('X2_5000','-dpng','-r600');

figure;
histogram(y3,bars,'Normalization','pdf');
hold on;
plot(xi,z,'red','linewidth',2);
xlabel('X3');
legend('Histograma','Curva teorica X3~N(3,1)');
%print('X3_50000','-dpng','-r600');

mu_y = [mean(y1) mean(y2) mean(y3)];
var_y = [var(y1) var(y2) var(y3)];

%% Item B
% Calculo la diferencia en valor absoluto para comparar
comp_mu_y = [abs(mu_y(1) - mu_x) abs(mu_y(2) - mu_x) abs(mu_y(3) - mu_x)];
comp_var_y = [abs(var_y(1) - var_x) abs(var_y(2) - var_x) abs(var_y(3) - var_x)];