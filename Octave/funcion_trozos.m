function y=funcion_trozos(x)
y1=2*x;
y2=3*x-1;
y3=5*x-5
y=y1.*(x<1)+y2.*((x>=1)&(x<=2))+y3.*(x>2);
plot(x,y)
endfunction
%Para utilizarla executase en ventana de comandos:
x=0:0.01:3;
y=funcion_trozos(x);
