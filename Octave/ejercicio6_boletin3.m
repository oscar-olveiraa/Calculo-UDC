1;
close all;
pkg load symbolic
syms x;
x0=1;
f(x)=e^(-x^2+2*x-1);
f(x)
y=f(x0)+subs(diff(f,x,1),x0)*(x-x0)

ezplot(f(x))
hold on;
ezplot(y)

