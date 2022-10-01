clear
m=input('Ingrese el numero de filas:')
n=input('Ingrese el numero de columnas:')
A=zeros(m,n);
for i=1:1:m
  for j=1:1:n
    A(i,j)=input('Introduce los componentes de A:');
    if A(i,j)==0
      while A(i,j)==0
        display('0 no es una entrada valida, ingrese un nuevo valor');
        A(i,j)=input('Valor incrrecto, ingre los componentes');
      endwhile
    endif
    A
  endfor
endfor
printf('Esta es la matriz')
A
