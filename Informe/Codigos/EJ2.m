%% [2] V.A Conjuntamente Gaussianas
clear Workspace;
clc;

% Generacion de uniformes [0 , 1]
N = 5000;
X1 = rand(N,1); 
X2 = rand(N,1);
X3 = rand(N,1); 
X4 = rand(N,1);

% Generacion de gaussianas estandard
Y1 = sqrt(-2.*log(X1)).*cos(2.*pi.*X2);
Y2 = sqrt(-2.*log(X3)).*cos(2.*pi.*X4);

%% CASO A)
u1a = 2;
u2a = 3;
sigma1a = 1;
sigma2a = 1;
roa = -0.5;

% Gaussianas con media y varianza personalizadas
Z1a = sigma1a.*Y1 + u1a;
Z2a = sigma1a.*Y2 + u2a;

% Gaussiana bivariable
Z12a = (1/( 2.*pi.*sigma1a.*sigma2a.*sqrt(1-roa.^2) )).*exp(-( (1/(2.*(1-roa.^2))).*(((Z1a-u1a)/sigma1a).^2 + ((Z2a-u2a)/sigma2a).^2 - (2.*roa.*(Z1a-u1a).*(Z2a-u2a)/(sigma1a.*sigma2a))) ));

figure;
scatter3(Z1a,Z2a,Z12a,2,'filled');
title('Caso A')
xlabel('Z1');
ylabel('Z2');
zlabel('f(Z1,Z2)');
set(gca,'XLim',[-4 8],'YLim',[-4 8])
view(-45,40)
print('Za','-dpng','-r600');

%% CASO B)
u1b = 2;
u2b = 3;
sigma1b = 1;
sigma2b = 0.5;
rob = -0.8;

% Gaussianas con media y varianza personalizadas
Z1b = sigma1b.*Y1 + u1b;
Z2b = sigma1b.*Y2 + u2b;

% Gaussiana bivariable
Z12b = (1/( 2.*pi.*sigma1b.*sigma2b.*sqrt(1-rob.^2) )).*exp(-( (1/(2.*(1-rob.^2))).*(((Z1b-u1b)/sigma1b).^2 + ((Z2b-u2b)/sigma2b).^2 - (2.*rob.*(Z1b-u1b).*(Z2b-u2b)/(sigma1b.*sigma2b))) ));

figure;
scatter3(Z1b,Z2b,Z12b,2,'filled');
title('Caso B')
xlabel('Z1');
ylabel('Z2');
zlabel('f(Z1,Z2)');
set(gca,'XLim',[-4 8],'YLim',[-4 8])
view(-45,40)
print('Zb','-dpng','-r600');