function [x,fx,xx] = secant(f,x0,TolX,MaxIter,varargin)                     %Inicio de la funcion declarando las variables de la funcion

h = 1e-4; h2 = 2*h; TolFun=eps;                                             %Declaramos los valores que tendran algunas variables dentro del programa
xx(1) = x0; fx = feval(f,x0,varargin{:});
for k = 1: MaxIter                                                          %Iniciamos un ciclo for con el maximo de iteraciones
if k <= 1, dfdx = (feval(f,xx(k) + h,varargin{:})-...                       %Por medio de un if/else realizamos las validaciones para la iteracion
feval(f,xx(k) - h,varargin{:}))/h2;                                         %Continua la sentencia del if
else dfdx = (fx - fx0)/dx;                                                  %Aplicamos lo que sucedera en el caso contrario en el else
end                                                                         %Cerramos el if/else
dx = -fx/dfdx;                                                              %Continuamos con los procesos respectivos para la funcion secante del for
xx(k + 1) = xx(k) + dx;                                                     %Aplicamos las formulas respectivas para obtener las raices
fx0 = fx;
fx = feval(f,xx(k+1));                                                      %Declaramos la fx que nos dara el resultado
if abs(fx) < TolFun||abs(dx) < TolX, break; end                             %Por medio de la funcion if validamos la tolerancia con un break y cerramos el if
end                                                                         %Cerramos el ciclo for
x = xx(k + 1);
if k == MaxIter, fprintf('La mejor en %d iteracion\n',MaxIter), end         %Uso de la funcion if para imprimir y validar las iteraciones obtenidas y se cierra de igual manera la funcion