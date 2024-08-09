function GA_Case
clear all
clc
[g_best,ConvergenceCurves]=ga;
[Fit,PL,QL,VD,V,VSI,Pl,Ql]=Load_Flow(g_best); % Load Flow 
V_base=load('VOLT_BASE.m');
%% Results
disp('                            ')
disp('%%%%%%%%%%%%%%%%%%% Genetic Algorithm Results with Capacitor placement %%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('------------------------------------------------------')
disp(['Capacitor Size (Mvar):                 ' num2str(round(g_best(1)/1000,4))]);
disp(['Capacitor Location (Bus):              ' num2str(round(g_best(2),0))]);
disp(['Fitness Value (PU):                    ' num2str(round(Fit,4))]);
disp('------------------------------------------------------')
disp('                            ')
disp('%%%%%%%%%%%%%%%%%%% Genetic Algorithm System Results %%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('------------------------------------------------------')
disp(['Power-Loss (KW):                       ' num2str(round(PL,2))]);
disp(['Reactive Power-Loss (KW):              ' num2str(round(QL,2))]);
disp(['Voltage Deviation:                     ' num2str(round(VD,2))]);
disp(['Voltage Stabiliy Index:                ' num2str(round(VSI,2))]);
disp('------------------------------------------------------')
figure (1);
plot(V,LineWidth=1.5)
hold on
plot(V_base,LineWidth=1.5)
title('Voltage Profile')
xlabel('Bus');
ylabel('Voltage');
legend('GA Case','Base Case')
grid on;
hold off
figure (2);
plot(ConvergenceCurves,LineWidth=1.5)
title('Convergence curves')
xlabel('Iteration');
ylabel('Best Value');
grid on;
figure (3);
bar(Pl*100000,LineWidth=1.5)
title('Active Power Loss')
xlabel('Bus');
ylabel('Power (Kw)');
grid on;
figure (4);
bar(Ql*100000,LineWidth=1.5)
title('Reactive Power Loss')
xlabel('Bus');
ylabel('Power (Kvar)');
grid on;
set(gca, 'XTick', 1:length(Pl)); % Set x-axis ticks to match the number of categories
xlim([0.5, length(Pl) + 0.5]); % Adjust x-axis limits to remove space before the first bar
grid on;
legend('Base Case','CSA Case')
%----------------------------------------------------------------------------------------------%
% Br=[1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19;20;21;22;23;24;25;26;27;28;29;30;31;32;33];
% U =table(Br,vbp);        
% U(:,1:2);
% excel_file = 'Voltage_angle.xlsx';
% writetable(U,excel_file,'Sheet',1,'Range','H1');
%------------------------------------------------------------------------------------------------%
Sr=[1;2;3;4;5;6;7;8;9;10;11;12;13;14;15;16;17;18;19;20;21;22;23;24;25;26;27;28;29;30;31;32];
K =table(Sr,Plosskw,Qlosskw);        
K(:,1:3);
excel_file = 'PQlosses.xlsx';
writetable(K,excel_file,'Sheet',1,'Range','H1');
end