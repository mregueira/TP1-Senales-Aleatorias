%% [1] f.d.p Gaussiana
clear Workspace;
clc;

%% Valores de mu y varianza personalizados
mu_x = 3;
var_x = 1;

b = mu_x;
a = sqrt(var_x);

%% Item A
x1 = randn(1000,1);
y1 = a.*x1 + b;
x2 = randn(5000,1);
y2 = a.*x2 + b;
x3 = randn(50000,1);
y3 = a.*x3 + b;

xi = -4+b:0.001:4+b;
z = normpdf(xi,mu_x,sqrt(var_x));

bars = 100; %Numero de barras

figure;
histogram(y1,bars,'Normalization','pdf');
hold on;
plot(xi,z,'red','linewidth',2);

figure;
histogram(y2,bars,'Normalization','pdf');
hold on;
plot(xi,z,'red','linewidth',2);

figure;
histogram(y3,bars,'Normalization','pdf');
hold on;
plot(xi,z,'red','linewidth',2);

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
    x = randn(10000,1);
    y = a.*x + b;
    mu_y_it(i) = mean(y);
    var_y_it(i) = var(y);
end
% Aca se muestran
mu_y_it;
var_y_it;

%% Item D
% Se hace 10000 veces para ver la distribucion de las medias en conjunto
mu_y_dist = zeros(10000,1);
for i=1:10000
    x = randn(10000,1);
    y = a.*x + b;
    mu_y_dist(i) = mean(y);
end
figure;
mean(mu_y_dist);
histogram(mu_y_dist,bars,'Normalization','pdf');
% Resulta una gaussiana

%% Item E
% mx representa el promedio de la suma de N variables aleatorias
% Media: mu_x - Desviacion: sigma_x/sqrt(N)

N = 3382.3.*var_x./(mu_x.^2); % Analiticamente salio eso y verifica

mx = makedist('Normal','mu',mu_x,'sigma',sqrt(var_x ./ N));

P = 2.*cdf(mx,0.96.*mu_x); % La probabilidad pedida que cumpla