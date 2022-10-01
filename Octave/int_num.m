1;
%ejercicio 6
close all;
clear, clc;
pkg load symbolic
syms x;
f=x*sqrt(16-x^2);
%ezplot(f, [0,4])
fprintf("Valor da integral exacta: %f\n", double(int(f,x,0,4)));
exactVal=double(int(f,x,0,4));
%Aproximacion numerica (simples)

function y=f(x)
  y=x.*sqrt(16-x.^2);%facemos function porque vamolo facer numericamente e non simbolicamente polo que hai que poñer os puntos 
endfunction

%Formula do punto medio simple

function y=PtoMedioS(f,a, b)
  ptomedio=(a+b)/2;
  y=(b-a)*f(ptomedio);
endfunction

%Formula do trapecio simple

function y=trapecioS(f,a, b)
  y=((b-a)/2)*(f(a)+f(b))
endfunction

%Formula de Simpson simple

function y=SimpsonS(f,a,b)
  ptomedio=(a+b)/2;
  y=(b-a)/6*(f(a)+4*f(ptomedio)+f(b));
endfunction

%Formula do punto medio composto
function i=ptomedioC(f,a,b,n)
  h=(b-a)/n;
  x=linspace(a,b,n+1);
  %i=f(x(1));
  i=0;
  for r=1:n
    i+=f((x(r)+(x(r+1)))/2);
  endfor
  i*=h
endfunction 
  
%Formula do trapecio composto equiespaciado
function i=trapecioC(x,y)
  n=length(x);
  h=(x(n)-x(1))/(n-1);
  w=2*ones(1,n);
  w(1)=1;
  w(n)=1;
  %vector de pesos
  w=h/2*w;
  i=sum(w .* y);
endfunction

%Forma de trapecio composto con un loop
function i=trapecioCLoop(x,y)
  n=length(x);
  h=(x(n)-x(1))/(n-1);
  i=1/2*y(1);%f(x0)
  for r=2:n-1
    i+=y(r);%f(xi)
   endfor
   i+=1/2*y(n);%f(xn)
   i*=h;
endfunction

%Formula de Simpson composto 
function i=SimpsonC(f,a,b,n)
  h=(b-a)/n;
  x=linspace(a,b,n+1);
  i=f(x(1));
  for r=2:n
    if (mod(r,2)==0)
      i+=4*f(x(r));
    else
      i+=2*f(x(r));
    endif 
  endfor
  i+=f(x(n+1));
  i=i*h/3;
endfunction


%simples
a=0;
b=4;
fprintf("Valor da integral aproximada ptomedio simple: %f\n", double(PtoMedioS(@f,a,b)));%o arroba e como un punteiro (en C o '*')
fprintf("Valor da integral aproximada trapecio simple: %f\n", double(trapecioS(@f,a,b)));
fprintf("Valor da integral aproximada simpson simple: %f\n  ", double(SimpsonS(@f,a,b)));

%compostas

n=10;%canto mais aumentemos o intervalo mais aproximado sale a integral
x=linspace(0, 4, n+1);
y=f(x);
fprintf("Valor da integral aproximada punto medio composto: %f\n", ptomedioC(@f,a,b,n));
fprintf("Valor da integral aproximada trapecio composto: %f\n", trapecioC(x,y));
fprintf("Valor da integral aproximada trapecio composto(funcion propia de octave): %f\n", trapz(x,y));
fprintf("Valor da integral aproximada trapecio composto con un bucle: %f\n",trapecioCLoop(x,y));
fprintf("Valor da integral aproximada Simpson composto: %f\n", SimpsonC(@f,a,b,n));

for r=1:5
  npoints=10^r+1;%canto mais aumentemos o intervalo mais aproximado sale a integral
  x=linspace(a, b, npoints);
  y=f(x);
  i=trapz(x,y);
  error=abs(i-exactVal);
  fprintf("Valor da integral aproximada trapecio composto(funcion propia de octave) con npoints=%i: %f, error =%f \n", npoints, i, error);  
endfor 

%ejercicio 7


