1;
close all;
clc, clear;
pkg load symbolic
syms x;

f=x*e^(1/x);
%dominio
dom=solve(1/x)
%corte co eixe x
cx=solve(f)
%corte co eixe y
subs(f,0)
figure()
%asintota vertical
asintota_vertical=limit(f,x,0)
asintota_vertical1=limit(f,x,0,'right')
asintota_vertical2=limit(f,x,0,'left')
if(asintota_vertical==inf||asintota_vertical1==inf&&asintota_vertical2==inf)
fprintf("Hay asintota_vertical\n");
endif
%asintota horizontal
asintota_horizontal1=limit(f,x,'inf')
asintota_horizontal2=limit(f,x,'-inf')
if((asintota_horizontal1==inf||asintota_horizontal1==-inf) && (asintota_horizontal2==-inf ||asintota_horizontal2==inf))
fprintf("Hay asintota_horizontal\n");
endif
%asintoa oblicua
m = limit(f/x,x,inf);
n = limit(f-m*x,x,inf);
asintota_oblicua = m*x + n
%extremo relativo
df=diff(f,x,1);
df2=diff(f,x,2);
extremo_relativo=solve(df==0,x)
if(subs(df,extremo_relativo)>0)
fprintf("Hai maximo relativo\n");
endif
if(subs(df,extremo_relativo)<0)
fprintf("Hai minmo relativo\n");
endif
%punto de inflexion
posible_punto_inflexion = solve(df2==0,x)
%grafica
ezplot(f)
hold on;
plot([-10,10],[0,0])
hold on;
plot([0,0], [-10,30])
hold on;
ezplot(asintota_oblicua)
