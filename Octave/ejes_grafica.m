syms x;
f=exp(-1/x)/x;
ezplot(f);
hold on;
plot ([-10,10], [0,0], ':')%DIBUJA EL EJE X:A.H. Y=0
hold on;
plot ([0,0],[-10,10], ':')%DIBUJA EL EJE Y:A.H. x=0
hold off;