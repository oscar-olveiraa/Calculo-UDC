1;
close all;
clc, clear;
pkg load symbolic 
syms x;


%calcular volumen:
%si che da a funcion tes que facer pi*integral da funcion ao cuadrado


%Esfera
a=4*pi*x^2;
v1=int(a,x,0,3)
%segunda forma
disp('Introduce o radio');
x=input('');
v2=(4/3)*pi*x^3


fprintf('Volumen cilindro\n');
%Cilindro
%a area do cilindro xoga con duas variables asi que da directamente a formula do volumne
disp('Introduce o radio');
r=input('');
disp('Introduce a altura');
h=input('');
v3=pi*r^2*h

fprintf('\n');
% Integral impropia de f

a = -inf;
b = inf;
f=x^2/(sqrt(x+2));
integral_impropia = int(f,x,a,b)