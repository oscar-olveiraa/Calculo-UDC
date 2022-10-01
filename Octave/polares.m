%cos saca o coseno e grados e cosd pon o coseno en radians
function num = polares(mod,arg)
  x=mod*cosd(arg);
  y=mod*sind(arg);
  num=x+j*y    
endfunction
