%% PROGRAMA QUE CALCULA EL N-ESIMO TERMINO 
%NOMBRE: PAUL ESCOBAR 
%DOCENTE: Ing. Patricio Pugarín.

%~~~~CODIGO~~~~~% 
function nesimo(n)
Uo=1;
a=0;
while a<n+1
  Un=sqrt(Uo+2);
 Uo=Un;
 a=a+1;
end
 fprintf('El termino %2x es %3.4f\n',n,Uo)
end