clf, clc,clear
pkg load symbolic
syms x

f = x*exp(x);
ezplot(f,[-5,10])

% Derivada de la funcion f

derivada = diff(f,x)


% Derivada de orden n de la funcion f

n = 3;

derivada_orden_n = diff(f,x,n)


% Extremos relativos de la funcion f

extremos_relativos = solve(derivada==0,x)

    % Si f''(x0) > 0 maximos relativo
    % Si f''(x0) < 0 minimo relativo 


% Posibles extremos absolutos

a = 0;
b = 2;

posibles_extremos_absolutos = [double(extremos_relativos),a,b];

n = length(posibles_extremos_absolutos);

extremo_evaluado = zeros(1,n);

for k = 1:n
valor_extremo = subs(f,x,posibles_extremos_absolutos(k))
fprintf('El valor de f en el extremo relativo %8.2d es %8.2f \n', posibles_extremos_absolutos(k), double(valor_extremo));
endfor


% Crecimiento de la funcion f en cada intervalo


%derivada = diff(f,x);
%raices = solve(derivada==0,x);
%crecimiento = subs(derivada,x,%aqui se pone la raiz)

% Posibles puntos de inflexiÃ³n de la funcion f, Â¿concava o convexa?

derivada_segunda = diff(f,x,2);
posible_punto_inflexion = solve(derivada_segunda==0,x)
derivada_tercera = diff(f,x,3)

evaluada = subs(derivada_tercera,x,posible_punto_inflexion(2));

if (double(evaluada)!=0)
  fprintf('punto de inflexion de f es %8.3f', double(posible_punto_inflexion(2)))
endif

    % Si f''>0 entonces f' es convexa en [0,posible_punto_inflexion] y creciente
    % Si f''<0 entonces f' es concava en [0,posible_punto_inflexion] y decreciente

figure(2)
ezplot(derivada_segunda,[0,100]) 
figure(3)
ezplot(derivada_segunda,[0,double(posible_punto_inflexion(2))])

% Polinomio de Taylor de orden 2

polinomio_taylor_orden_3 = taylor(f,x,'order',3)


% Limite de una funcion en un punto


limite = limit(f,x,0)


% Limites laterales

limite_derecha = limit(f,x,0,'right')
limite_izquierda = limit(f,x,0,'left')


% Asintotas horizontales

asintota_horizontal = limit(f,x,inf) % Comprobamos los limites laterales. Todos tienen que dar el mismo valor finito
asintota_horizontal = limit(f,x,inf, 'left')
asintota_horizontal = limit(f,x,inf, 'right')

% Asintotas verticales


asintota_vertical = limit(f,x,1) % Comprobamos los limites laterales. Todos tienen que dar infinito
asintota_vertical = limit(f,x,1, 'left')
asintota_vertical = limit(f,x,1, 'right')

% Asintotas oblicuas. Recordar y = mx + n; solo hay cuando no existen asintotas horizontales 
% y cuando el grado del numerador es uno mayor que el del denominador


m = limit(f/x,x,inf);
n = limit(f-m*x,x,inf);

asintota_oblicua = m*x + n


% Recta tangente


ezplot(x,f);
hold on
f0 = diff(f,x);
fx = subs(f,x,x0);
m = subs(f0,x,x0);

tangente = m * (x - x0) + fx
ezplot(x,tangente)


%%%%%%%%%%%%%%%INTEGRALES%%%%%%%%%%%%%%% 
pkg load symbolic
syms x  
f = x^3 + 2*x;  
% Primitiva de la funcion f 
primitiva = int(f,x)  
% Integral de f definida en un intervalo [a,b]  
a = 0; b = 2;  
integral_definida = int(f,x,a,b)  
% Integral impropia de f  
a = -inf; b = inf;  
integral_impropia = int(f,x,a,b) 
% Aproximar integral definida de f en un intervalo [a,b] por el metodo del punto medio  
a = 0; b = 2; 
punto_medio = (a + b) / 2;
integral_punto_medio = subs(f,x,punto_medio) * (b - a) 
% Aproximar integral definida de f en un intervalo [a,b] por el metodo del trapecio compuesto  
for n = 1:5   
  nodos = linspace(a,b,10^n);   
  funcion_evaluada = nodos.^3 + 2.*nodos;   
  integral_trapecio_compuesto = trapz(nodos,funcion_evaluada) 
endfor

%volumen esfera
a=1;
while a
r=input('ingrese el radio[entre 0 y 5]');
a=(r<0)+(r>5);
end
vol=(4/3)*pi*r^3;
fprintf('El volumen de la esfera es %f ',vol);



