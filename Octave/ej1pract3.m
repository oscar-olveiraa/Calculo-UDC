1;
clc;
clear;
close all;
pkg load symbolic
syms x;
f=(x^2-9)/(x^2-4);
%Dominio, quitar esta raices do denominador
solve(x^2-4)

%cortes eixe x
cx=solve(f)
%cortes eixe y
subs(f,0)
figure()
ezplot(f, [-10,10])
hold on;
plot([double(cx(1), cx(2))],double([0,0]), 'k*')%co double pasa de simbolico a numerico creo
xx=linspace(-10, 10);
hold on;
plot(xx, 0.*xx, 'k')
hold on;
plot([0,0], [-3,6], 'k');

%asisntotas verticales
limit(f,x,2,'right')
limit(f,x,-2, 'left')
hold on;
plot([0,0], [-3,6], 'r');

%oblicuas
limit(f/x,x,'inf')%asintotas oblicuas con pendiente 0 son horizontales
limit(f/x,x, '-inf')
hold on;
ezplot(sym('1'), [-10,10])%as comillas e para en entenda como si fora unha funcion simbolica
axis([-10,10,-3,6])