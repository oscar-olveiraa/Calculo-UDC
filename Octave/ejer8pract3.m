1;

close all;
pkg load symbolic;
syms x;

f=exp(x)
%Polinomio de Taylor de orden 1, polo tanto e unha recta
p1=taylor(f,x,0,'order',2)
%convertimos p1 a funcion numerica
p1n=matlabFunction(p1)
%calculamos a aproximacion de exp(0.27)
p1n(0.27)

%polinomio de taylor de orden 2
p2=taylor(f,x,0,'order',3)
%convertimos p1 a funcion numerica
p2n=matlabFunction(p2)
%calculamos a aproximacion de exp(0.27)
p2n(0.27)
fprintf("Aproximacion por taylor por orden 2: %f",p2n(0.27))

%polinomio de taylor de orden 2
p3=taylor(f,x,0,'order',4)
%convertimos p1 a funcion numerica
p3n=matlabFunction(p3)
%calculamos a aproximacion de exp(0.27)
p3n(0.27)
fprintf("Aproximacion por taylor por orden 2: %f",p3n(0.27))  
%orden 1
ezplot(f);
hold on;
ezplot(p1);
hold on;
plot([-1,1],[0,0],'k')
hold on;
plot([0,0],[-0.5,2],'k')
hold on;
plot(0.27,p1n(0.27), 'k*')
plot(p1n(0.27),0.27, 'k*')
axis([-1,1,-0.5,2])%axusta ou centra os eixes en un cuadrado

%orden2
ezplot(f);
hold on;
ezplot(p2);
hold on;
plot([-1,1],[0,0],'k')
hold on;
plot([0,0],[-0.5,2],'k')
hold on;
plot(0.27,p2n(0.27), 'y*')
axis([-1,1,-0.5,2])%axusta ou centra os eixes en un cuadrado