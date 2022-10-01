1;
close all;
clc, clear;
pkg load symbolic
syms x;

f=x^3/(x-1)^2;
%calculo dominio para asintota vertical
dom=solve((x-1)^2)

%apartado A(a grafica esta mais abaixo)
df1=diff(f,x,1)%calcula a primeira derivada
df2=diff(f,x,2)%calcula a segunda derivada

%apartado B
%puntos criticos
disp('Calculo de puntos criticos');
pr=solve(df2)
double(subs(df2,sym('0')))
%punto de inflexion
posible_punto_inflexion = solve(df2==0,x)

%apartado C
% Asintotas horizontales
asintota_horizontal = limit(f,x,inf) % Comprobamos os limites laterais. Todos tenhen que dar o mesmo valor finito
asintota_horizontal1 = limit(f,x,inf, 'right')
asintota_horizontal2 = limit(f,x,inf, 'left')
if((asintota_horizontal1==inf||asintota_horizontal1==-inf) && (asintota_horizontal2==-inf ||asintota_horizontal2==inf))
fprintf("Non hai asintota_horizontal\n");
endif
% Asintotas verticales
asintota_vertical = limit(f,x,dom) % Comprobamos os limites laterais. Todos tenhen que dar infinito
asintota_vertical1 = limit(f,x,dom, 'left')
asintota_vertical2 = limit(f,x,dom, 'right')
if(asintota_vertical==inf||(asintota_vertical1==inf&&asintota_vertical2==inf))
fprintf("Hai asintota_vertical\n");
endif
% Asintotas oblicuas.
m = limit(f/x,x,inf);
n = limit(f-m*x,x,inf);
asintota_oblicua = m*x + n

%apartado D
p6=taylor(f,x,0, 'order', 7)

%grafica apartado A-D
ezplot(f)
hold on;
plot([-8,8],[0,0], 'k')%eixe x
hold on;
plot([0,0], [-8,50], 'b')%eixe y
hold on;
ezplot(p6)%grafica do polinomio de taylor de orden 6
axis([-7,6,-5,50])

