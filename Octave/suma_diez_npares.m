function suma_diez_npares (x)
  suma=0
    for(x=1:10) %bucle for do 1 a 10
      if(rem(x,2)==0)
        suma=x+x
      endif  
     endfor
endfunction
