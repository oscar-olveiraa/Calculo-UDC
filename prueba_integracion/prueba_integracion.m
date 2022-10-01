%Oscar Olveira Miniño/3.1
1;
close all;
clc;
pkg load symbolic
syms x;
%apartado a
%1=(x^2/4^2)+(y^2/2^2)
y=sqrt((1-(x^2/4^2))*2^2);
a=4;
b=2;
A=int(y,x,b,a)

%apartado b


%apartado c
j=y^2
V=pi*(int(j,x,b,a))

%apartado d
function i=trapecioC(r,f)
  n=length(r);
  h=(r(n)-r(1))/(n-1);
  w=2*ones(1,n);
  w(1)=1;
  w(n)=1;
  %vector de pesos
  w=h/2*w;
  i=sum(w .*f);
endfunction

n=20;%canto mais aumentemos o intervalo mais aproximado sale a integral
r=linspace(2, 4, n+1);
f=sqrt((1-(r.^2/4^2))*2^2);
fprintf("Valor da integral aproximada trapecio composto: %f\n", trapecioC(r,f));

for r=1:5
  npoints=10^r+1;
  r=linspace(2, 4, npoints);
  k=trapecioC(r,f);
  error=abs(k-V);
  fprintf("Valor da integral aproximada trapecio composto con npoints=%i: %f, error =%f \n", npoints, k , error);  
endfor 



