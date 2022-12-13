%% PROGRAMA QUE CALCULA LA RAIZ DE UN METODO ANTIQUISIMO
%NOMBRE: PAUL ESCOBAR 
%DOCENTE: Ing. Patricio Pugarìn.

%~~~~CODIGO~~~~~%

function ejercicio_2_rdprom(a)
aprox=a/2;
div=a/aprox;
x=mean([aprox div]);
while (x^2-a)>0.000001
 aprox=x;
 div=a/aprox;
 x=mean([aprox div]);
end
disp(['La raiz cuadrada aproximada de ',num2str(a), 'es: ', num2str(div)])



