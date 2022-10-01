1;
%ejercicio 3
close all;
clc, clear;

pkg load symbolic
syms x;

f=x
g=sqrt(1-x^2)

% Calculamos el punto de corte
c=solve(f-g)

int(x,f,0,c)+int(g,x,c,1)


%--------------------
x = linspace(0,pi/2,25);
y = sin(x);
[X,Y,Z] = cylinder(y);
surf(Z,X,Y)
xlabel('X'); ylabel('Z'); zlabel('Y');

%ejercicio 4
pkg load symbolic
syms x;

int(sym('pi*(sqrt(9-x^2))^2'),x,-3,3)-int('pi*(sqrt(4-x^2))^2',x,-2,2)


%ejercicio 5
pkg load symbolic
syms x;

f=1/x;
df=diff(f,x);

Area=sym('2*pi')*int( f*sqrt(1+df^2) ,x,1,inf)

Volumen=int( sym('pi')*(f)^2,x,1,inf)