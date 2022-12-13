% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
%                                                                         %
%                                                                         %
%                                                                         %
%           Autor:    Paul Escobar                                        %
% Examen I PARCIAL                                                        %
%                                                                         %
% METODOS NUMERICOS                                                       %
%           
% Fecha:	02 de Junio del 2022                                          %
%          % Fecha:	02 de Junio del 2022                                  %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 

clear all;
format short;                                                               %especifica numero de decimales(fotmato corto)
fprintf('\n========================================')                       %empieza presentacion y menu de opciones
fprintf('\n METODOS NUMERICOS\n')
fprintf('\n Grupo 01\n')
fprintf('\n Kevin Castillo\n')
fprintf('\n Yandri Vacas\n')
fprintf('\n Paul Escobar\n')
fprintf('\n Leonardo Paredes\n')
fprintf('\n Mateo Martinez\n')
fprintf('\n========================================\n')
fprintf('\n Funcion frlnl\n')
fprintf('\n 1. Newton Raphson \n 2. Secante \n 3. Biseccion')
 n = input('\n Ingrese el numero del metodo: ');                            %Finaliza presentacion y menu de opciones

switch n                                                                    %Toma el valor de n para definir el metodo a utilizar
    case 1                                                                  %opcion 1 = newton raphson
        fprintf('\n=== Metodo de Newton Raphson ===\n')
        syms x;                                                             %define variable simbolica x
        fun=input('Introduza la funcion f(x)= ');
        xi=input('Introduzca el valor inicial: ');                          %define punto de inicio
        tol=input('Introduzca la tolerancia: ');                            %se introduce el valor de tolerancia para las iteraciones y para hallar la raiz
        [Raiz fxi] = newton(xi,fun,tol);
        fprintf('\n La raiz es: %d \n', Raiz)

        %Grafica
        clf;                                                                
        fplot(fun);                                                         %grafica la funcion
        grid on;                                                            %activa la grilla en la grafica
        hold on;                                                            %activa la grafica para que se actualicen y guarden los cambios siguientes
        plot(Raiz,fxi,'ro')                                                 %grafica la raiz
        xlabel('x')                                                         %pone titulos al eje x
        ylabel('f(x)')                                                      %pone titulos al eje y
        title('Metodo de Newton Raphson')                                   %titulo a la grafica
        hold off                                                            %cierra la grafica para que ya no existan mas cambios

        
    case 2                                                                  %opcion 2 = Metodo de la Secante
        
        fprintf('\n=== Metodo Secante ===\n')                               %Ingreso de datos
        fun=input('Introduza la funcion f(x)= ','s');
        xi=input('Introduzca el valor inicial: ');
        TolX=input('Introduzca la tolerancia: ');

         f = inline(fun,'x');                                               %pasa la funcion en cadena a una expresion para poder realizar calculos ams adelante
         MaxIter=100;                                                       %numero de iteraciones a realizar
         [Raiz,fx,xx] = secant(f,xi,TolX,MaxIter)                           %estructura de la funcion
         fprintf('\n La raiz es: %d \n', Raiz)                              %resultado de la raiz de la funcion
%Grafica
 fplot(fun);
        grid on;
        hold on;
        plot(Raiz,fx,'ro')
        xlabel('x')
        ylabel('f(x)')
        title('Metodo de Secante')
        hold off
    case 3                                                                  %opcion 3 = Metodo de Biseccion
        fprintf('\n===Metodo Biseccion ===\n')                              
        fun=input('Introduza la funcion f(x)= ','s'); 
        a=input('Introduzca el valor de a: ');
        b=input('Introduzca el valor de b: ');
        cont=input('Introduzca el numero de iteraciones: ');
        [Raiz fx] = biseccion(a,b,cont,fun)   
        fprintf('\n La raiz es: %d \n', Raiz)
%Grafica

clf;
 fplot(fun);
        grid on;
        hold on;
        plot(Raiz,fx,'ro')
        xlabel('x')
        ylabel('f(x)')
        title('Metodo de Biseccion')

    otherwise
        disp('Ingrese un numero Valido')
end
