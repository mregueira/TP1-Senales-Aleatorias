%% [2] V.A Conjuntamente Gaussianas
clear Workspace;
clc;

% Generación de uniformes [0 , 1]
X1 = rand(10000,1); 
X2 = rand(10000,1);
X3 = rand(10000,1); 
X4 = rand(10000,1);

% Generacion de gaussianas estandard
Y1 = sqrt(-2.*log(X1)).*cos(2.*pi.*X2);
Y2 = sqrt(-2.*log(X3)).*cos(2.*pi.*X4);

%% CASO A)
u1a = 2;
u2a = 3;
sigma1a = 1;
sigma2a = 1;
roa = -0.5;

Z1a = sigma1a.*Y1 + u1a;
Z2a = sigma1a.*Y2 + u2a;

Za = (1/( 2.*pi.*sigma1a.*sigma2a.*sqrt(1-roa.^2) )).*exp(-( (1/(2.*(1-roa.^2))).*(((Z1a-u1a)/sigma1a).^2 + ((Z2a-u2a)/sigma2a).^2 - (2.*roa.*(Z1a-u1a).*(Z2a-u2a)/(sigma1a.*sigma2a))) ));

figure;
scatter3(Z1a,Z2a,Za);

%% CASO B)
u1b = 2;
u2b = 3;
sigma1b = 1;
sigma2b = 0.5;
rob = -0.8;

Z1b = sigma1b.*Y1 + u1b;
Z2b = sigma1b.*Y2 + u2b;

Zb = (1/( 2.*pi.*sigma1b.*sigma2b.*sqrt(1-rob.^2) )).*exp(-( (1/(2.*(1-rob.^2))).*(((Z1b-u1b)/sigma1b).^2 + ((Z2b-u2b)/sigma2b).^2 - (2.*rob.*(Z1b-u1b).*(Z2b-u2b)/(sigma1b.*sigma2b))) ));

figure;
scatter3(Z1b,Z2b,Zb);