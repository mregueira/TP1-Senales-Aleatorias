%% Item E
% mx representa el promedio de la suma de N variables aleatorias
% Media: mu_x - Desviacion: sigma_x/sqrt(N)

N = 3382.3.*var_x./(mu_x.^2); % Analiticamente resulta eso y verifica

mx = makedist('Normal','mu',mu_x,'sigma',sqrt(var_x ./ N));

P = 2.*cdf(mx,0.96.*mu_x) % La probabilidad pedida 