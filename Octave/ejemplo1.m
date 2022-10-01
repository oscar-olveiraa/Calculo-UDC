x = linspace(-2, 3, 100);
y = (1 - 2*x).*(x <= -1) + ((x + 1).^3 + 2*x).*(x > -1);
plot(x, y, '.');
title('funcion definida a trozos')