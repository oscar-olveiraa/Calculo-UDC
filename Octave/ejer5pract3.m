1;

close all;
pkg load symbolic;
syms x;

f=4*x^2+5*x-2;
a0=-3;
b0=0;

%Comprobacion Teorema de Bolzano
if (subs(f,a0)*subs(f,b0)<0)
fprintf("Hay algunha sol para o terorema de bolzano\n");
endif

roots=solve(f)
%Solucions escritas en double
double (roots(1))
double (roots(2))

%calculamos o numero de iteracions
eps=0.04;
%error-> error=(log
n=fix(log((b0-a0)/eps)/log(2))%calcula o error e fix e porque solo queremos a parte enteira 

%convieeto la funcion a funcion numerica
fn=matlabFunction(f);

a=a0;
b=b0;

for i=1:n
  fprintf("====It %i=====\n", i);
  x=(a+b)/2
  if(fn(a)*fn(x)<0)
    b=x;
  else
    a=x;
  endif

endfor
fprintf("Aproximacion da sol: %d\n", x);
error=abs(x-double(roots(2)))