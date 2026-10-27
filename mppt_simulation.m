%% PHASE 1 - Combined Dashboard
figure('Name','ECW26062 MPPT Dashboard', ...
    'NumberTitle','off','Color','w');

subplot(3,2,1);
plot(t,G,'LineWidth',1.5);
grid on;
title('Solar Irradiance');
xlabel('Time (s)');
ylabel('G (W/m^2)');

subplot(3,2,2);
plot(t,Temp,'LineWidth',1.5);
grid on;
title('Panel Temperature');
xlabel('Time (s)');
ylabel('Temperature (°C)');

subplot(3,2,3);
plot(t,Pmppt,'b','LineWidth',1.5); hold on;
plot(t,Pfixed,'r--','LineWidth',1.5);
plot(t,Pideal,'k:','LineWidth',1.5);
grid on;
title('PV Power Comparison');
xlabel('Time (s)');
ylabel('Power (W)');
legend('With MPPT','Without MPPT','Ideal MPP', ...
    'Location','best');

subplot(3,2,4);
plot(t,Vmppt,'b','LineWidth',1.5); hold on;
plot(t,Videal,'k--','LineWidth',1.2);
grid on;
title('PV Operating Voltage');
xlabel('Time (s)');
ylabel('Voltage (V)');
legend('MPPT','Ideal MPP','Location','best');

subplot(3,2,5);
plot(t,Duty,'LineWidth',1.5);
grid on;
title('Boost Converter Duty Cycle');
xlabel('Time (s)');
ylabel('Duty Cycle');

subplot(3,2,6);
plot(t,Ecurve_MPPT,'b','LineWidth',1.5); hold on;
plot(t,Ecurve_fixed,'r--','LineWidth',1.5);
grid on;
title('Cumulative Harvested Energy');
xlabel('Time (s)');
ylabel('Energy (Wh)');
legend('With MPPT','Without MPPT','Location','best');

sgtitle(sprintf('ECW26062 Solar MPPT | Energy Gain = %.2f%%', ...
    improvement));
%% DISPLAY FINAL RESULTS IN COMMAND WINDOW

fprintf('\n');
fprintf('========================================\n');
fprintf(' ECW26062 - SOLAR PV MPPT RESULTS\n');
fprintf('========================================\n');

fprintf('Energy WITH MPPT       = %.4f Wh\n', E_MPPT);
fprintf('Energy WITHOUT MPPT    = %.4f Wh\n', E_fixed);
fprintf('IDEAL MODEL ENERGY     = %.4f Wh\n', E_ideal);
fprintf('ENERGY IMPROVEMENT     = %.2f %%\n', improvement);
fprintf('TRACKING EFFICIENCY    = %.2f %%\n', trackingEfficiency);

fprintf('========================================\n');
fprintf('Simulation completed successfully!\n');