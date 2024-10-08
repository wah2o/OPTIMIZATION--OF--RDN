function CSA_Case
clear all
clc
[g_best,ConvergenceCurves]=CrowSearchAlgorithm;
[Fit,PL,QL,VD,V,VSI,Pl,Ql,no]=Load_Flow(g_best); % Load Flow 
V_base=load('VOLT_BASE.m');
V_pso=load('V_PSO.m');
V_ga=load('V_GA.m');
V_fa=load('V_FA.m');
V_ca=load('V_CA.m');
V_iwo=load('V_IWO.m');
V_tlbo=load('V_TLBO.m');
V_abc=load('V_ABC.m');
P_base=load('P_BASE.m');
Q_base=load('Q_BASE.m');
P_pso=load('P_PSO.m');
Q_pso=load('Q_PSO.m');
P_ga=load('P_GA.m');
Q_ga=load('Q_GA.m');
Best_COST=load('Best_cost.m');
%% Results
disp('                            ')
disp('%%%%%%%%%%%%%%%%%%% CSA Results with capacitor sizing & placement %%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('------------------------------------------------------')
disp(['Capacitor Size (Mvar):                 ' num2str(round(g_best(1)/1000,4))]);
disp(['Capacitor Location (Bus):              ' num2str(round(g_best(2),0))]);
disp(['Fitness Value (PU):                    ' num2str(round(Fit,4))]);
disp('------------------------------------------------------')
disp('                            ')
disp('%%%%%%%%%%%%%%%%%%% CSA System Results %%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('------------------------------------------------------')
disp(['Power-Loss (KW):                       ' num2str(round(PL,2))]);
disp(['Reactive Power-Loss (Kvar):              ' num2str(round(QL,2))]);
disp(['Voltage Deviation:                     ' num2str(round(VD,2))]);
disp(['Voltage Stabiliy Index:                ' num2str(round(VSI,2))]);
disp('------------------------------------------------------')
% figure (1);
% plot(V,'c',LineWidth=1.5)
% set(gca,'XTick',1:1:no);
% %plot(V,LineWidth=1.5)
% hold on
% plot(V_base,'b',LineWidth=1.5)
% title('Voltage Profile')
% xlabel('Bus');
% ylabel('Voltage');
% legend('CSA Case','Base Case')
% grid on;
% hold off
figure (3);
plot(ConvergenceCurves,LineWidth=1.5)
hold on
plot(Best_COST,LineWidth=1.5)
title('Convergence curves for PSO, CSA, GA, FA,and CA')
xlabel('Iteration');
ylabel('Best Value');
legend('CSA Case','PSO Case','GA Case','FA','CA')
grid on;
% figure (6);
% %bar(Pl*100000,LineWidth=1.5)
% bar(1:length(Pl*100000),Pl*100000,'c');
% set(gca,'XTick',1:1:no)
% title('Active Power Loss CSA')
% xlabel('Bus');
% ylabel('Power (Kw)');
% grid on;
% figure (7);
% %bar(Ql*100000,LineWidth=1.5)
% bar(1:length(Ql*100000),Ql*100000,'c');
% set(gca,'XTick',1:1:no)
% title('Reactive Power Loss CSA')
% xlabel('Bus');
% ylabel('Power (Kvar)');
% grid on;
figure (1);
plot(V_base,LineWidth=1.5)
hold on
plot(V,LineWidth=1.5)
hold on
plot(V_pso,LineWidth=1.5)
hold on
plot(V_ga,LineWidth=1.5)
hold on
plot(V_fa,LineWidth=1.5)
hold on
plot(V_ca,LineWidth=1.5)
hold on
plot(V_iwo,LineWidth=1.5)
hold on
plot(V_tlbo,LineWidth=1.5)
hold on
plot(V_abc,LineWidth=1.5)
title('Voltage Profile')
xlabel('Bus');
set(gca, 'XTick', 1:length(V)); % Set x-axis ticks to match the number of categories
xlim([0.5, length(V) + 0.5]); % Adjust x-axis limits to remove space before the first bar
ylabel('Voltage');
legend('Base Case','CSA Case','PSO Case', 'GA Case', 'FA','CA','IWO','TLBO','ABC')
grid on;
hold off
% figure (4);
% plot(ConvergenceCurves,LineWidth=1.5)
% title('Convergence curves')
% xlabel('Iteration');
% ylabel('Best Value');
% grid on;
%figure (5);
% % bar(P_base,LineWidth=1.5)
% % hold on
% % bar(P_pso,LineWidth=1.5)
% % hold on
% % bar(P_ga,LineWidth=1.5)
% % hold on
% % bar(Pl*100000,LineWidth=1.5)
% Sample data (replace these with your actual data)
% % % % % % % % % % % -----------------------------------------
% Sample data for the first bar graph
% data1 = [16.804	12.3874	12.3858	11.91474175	16.8040	16.8040	16.8040;
% 71.3928	50.7079	50.7007	49.00280528	71.3928	71.3928	71.3928;
% 27.6691	17.327	17.3243	17.43428898	27.6691	27.6691	27.6691;
% 26.0401	16.09	16.0876	16.43890837	26.0401	26.0401	26.0401;
% 53.2985	32.6078	32.6031	33.54293756	53.2985	53.2985	53.2985;
% 2.6786	2.5681	2.5681	2.535130502	2.6786	2.6786	2.6786;
% 6.7907	6.5069	6.5068	6.422112064	6.7907	6.7907	6.7907;
% 5.8916	5.6412	5.6411	5.566322084	5.8916	5.8916	5.8916;
% 5.0229	4.8083	4.8081	4.744082252	5.0229	5.0229	5.0229;
% 0.7815	0.748	0.748	0.737949357	0.7815	0.7815	0.7815;
% 1.2448	1.1912	1.1912	1.175188492	1.2448	1.2448	1.2448;
% 3.7714	3.6082	3.6081	3.5593	3.7714	3.7714	3.7714;
% 1.0321	0.9873	0.9873	0.973928372	1.0321	1.0321	1.0321;
% 0.5062	0.4841	0.4841	0.477490213	0.5062	0.5062	0.5062;
% 0.3993	0.3818	0.3818	0.376549955	0.3993	0.3993	0.3993;
% 0.3571	0.3414	0.3414	0.336738776	0.3571	0.3571	0.3571;
% 0.0754	0.0721	0.0721	0.071116242	0.0754	0.0754	0.0754;
% 0.2142	0.2139	0.2139	0.213816323	0.2142	0.2142	0.2142;
% 1.1081	1.1067	1.1067	1.106256296	1.1081	1.1081	1.1081;
% 0.1342	0.134	0.134	0.133972872	0.1342	0.1342	0.1342;
% 0.0581	0.0581	0.0581	0.058030649	0.0581	0.0581	0.0581;
% 4.2998	4.2635	4.2635	4.253110667	4.2998	4.2998	4.2998;
% 6.9558	6.897	6.897	6.880103443	6.9558	6.9558	6.9558;
% 1.7431	1.7283	1.7283	1.724028309	1.7431	1.7431	1.7431;
% 3.6495	1.6375	1.638	2.635010973	3.6495	3.6495	3.6495;
% 4.6772	2.0583	2.059	4.416576053	4.6772	4.6772	4.6772;
% 15.8971	6.8764	6.8794	15.00721787	15.8971	15.8971	15.8971;
% 11.0274	4.6491	4.6516	10.40829915	11.0274	11.0274	11.0274;
% 5.4872	2.4261	2.4281	5.178324315	5.4872	5.4872	5.4872;
% 2.2542	10.4323	10.4427	2.126179182	2.2542	2.2542	2.2542;
% 0.3017	3.4484	3.452	0.284497541	0.3017	0.3017	0.3017;
% 0.0186	4.2752	4.2795	0.017574953	0.0186	0.0186	0.0186;
% ];
% bar_labels1 = {'1', '2', '3','4', '5', '6','7', '8', '9','10', '11', '12','13', '14', '15','16', '17', '18','19', '20', '21','22', '23', '24','25', '26', '27','28', '29', '30','31', '32'};
% grid on
% Sample data for the second bar graph
data2 = [16.804	12.3874	12.3874	11.91474175	16.8040	16.8040	10.5013	12.3874	12.3874;
71.3928	50.7079	50.7079	49.00280528	71.3928	71.3928	42.1634	50.7079	50.7080;
27.6691	17.327	17.327	17.43428898	27.6691	27.6691	15.9864	17.3270	17.3270;
26.0401	16.09	16.09	16.43890837	26.0401	26.0401	15.3539	16.0900	16.0900;
53.2985	32.6078	32.6078	33.54293756	53.2985	53.2985	31.5945	32.6070	32.6078;
2.6786	2.5681	2.5681	2.535130502	2.6786	2.6786	2.4800	2.5681	2.5681;
6.7907	6.5069	6.5069	6.422112064	6.7907	6.7907	6.2808	6.7907	6.5069;
5.8916	5.6412	5.6412	5.566322084	5.8916	5.8916	5.4420	5.6412	5.6412;
5.0229	4.8083	4.8083	4.744082252	5.0229	5.0229	4.6377	4.8083	4.8083;
0.7815	0.748	0.748	0.737949357	0.7815	0.7815	0.7213	0.7480	0.7480;
1.2448	1.1912	1.1912	1.175188492	1.2448	1.2448	1.1487	1.1912	1.1912;
3.7714	3.6082	3.6082	3.5593	3.7714	3.7714	3.4787	3.6082	3.7714;
1.0321	0.9873	0.9873	0.973928372	1.0321	1.0321	0.9518	0.9873	0.9873;
0.5062	0.4841	0.4841	0.477490213	0.5062	0.5062	0.4666	0.4841	0.4841;
0.3993	0.3818	0.3818	0.376549955	0.3993	0.3993	0.3679	0.0000	0.3818;
0.3571	0.3414	0.3414	0.336738776	0.3571	0.3571	0.3290	0.0000	0.3414;
0.0754	0.0721	0.0721	0.071116242	0.0754	0.0754	0.0754	0.0000	0.0754;
0.2142	0.2139	0.2139	0.213816323	0.2142	0.2142	0.2137	0.0000	0.2139;
1.1081	1.1067	1.1067	1.106256296	1.1081	1.1081	1.1054	1.1067	1.1068;
0.1342	0.134	0.134	0.133972872	0.1342	0.1342	0.1342	0.0000	0.1342;
0.0581	0.0581	0.0581	0.058030649	0.0581	0.0581	0.0581	0.0000	0.0581;
4.2998	4.2635	4.2636	4.253110667	4.2998	4.2998	4.2325	4.2636	4.2636;
6.9558	6.897	6.897	6.880103443	6.9558	6.9558	6.8467	6.8970	6.8970;
1.7431	1.7283	1.7283	1.724028309	1.7431	1.7431	1.7156	1.7283	1.7283;
3.6495	1.6375	1.6376	2.635010973	3.6495	3.6495	3.8624	1.6376	1.6375;
4.6772	2.0583	2.0583	4.416576053	4.6772	4.6772	5.3312	2.0583	2.0583;
15.8971	6.8764	6.8764	15.00721787	15.8971	15.8971	19.6540	6.8734	6.8734;
11.0274	4.6491	4.6491	10.40829915	11.0274	11.0274	14.7115	4.6491	4.6500;
5.4872	2.4261	2.4261	5.178324315	5.4872	5.4872	9.4564	2.4261	2.4261;
2.2542	10.4323	10.4323	2.126179182	2.2542	2.2542	33.3637	10.4323	10.4323;
0.3017	3.4484	3.4484	0.284497541	0.3017	0.3017	11.1135	3.4484	3.4484;
0.0186	4.2752	4.2752	0.017574953	0.0186	0.0186	13.2131	4.2752	4.2752
];
bar_labels2 = {'1', '2', '3','4', '5', '6','7', '8', '9','10', '11', '12','13', '14', '15','16', '17', '18','19', '20', '21','22', '23', '24','25', '26', '27','28', '29', '30','31', '32'};


figure;

% % First bar graph
% subplot(1, 32, 1); % 1 row, 2 columns, 1st subplot
% bar(data1);
% set(gca, 'XTickLabel', bar_labels1);
% xlabel('Groups');
% ylabel('Values');
% title('Bar Graph 1');
% legend('Base', 'PSO', 'GA');

% Second bar graph
plot(1, 2); % 1 row, 2 columns, 2nd subplot
bar(data2);
set(gca, 'XTickLabel', bar_labels2);
xlabel('Groups');
ylabel('Values');
title('Bar Graph 2');
legend('Series 1', 'Series 2', 'Series 3');

% % % % % 
title('ACTIVE Power Loss')
xlabel('Line');
set(gca, 'XTick', 1:length(Pl)); % Set x-axis ticks to match the number of categories
xlim([0.5, length(Pl) + 0.5]); % Adjust x-axis limits to remove space before the first bar
ylabel('Active Power (Kw)');
grid on;
legend('Base Case','PSO Case','GA Case','CSA Case','FA','CA','IWO','TLBO','ABC')
figure (4);
% bar(Q_base,LineWidth=1.5)
% 
% hold on
% bar(Q_pso,LineWidth=1.5)
% hold on
% bar(Q_ga,LineWidth=1.5)
% hold on
% bar(Ql*100000,LineWidth=1.5)
% Sample data for the first bar graph
data4 = [8.5660	6.3146	6.3146	5.9117	8.5660	8.5660	5.3532	6.3146	6.3146;
36.3625	25.8271	25.8371	24.0021	36.3625	36.3625	21.9845	25.8271	25.8271;
14.0916	8.8245	8.8245	8.0261	14.0916	14.0916	8.1417	8.8245	8.8245;
13.2626	8.1949	8.1949	7.4426	13.2626	13.2626	7.8200	8.1949	8.1949;
46.0098	28.1486	28.1486	25.5348	46.0098	46.0098	27.2739	28.1486	28.1487;
8.8544	8.4891	8.4891	9.9738	8.8544	8.8544	8.1978	8.4891	8.4891;
2.2442	2.1504	2.1504	3.4345	2.2442	2.2442	2.0757	2.1504	2.1504;
4.2328	4.0529	4.0529	10.3305	4.2328	4.2328	3.9098	4.0529	4.0529;
3.5603	3.4082	3.4082	10.1541	3.5603	3.5603	3.5603	3.4082	3.4082;
0.2584	0.2473	0.2473	0.8799	0.2584	0.2584	0.2385	0.2473	0.2473;
0.4116	0.3939	0.3939	1.7021	0.4116	0.4116	0.3798	0.3939	0.3939;
2.9673	2.8388	2.8389	16.1701	2.9673	2.9673	2.7370	2.8389	2.8389;
1.3586	1.2996	1.2996	10.1989	1.3586	1.3586	1.2528	1.2996	1.2996;
0.4505	0.4309	0.4309	0.3717	0.4505	0.4505	0.4153	0.4309	0.4309;
0.2916	0.2788	0.2788	0.2404	0.2916	0.2916	0.2687	0.2788	0.2916;
0.4768	0.4559	0.4559	0.3929	0.4768	0.4768	0.4393	0.4559	0.4559;
0.0591	0.0565	0.0565	0.0487	0.0591	0.0591	0.0591	0.0500	0.0591;
0.2044	0.2041	0.2041	0.2041	0.2044	0.2044	0.2039	0.2041	0.2041;
0.9985	0.9972	0.9972	0.9969	0.9985	0.9985	0.9961	0.9972	0.9972;
0.1568	0.1566	0.1566	0.1565	0.1568	0.1568	0.1564	0.1566	0.1566;
0.0769	0.0768	0.0768	0.0767	0.0769	0.0769	0.0769	0.0700	0.0769;
2.9380	2.9132	2.9132	2.9080	2.9380	2.9380	2.8921	2.9132	2.9132;
5.4926	5.4462	5.4462	5.4364	5.4926	5.4926	5.4065	5.4462	5.4462;
1.3640	1.3524	1.3524	1.3499	1.3640	1.3640	1.3424	1.3524	1.3524;
1.8589	0.8341	0.8341	1.7706	1.8589	1.8589	1.9673	0.8341	0.8341;
2.3814	1.0480	1.0480	2.2677	2.3814	2.3814	2.7144	1.0480	1.0480;
14.0162	6.0628	6.0628	13.3443	14.0162	14.0162	17.3285	6.0628	6.0628;
9.6068	4.0502	4.0502	9.1450	9.6068	9.6068	12.8163	4.0502	4.0502;
2.7949	1.2358	1.2358	2.6603	2.7949	2.7949	4.8167	1.2358	1.2358;
2.2279	10.3102	10.3102	2.1195	2.2279	2.2279	32.9733	10.3102	10.3102;
0.3516	4.0192	4.0192	0.3345	0.3516	0.3516	12.9532	4.0192	4.0192;
0.0290	6.6473	6.6473	0.0276	0.0290	0.0290	20.5442	6.6473	6.6473
];
bar_labels4 = {'1', '2', '3','4', '5', '6','7', '8', '9','10', '11', '12','13', '14', '15','16', '17', '18','19', '20', '21','22', '23', '24','25', '26', '27','28', '29', '30','31', '32'};

% Second bar graph
plot(1, 2); % 1 row, 2 columns, 2nd subplot
bar(data4);
set(gca, 'XTickLabel', bar_labels4);
xlabel('Groups');
ylabel('Values');
title('Bar Graph 2');
legend('Series 4', 'Series 5', 'Series 6');

title('REACTIVE Power Loss')
xlabel('Line');
set(gca, 'XTick', 1:length(Ql)); % Set x-axis ticks to match the number of categories
xlim([0.5, length(Ql) + 0.5]); % Adjust x-axis limits to remove space before the first bar
ylabel('Reactive Power (Kvar)');
grid on;
legend('Base Case','PSO Case','GA Case','CSA Case','FA', 'CA','IWO','TLBO', 'ABC')
end