%% Valores de media y varianza personalizados
mu_x = 3;
var_x = 1;

b = mu_x;
a = sqrt(var_x);

%% Item D
% Se hace 10000 veces para ver la distribucion de las medias en conjunto
mu_x_dist = zeros(10000,1);
for i=1:10000
    x1d = rand(10000,1);
    x2d = rand(10000,1);
    xd = a.*(sqrt(-2.*log(x1d)).*cos(2.*pi.*x2d)) + b;
    mu_x_dist(i) = mean(xd);
end
figure;
mean(mu_x_dist);
std(mu_x_dist);
histogram(mu_x_dist,bars,'Normalization','pdf');
xlabel('Medias de X');
%print('MediasX','-dpng','-r600');