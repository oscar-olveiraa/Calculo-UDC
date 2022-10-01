1;
function p=MDD(x,y)%contruccion tabla caputura
  n=length(x);%longitud puntos vector
  D=zeros(n,n);
  D(:,1)=y;%rellenar primera coluna
  % Bucle en columnas que rellena la matriz
  for j=2:n%este bucle vai por columnas
    for i=1:(n-j+1)
      D(i,j)=( D(i+1,j-1)-D(i,j-1) ) / ( x(j+i-1) - x(i) );%captura de pantalla
    end
  endfor
  p=D(1,:);
endfunction

function val=poly(p,xi,x)%construccion de polinomio
  dim=length(x);
  val=p(1)*ones(1,dim);%si quitamos os ones que hai evaluaria para un solo valor de x //val e o primer coeficinete da tabla
  prod=1*ones(1,dim);
  for i=1:length(p)-1
    prod=prod.*( x-xi(i).*ones(1,dim))
    val=val+p(i+1)*prod;
  endfor
endfunction



##%puntos de partida
##x=linspace(-pi,pi,5);
##y=sin(x);
##%calculo coeficientes pol. lagrange 
##p=MDD(x,y);
##%evalue el polinomio de interpolacuion en 100 pts
##xx=linspace(-pi,pi,100)
##yy=poly(p,x,xx)
##%pintamos ambas cousas 
##plot(xx,yy,'r');%funcion interpolada(grafica aproximada)
##hold on
##plot(x,y,'k*');%ountos
##hold on
##plot(xx,sin(xx),'b-');%funcion seno de verdad

%--------------------------------------------------------%
##%funcion  diferente
##%puntos de partida
##x=linspace(-1,1,5);
##y=1./(1+25.*x.^2);%puntos na division, multiplicacion  e elevado porque x é un vector
##%calculo coeficientes pol. lagrange 
##p=MDD(x,y);
##%evalue el polinomio de interpolacuion en 100 pts
##xx=linspace(-1,1,100)
##yy=poly(p,x,xx)
##%pintamos ambas cousas 
##plot(xx,yy,'r');%funcion interpolada(grafica aproximada)
##hold on
##plot(x,y,'k*');%puntos
##hold on
##plot(xx,1./(1+25.*(xx).^2),'b-');%deubox funcion de verdad

%----------------------------------------------------------%
##%uso de interp1
##%puntos de partida
##x=linspace(-1,1,21);
##y=1./(1+25.*x.^2);%puntos na division, multiplicacion  e elevado porque x é un vector
##%calculo coeficientes pol. lagrange 
##p=MDD(x,y);
##%evalue el polinomio de interpolacuion en 100 pts
##xx=linspace(-1,1,100);
##yy=interp1(x,y,xx, 'spline');%pode ser spline ou linear
##%pintamos ambas cousas 
##plot(xx,yy,'r');%funcion interpolada(grafica aproximada)
##hold on
##plot(x,y,'k*');%ountos
##hold on
##plot(xx,1./(1+25.*(xx).^2),'b-');%funcion seno de verdad

%------------------------------------------------------------%

%ejercicio 3

%Solucion ejercicio 3
x=[10,20,30,40];
y=[10,50,150,300];
p=MDD(x,y);
poly(p,x,25);

%puntos de partida
##x=[0.9,1.3,1.9,2.1,2.6,3,3.9,4.4,4.7,5,6,7,8,9.2,10.5,11.3,11.6,12,12.6,13,13.3];
##y=[1.3,1.5,1.85,2.1,2.6,2.7,2.4,2.15,2.05,2.1,2.25,2.3,2.25,1.95,1.4,0.9,0.7,0.6,0.5,0.4,0.25];
##%calculo coeficientes pol. lagrange 
##p=MDD(x,y);
##%evalue el polinomio de interpolacuion en 100 pts
##xx=linspace(0.9,13.3,100);
##%yy=poly(p,x,xx);%pode ser spline ou linear
##yy=interp1(x,y,xx,'spline');
##%bosquexo
##plot(xx,yy,'r');%funcion interpolada(grafica aproximada)
##hold on
##plot(x,y,'k*');%puntos

