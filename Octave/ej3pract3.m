1;
close all;
pkg load symbolic
syms x;
f=(x^3-9)/(x^2-16);
fn=matlabFunction(f);
%Dominio, quitar esta raices do denominador
solve(x^2-16)

%cortes eixe x
cx=solve(f)
%cortes eixe y
subs(f,0)
figure()
%esto e sin o matlabfunction
%ezplot(f, [-8,12])
%axis([-8,12,-40,40])

%esto e co matlabFunction
xx=linspace(-8,12,1000);
yy=fn(xx);
yy(abs(yy)>30.)=NaN;%(o punto despois do 30 non e necesario)esto quere decir que os que son mayores de 30 anulaos e non o debuxa
plot(xx,yy, 'b');
hold on;
plot(xx,0.*xx, 'k')
axis([-8,12,-40,40])
%oblicuas
m1=limit(f/x,x,'inf')
m2=limit(f/x,x,'-inf')
n1=limit(f-m1*x,x,'inf')
n2=limit(f-m2*x,x,'-inf')
hold on;
plot(xx,double(m1)*xx+double(n1), 'r');
axis([-8,12,-30,30])

%punto de cortes 
solve(f-x)
%Extremos
df=diff(f,x,1)
df=diff(f,x,2)
%puntos criticos
disp('Puntos criticos');
cr=solve(df)
double(cr(3))
double(subs(df,sym('0')))
double(subs(df, sym('1/2')))
%coidado porque ten que ser en numerico, non pode ser en simbolico, osea pode ser pero e unha basura
##%exemplo simbolico
##F=f-x;
##dF=diff(F);
##
##x=0.4
##for i=1:2
##  x=x-subs(F,x)/subs(dF,x) 
##endfor
##double(x)
%exemplo numerico
F=f-x;
dF=diff(F);
Fn=matlabFunction(f-x);
dFn=matlabFunction(diff(F));

x=0.4
for i=1:2
  x=x-Fn(x)/dFn(x)
endfor
axis([-8,12,-30,30])

