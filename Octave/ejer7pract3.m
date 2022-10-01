%Ejercicio 7
1;

close all;
pkg load symbolic;
syms x;
y = sin(x)^2; %y 0 sin(x)*sin(x)
p4 = taylor(y, x, 0, 'order', 5) %de ORDEN 4 y GRADO 4
p5 = taylor(y, x, 0, 'order', 6) %de orden 5 y GRADO 4
%poden ser iguales porque pdoese anular o moonomio de grado 5
ezplot(y)
