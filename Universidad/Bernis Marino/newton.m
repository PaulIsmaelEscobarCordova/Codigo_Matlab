function [Raiz fxi] = newton(xi,f,tol)                                    %Inicio de la funcion declarando las variables de la funcion

syms x                                                                      %Declarar la variable simbolica
fp=diff(f,x);                                                               
i=0;                                                                        %Inicializamos con el valor i=0
display('Metodo de Newton')                                                 %Impresión del encabezado del metodo
fprintf('Iteración  Aproximación\n')                                        %Impresion de la iteracion a realizar
error=tol+1;                                                                %Ecuacion en la que se plantea el error en base a la tolerancia
while error>tol                                                             %Inicio del while tomando en cuenta que el error debe ser mayo a la tolerancia
    fxi = feval(inline(f),xi)                                               %Evaluamos la funcion y la derivada
    fpxi = feval(inline(fp),xi);
    xi1=xi-fxi/fpxi;                                                        %Aplicamos la formula de Newton Raphson
    error=abs((xi1-xi)/xi1) 
    xi=xi1;                                                                 %Se reasigna los valores sacados
    fprintf('%d \t %f\n',[i,xi1]')                                          %Imprimir los valores obtenidos por medio del metodo
    i=i+1;                                                                  %Variable para realizar la iteracion
end                                                                         %Se cierra la funcion while
Raiz=xi1;                                                                   %Se muestra el valor obtenido de la raiz por el metodo de Raphson
end                                                                         %Se finaliza toda la funcion