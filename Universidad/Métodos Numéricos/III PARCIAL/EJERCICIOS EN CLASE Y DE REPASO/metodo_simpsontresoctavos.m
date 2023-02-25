%% PROGRAMA DE LA INTEGRACION NUMERICA DE SIMPSON 3/8
function metodo_simpsontresoctavos
fprintf('Bienvenido, este programa usa la regla del simpson 3/8 para aproximar el valor de una integral definida: \n');
g=input('Ingrese la función: ','s');
f=inline(g);
a=input('Ingrese el extremo inferior de la integral: ');
b=input('Ingrese el extremo superior de la integral: ');
k=input('Ingrese la cantidad de veces que desea aplciar el método: ');     % Se pone los n+1 puntos.
n=3*k;
h=(b-a)/n;
A=0;
for i=1:k
    A=A+(3*h/8)*(f(a)+3*f(a+h)+3*f(a+2*h)+f(a+3*h));
    a=a+3*h;
end

fprintf('El valor aproximado de la integral es: %f',A);
end