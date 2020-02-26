clear all; close all; clc;

n = [1 2 4 8 16 32];
T_Symbolic = [457.002 342.709 295.918 256.738 244.253 248.957];
T_ADbyHand = [528.084 385.594 325.229 290.722 277.267 287.220];
T_MatrixFree = [280.140 269.377 290.155 280.892 275.711 279.034];

% Time vs. # of Threads Plot

figure(1);
hold on;
plot(n,T_Symbolic,"LineWidth",2,"Color","k","Marker","o");
plot(n,T_ADbyHand,"LineWidth",2,"Color","r","Marker","square");
plot(n,T_MatrixFree,"LineWidth",2,"Color","b","Marker","diamond");
grid on;
grid minor;
xlabel("No. of Threads","Interpreter","latex","FontSize",12);
ylabel("Timing [in s]","Interpreter","latex","FontSize",12);
title("Timing vs. No. of Threads","Interpreter","latex","FontSize",14);
legend("Symbolic","AD by Hand","Matrix-free","Interpreter","latex","FontSize",12);

figure(2);
S_Symbolic = T_Symbolic(1)./T_Symbolic;
S_ADbyHand = T_ADbyHand(1)./T_ADbyHand;
S_MatrixFree = T_MatrixFree(1)./T_MatrixFree;
hold on;
plot(n,S_Symbolic,"LineWidth",2,"Color","k","Marker","o");
plot(n,S_ADbyHand,"LineWidth",2,"Color","r","Marker","square");
plot(n,S_MatrixFree,"LineWidth",2,"Color","b","Marker","diamond");
ylim([0.5 2.5]);
grid on;
grid minor;
xlabel("No. of Threads","Interpreter","latex","FontSize",12);
ylabel("Speedup $(S = \frac{T_{s}}{T_{p}})$","Interpreter","latex","FontSize",12);
title("Speedup vs. No. of Threads","Interpreter","latex","FontSize",14);
legend("Symbolic","AD by Hand","Matrix-free","Interpreter","latex","FontSize",12);

figure(3);
E_Symbolic = S_Symbolic./n;
E_ADbyHand = S_ADbyHand./n;
E_MatrixFree = S_MatrixFree./n;
hold on;
plot(n,E_Symbolic,"LineWidth",2,"Color","k","Marker","o");
plot(n,E_ADbyHand,"LineWidth",2,"Color","r","Marker","square");
plot(n,E_MatrixFree,"LineWidth",2,"Color","b","Marker","diamond");
ylim([0 1]);
grid on;
grid minor;
xlabel("No. of Threads","Interpreter","latex","FontSize",12);
ylabel("Efficiency $(E = \frac{S}{n_{p}})$","Interpreter","latex","FontSize",12);
title("Efficiency vs. No. of Threads","Interpreter","latex","FontSize",14);
legend("Symbolic","AD by Hand","Matrix-free","Interpreter","latex","FontSize",12);
