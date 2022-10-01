1;
close all; 
pkg load symbolic
syms x;
x0=0;
y(x)=x^3+2*x-2;
ezplot(y(x))
%x1=x0+(y(x0))/(diff(y(x0),x,1))
r(x)=(1+(1/x))^x;
limit(r(x),x,+inf)


