%% PROGRAMA QUE CALCULA TEMPERATURAS
%NOMBRE: PAUL ESCOBAR 
%DOCENTE: Ing. Patricio Pugarín.

%~~~~CODIGO~~~~~%
while true 
disp('Seleccione la temperatura a convertir:') 
disp( 'a. Celcius a Farenheit') 
disp( 'b. Celcius a Kelvin') 
disp( 'c. Celcius a Reaumur') 
disp( 's. Salir') 
op = input('Presione una tecla: ','s'); 
 
switch op 
 case 'a'
 fprintf('Transformacion de ºC a Farenheit\n') 
 while true 
 t = input('Ingrese otro ºC valor a convertir o Presione s para salir del menu \n','s'); 
 if t == 's' 
 break ; 
 end
C= eval(t);format short 
F = (9/5)*C + 32; 
 fprintf('F° = %3.3f \n',F) 
 end
 case 'b'
 fprintf('Transformación de ºC a kelvin. ') 
 while true 
 
 t = input('Ingrese otro valor ºC o presione s para salir al menu \n','s'); 
 if t=='s'
 break ; 
 end
 C=eval(t); 
 K= C+ 273.15; 
 fprintf('°K= %3.3f \n' , K) 
 end
 break ; 
 case 'c'
 fprintf('Transformacion a Reamur \n') 
 while true 
 
 t=input('Ingrese otro valor ºC o presione s para salir al menu \n','s'); 
 if t == 's'
 break ; 
 end
 C=eval(t); 
 R = 8/10*C; 
 fprintf('°R = %d \n',R) 
 end
 case 's'
disp('Fin del programa') 
break;
otherwise
disp('Opción no válida, ingrese de nuevo') 
end
end