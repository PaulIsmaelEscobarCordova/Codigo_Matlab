%CONDICIONALES
%a=24;
%b=0;
% y=a/b
% if b~=0
     %y=a/b
% else
 %    disp('La division por 0 es indeterminda')
% end
 %- PARA VARIOS ENUNCIADOS IF/ELSE------------------------
 
 %edad = 'Cual es la edad de la persona'
 %x=input('Valor: ');
 %if x<16
  %   disp('No puede conducir')
 %elseif x<18
  %    disp('Puede obtener un permiso de conducción')
 %elseif x<70
  %    disp('Licencia especial')
 %else 
  %   disp('No es apto para conducir')
 %end

 %% EJERCICIOS DE REPASO
 %%- SWITCH/CASE ES LO MISMO QUE EL IF/ELSE------------------------
 
 a=input('Ingrese un numero para determinar el caso: ');
 
 switch a
     case -1
         disp('Es un número negativo')
         
     case 0
         disp('Es un número cero')
     case 1
         disp('Es un número positivo')
     otherwise
         disp('Otro Valor')
 end
%% CICLO FOR 
for i=1:10
    disp('Hola');
end
%% Ciclo for del 4 al 9 de 2 en 2
for i=4:2:9
    disp('3 veces');
end
%% Ciclo for para ver cuántos múltiplos
% de 4 hay del 1 al número n
contador = 0;
n = 10;
for i=1:n
    disp(i); %Muestra el valor de i en cada iteración
    if mod(i,4)==0 % Entra al if si es divisible entre 4
        contador = contador +1;
    end
end
disp(contador);
%% Ciclo for anidado
for i=1:3
    disp('Ciclo for 1');
    for j=1:2
        disp('Ciclo for 2');
        A(i,j) = i+j; %Crea matriz A
    end
    disp('Sale ciclo for 2')
end
disp('Sale ciclo for 1')
 %% WHILE
x = 1; 
while x<5 %Mientras es menor a 5, se realiza lo que está en el while
    disp(x);
    disp('Aún no llegamos a 5')
    x = x+1;
end
% Cuando llega a 5, sale del while
disp('Llegamos a 5')
%% WHILE como bandera
flag = 0;
while flag==0
    a = input('a: ');
    b = input('b: ');
    disp(a+b);
    flag = input('1.- Salir 0.- Continuar: ');
    fprintf('\n');
end
disp('Hasta luego ^^/')
 
 

 
 
    