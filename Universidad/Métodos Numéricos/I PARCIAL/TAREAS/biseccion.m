
function [Raiz fx] = Biseccion(fun,t)                                       %funcion biseccion, se tienen los datos de salida y los datos de entrada
syms x
f=inline(fun);                                                              %se utiliza el inline para pasar la funcion de una cadena a una expresion para poder realizar calculos ams adelante                                                 
% GRAFICAMOS PRIMERO LA FUNCION PARA SABER LOS PUNTOS a&b
   
    h=ezplot(f,[-20:20])
    axis([-20 20 -900 900])
    xlabel('Eje x'), ylabel('Eje y')
    title('GRAFICA DEL METODO DE BISECCION')
    grid on
    box on
    set(h,'color','r','LineWidth',1,'LineStyle','-')

% VAMOS A PONER LOS VALORES RESPECTIVOS PARA a&b
 
    a=input('Ingrese el valor de a: ')
    b=input('Ingrese el valor de b: ')
% CALCULAMOS EL NUMERO DE ITERACIONES NECESARIAS: 
    n0= abs(log(t)/log10(2));
    n1=floor(n0);
    fprintf('Se necesitan por lo tanto,aproximadamente el siguiente número de iteraciones: \n %3.2f\n',n1)
    n=input('Ingrese el número de iteraciones: ')  
    
 for k=1:n                                                                  %empieza ciclo for
    c=a+(b-a)/2;                                                              %empieza el calculo de las raices
    e=abs((b-a)/2);                                                           %Calculo del error
    A(k,:)=[k a b c f(c) e];                                                %nombres de las columnas de la tabla
    if sign(f(a))*sign(f(c))<0                                                          %inicia condicion
        b=c;
    else
        a=c;
    end                                                                     %finaliza condicion
end                                                                         %finaliza ciclo for
fprintf('\n \tk \t\t\ta \t\tb \t\tc \tf(c) \t\terror \n')                   %se imprimen los resultados.
disp(A)
fprintf('Solución:\n c=%8.5f\n',c)
fprintf('f(c)=%8.5f\n',f(c))
fx=f(c);
fprintf('error=%8.5f\n',e)
Raiz=c;
 
