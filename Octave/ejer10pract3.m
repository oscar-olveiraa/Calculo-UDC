1;

close all;
pkg load symbolic;
syms x;

f=sin(x);
p1=taylor(f,x,0,'order',1)
p3=taylor(f,x,0,'order',4)
p5=taylor(f,x,0,'order',6)
p7=taylor(f,x,0,'order',8)

ezplot(f)
hold on;
ezplot(p1)
hold on;
ezplot(p3)
hold on;
ezplot(p5)
hold on;
ezplot(p7)
%o apartado c e como o 8 evaluar en e(0.27)