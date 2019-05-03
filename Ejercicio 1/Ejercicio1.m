%% [1] f.d.p Gaussiana
clear Workspace;
clc;

%% Valores de mu y varianza personalizados
mu_x = 3;
var_x = 1;

b = mu_x;
a = sqrt(var_x);

%% Item A
% Generacion de uniformes en [0,1]
x1 = rand(1000,1);
x2 = rand(1000,1);
x3 = rand(5000,1);
x4 = rand(5000,1);
x5 = rand(50000,1);
x6 = rand(50000,1);

% Generacion de gaussiana a partir de dos uniformes
y1 = a.*(sqrt(-2.*log(x1)).*cos(2.*pi.*x2)) + b;
y2 = a.*(sqrt(-2.*log(x3)).*cos(2.*pi.*x4)) + b;
y3 = a.*(sqrt(-2.*log(x5)).*cos(2.*pi.*x6)) + b;

% Curva teórica de comparación
xi = (-4*a+b):0.001:(4*a+b);
z = normpdf(xi,mu_x,sqrt(var_x));

bars = 100; %Numero de barras

% Histogramas normalizados
figure;
histogram(y1,bars,'Normalization','pdf');
hold on;
plot(xi,z,'red','linewidth',2);
xlabel('X1');
legend('Histograma','Curva teórica X1~N(3,1)');
%print('X1_1000','-dpng','-r600');

figure;
histogram(y2,bars,'Normalization','pdf');
hold on;
plot(xi,z,'red','linewidth',2);
xlabel('X2');
legend('Histograma','Curva teórica X2~N(3,1)');
%print('X2_5000','-dpng','-r600');

figure;
histogram(y3,bars,'Normalization','pdf');
hold on;
plot(xi,z,'red','linewidth',2);
xlabel('X3');
legend('Histograma','Curva teórica X3~N(3,1)');
%print('X3_50000','-dpng','-r600');

mu_y = [mean(y1) mean(y2) mean(y3)];
var_y = [var(y1) var(y2) var(y3)];

%% Item B
% Calculo la diferencia en valor absoluto para comparar
comp_mu_y = [abs(mu_y(1) - mu_x) abs(mu_y(2) - mu_x) abs(mu_y(3) - mu_x)];
comp_var_y = [abs(var_y(1) - var_x) abs(var_y(2) - var_x) abs(var_y(3) - var_x)];

%% Item C
% Se hace unas 5 veces, viendo medias similares (nunca iguales)
mu_y_it = zeros(5,1);
var_y_it = zeros(5,1);
for i=1:5
    x1c = rand(10000,1);
    x2c = rand(10000,1);
    yc = a.*(sqrt(-2.*log(x1c)).*cos(2.*pi.*x2c)) + b;
    mu_y_it(i) = mean(yc);
    var_y_it(i) = var(yc);
end
% Aca se muestran
mu_y_it;
var_y_it;

%% Item D
% Se hace 10000 veces para ver la distribucion de las medias en conjunto
mu_x_dist = zeros(10000,1);
for i=1:10000
    x1d = rand(10000,1);
    x2d = rand(10000,1);
    xd = a.*(sqrt(-2.*log(x1d)).*cos(2.*pi.*x2d)) + b;
    mu_x_dist(i) = mean(xd)
    std(xd)
end
figure;
mean(mu_x_dist);
std(mu_x_dist);
histogram(mu_x_dist,bars,'Normalization','pdf');
xlabel('Medias de X');
%print('MediasX','-dpng','-r600');

%% Item E
% mx representa el promedio de la suma de N variables aleatorias
% Media: mu_x - Desviacion: sigma_x/sqrt(N)

N = 3382.3.*var_x./(mu_x.^2); % Analiticamente resulta eso y verifica

mx = makedist('Normal','mu',mu_x,'sigma',sqrt(var_x ./ N));

P = 2.*cdf(mx,0.96.*mu_x) % La probabilidad pedida que cumpla