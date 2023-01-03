function x=sistem_lup(A,b)
  %[L U P]=lu(A)
  % La matriz b se debe ingresar 
  %de la sigiuiente manera: [a b c]
    [L U P]=splu(A);
    B1=P*b';
    y=sistemaTi(L,B1);
    x=sistemaTs(U,y');
    disp('La solución es: ')
end