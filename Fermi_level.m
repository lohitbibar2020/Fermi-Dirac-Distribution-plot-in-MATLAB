% Constants
kb = 8.617e-5; % Boltzmann constant (eV/K)
Ef = 0.56; % Fermi level in eV

% Energy range
E = -0.5:0.0005:1.5; % Energy levels in eV

% Calculate f(E) at T=0K as fT0
fT0 = zeros(size(E)); % Initialize fT0 array

for k = 1:length(E)
    if E(k) < Ef
        fT0(k) = 1;
    elseif E(k) == Ef
        fT0(k) = 0.5;
    end
end

% Calculate f(E) at different temperatures
T1 = 100; T2 = 200; T3 = 300;

fT1 = 1 ./ (1 + exp((E - Ef) / (kb * T1)));
fT2 = 1 ./ (1 + exp((E - Ef) / (kb * T2)));
fT3 = 1 ./ (1 + exp((E - Ef) / (kb * T3)));

% Plotting the results
plot(E, fT0, 'k') % Plot for T=0K
grid on
hold on
plot(E, fT1, 'b') % Plot for T=90K
plot(E, fT2, 'r') % Plot for T=190K
plot(E, fT3, 'm') % Plot for T=290K

axis([-0.2 1.3 -0.1 1.1])
xlabel('Energy (eV)')
ylabel('f(E)')
title('Fermi-Dirac distribution function ')
legend('T=0K' ,' T1 = 90 K',' T2 =190K' , 'T3 = 290K');
plot(Ef,0.5,'K.');