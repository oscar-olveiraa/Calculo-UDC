1;

close all;
pkg load symbolic;
syms x;
syms f(x)

%polinomio de taylor de orden 1 para 
%unha funcion generica f simbolica
taylor(f,x,0,'order', 2)

g=f(0)+subs(diff(f,x,1),0)*(x-0)