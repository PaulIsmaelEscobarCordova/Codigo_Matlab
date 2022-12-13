% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% Autores:  Leonardo Paredes                                              %
%           Yandri Vacas                                                  %
%           Kevin Castillo                                                %
%           Mateo Martinez                                                %
%           Paul Escobar
% Fecha:	15 de Julio del 2022                                          %
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
fprintf('\n Funcion finter\n')
fprintf('\n 0. Interpolacion de Newton \n 1. Interpolacion de Lagrange \n 2. Interpolacion de Spline')
 o = input('\n Ingrese el numero del metodo: ');                            %Finaliza presentacion y menu de opciones

switch o                                                                   %Toma el valor de n para definir el metodo a utilizar
    case 0   
        fprintf('INTERPOLACION "POLINIMIO DE NEWTON"\n\n\n');
        M=input('Ingrese la Matriz A:')  
       
        
tic
dimA = size(M);                                             %Especifica la dimension de la matriz
n = dimA(1);                                                % Se define el numero de puntos
auxR = 0;                                                   %Inicializamos variable ordenar
p = 0;                                                      %Inicializamos variable para sumatoria
syms t;                                                     %Define la variable para representar el polinomio
En = 1;                                                     %Se inicializa la variable En
if dimA(2) == 2                                             %Validamos que la dimension de la matriz sea de n*2
    for i = 1: dimA(1)
        for j = 1: dimA(2)
            matrizR(i,j) = M(i,j);
            if isreal(matrizR(i,j)) == 1                    %Validamos que los valores sean reales
                auxR = auxR + 1;                            %Se aumenta el contador
            end                                             %Fin funcion if
        end                                                 %Fin funcion for
    end                                                     %Fin funcion for
    if auxR == (2*n)                                        %Funcion if(Condicion si el contador es igual M la dimension de la tabla)
        for j=1:n-1                                         %Especificacion de repeticion del for
            for i=1:1:n-1
                if M(i,1) > M(i+1, 1)                       %Algoritmo Bubble Sort
                    aux = M(i,:);                           %Variable auxiliar para uso del algoritmo
                    M(i,:) = M(i+1,:);                      %Cambio de valores
                    M(i+1,:) = aux;                         %Nuevo valor de intercambio
                end                                         %Fin funcion if
            end                                             %Fin funcion for
        end                                                 %Fin funcion for
        for i = 1:n
            L = 1;                                          %Inicializamos variable para proceso
            for j = 1:n
                if i ~= j
                    L = L *(t - M(j,1))/(M(i,1) - M(j,1));  %Proceso
                end                                         %Fin funcion if
            end                                             %Fin funcion for
            p = p + L * M(i,2);                             %Proceso Sumatoria
        end                                                 %Fin funcion for
        pEx = expand(p)                                     %Simplificacion de la expresion
        hold on
        ezplot(pEx,[(M(1,1) - 3), (M(n,1) + 3)])            %Grafica Polinomio de Newton
        %axis([(M(1,1)-1.5) (M(n,1)+1.5) (M(1,2)-5) (M(n,2)+5)]); %Configuracion de limites de la grafica
        xlabel('Eje x')                                     %Designacion de etiqueta para el eje 'x'
        ylabel('Eje y')                                     %Designacion de etiqueta para el eje 'x'    
        title('Polinomio interpolador de Newton')           %Designacion del titulo de la grafica
        grid on
        x = M(:,1);                                         %Asignacion de valores de la matrix M variable x
        y = M(:,2);                                         %Asignacion de valores de la matrix M variable y
        scatter(x,y,[])                               %Grafica de puntos
        T = table(x,y)                                      %Creacion de tabla con los respectivos puntos
        for i = 1 : n
            En = En * (t - M(i,1));                         %Calculo En
        end                                                 %Fin funcion for
        fdd = zeros(n,n);                                   %Se inicializa el valor para las diferencias divididas
        for i = 1:n
            fdd(i,1) = y(i);                                %Asignacion de valores de y en la 1er columna de la matriz de Dif Div
        end                                                 %Fin funcion for
        for j = 2:n
            for i = 1:((n+1)-j)
         fdd(i,j)=(fdd(i+1,j-1)-fdd(i,j-1))/(x(i+j-1)-x(i));%Cálculo de las diferencias divididas
                 
            end                                             %Fin funcion for
        end                                                 %Fin funcion for
        fdd
        dimFdd = size(fdd);                                 %Asignacion del tamaño de la matriz de dif div M la variable dimFdd
        nFdd = dimFdd(2);                                   %Asignacion del valor de las columnas en la variable nFdd
        syms ft;                                            %ft es la coeficiente del punto x_(n+1) 
        Rtx = En*(ft-fdd(1,nFdd))/(t-x(1))                  %la funcion de truncamiento con t como x, y ft como una funcion de x
        
        prompt = 'Desea ingresar un x? 1. SI 2. NO: ';
        confirmacion = input(prompt)                        %Pregunta si se desea añadir un valor de x nuevo 
        bandera = 1;                                        %Inicializa opcion
        while bandera
            if confirmacion == 1
                bandera = 0;                                %Sobreescribe el valor de la opcion para salir del bucle
                prompt = 'Ingrese el valor de x: '; 
                xExtra = input(prompt)                      %Se pide un valor para la variable x nueva
                if xExtra < x(n)&& xExtra > x(1)            %Se analisa que x este dentro del dominio de los puntos
                    c= subs(p,xExtra);                      %polinomio de newton evaluado en el punto ingresado
                    pnp=1;                                  %Inicializa el último término del nuevo polinomio con n+1 puntos
                    syms p                                  %Se declara variable simbólica M p
                    for k = 1:n
                     pnp = pnp *(p-M(k,1))/(xExtra-M(k,1)); %Se calcula el Ultimo termino del polinomio de error con n+1 puntos
                    end                                     %Fin funcion for
                    ynew= c/subs(pnp,xExtra);               %Calculo de el coeficiente n+1
                    plot(ynew,'mo')
                    M(n+1,1) = xExtra;                      %Agregacion de el nuevo punto independiente
                    M(n+1,2) = ynew;                        %Agregacion de el nuevo punto dependiente
                    dimA = size(M);                         %Calculo de la dimensión de la nueva matriz M
                    n = dimA(1);                            %Almacenamiento de el número de columnas de la matriz M en n
                    x = M(:,1);                             %Asignacion M x las variables independientes
                    y = M(:,2);                             %Asignacion M x las variables dependientes
                    fdd = zeros(n,n);                       %Inicializacion la tabla de dif divididas
                    for i = 1:n
                        fdd(i,1) = y(i);                    %Asignacion de los terminos dependientes M la primera columna
                    end                                     %Fin funcion for
                    for j = 2:n
                     for i = 1:((n+1)-j)
                        fdd(i,j)=(fdd(i+1,j-1)-fdd(i,j-1))/(x(i+j-1)-x(i)); %Calculo de las diferencias divididas
                     end                                    %Fin funcion for
                    end                                     %Fin funcion for
                    index = 0;                              %Incializacion variable index
                    for k = 1:n
                        if xExtra> x(k)                     %Condicion para buscar un x mayor que el x ingresado
                            index=index+1;                  %Incremento de index
                        else
                            break;                                          %Salida del bucle
                        end                                                 %Fin funcion if
                    end                                                     %Fin funcion for
                    xmax = x(index+1);                                      %Termino acotado superiormente
                    xmin = x(index );                                        %Termino acotado inferiormente
                    xRes1 = abs(xExtra - xmax);                              %Diferencia superior 
                    xRes2 = abs(xExtra - xmin);                              %Diferencia inferior
                    if xRes1 > xRes2                                        %Condicion para seleccionar la cota mayor de error
                        e = xRes1;                                          %Asignacion de cota M epsilon
                    else
                        e = xRes2;                                          %Asignacion de cota M epsilon
                    end                                                     %Fin funcion if
                    e
                    fdd
                    dimFdd = size(fdd);                                      %Asignacion de la dimension de la matriz de diferencias finitas M dimFdd
                    nFdd = dimFdd(2);                                        %Se asigna el valor de n puntos en nFdd
                    Rtx = fdd(1,nFdd)*En;                                    %Define la funcion de error de truncamiento 
                    Rtx = abs(vpa(subs(Rtx,xExtra)))                        %Evalua la funcion en el x ingresado
                    M
                    tvc = toc;
                else
                    disp('x no pertence al intervalo')                       %Mensaje de error
                end                                                          %Fin funcion if
            elseif confirmacion == 2
                bandera = 0;                                                %Reasignación del valor de opcion para salir del bucle
                tvc = toc
                break                                                         %Salida del bucle
            end                                                              %Fin funcion if
        end                                                                  %Fin funcion while
    else 
        disp('Los valores de la matriz de puntos no son reales.')               %Mensaje de error
    end                                                                      %Fin Funcion if
else
    disp('La matriz no es de dimension n*2');                                %Mensaje de error
end                   
hold off
        
    case 1                                                                
        
        
        fprintf('INTERPOLACION "POLINOMIO DE LAGRAGE"\n\n\n');
                                                                            %fprintf me permite ingresar comentarios de manera textual que pueden
                                                                            %orientar al usuario en el uso del programa
xi=input('Ingrese la matriz Ax: ');
yi=input('Ingrese la matriz Ay: ');
                                                                            %input es un comando de solicitud de entrada de datos del usuario.
n=length(xi);
x=sym('x');                                                                 %esta funcion nos permite dejar la variable 'x' como simb�lica
                                                                            % y asi poder trabajar con ella, sin tener que asignarle un valor.
for j=1:n
 producto=1;
 for i=1:j-1
 producto=producto*(x-xi(i));                                               %calculo del producto 1 superior de L
 end
 producto2=1;
 for i=j+1:n
 producto2=producto2*(x-xi(i));                                             %calculo del producto 2 superior de L
 end
 producto3=1;
 for i=1:j-1
 producto3=producto3*(xi(j)-xi(i));                                         %calculo del producto 3 inferior de L
 end
 producto4=1;
 for i=j+1:n
 producto4=producto4*(xi(j)-xi(i));                                         %calculo del producto 4 inferior de L
 end
 L(j)=(producto*producto2)/(producto3*producto4);                           %c�lculos de las L para
 fprintf('\n L%d:\n',j-1)                                                   %poder hallar el polinomio
 disp(L(j))                                                                 %la funci�n dispo nos permite visualizar variables o texto
                                                                            % en el workspace
end
pn=0;
for j=1:n
 pn=pn+L(j)*yi(j);                                                          %calculo del polinomio interpolante
 
 
end
hold on;
grid on;
xlabel('Eje x')
ylabel('Eje y')
fplot(pn,'b');
 plot(xi,yi,'*','MarkerEdgeColor','r','LineWidth',1);
 fprintf('\n POLINOMIO INTERPOLANTE: \n')
                                                                            %disp(pn) % esta ejecucion la podemos utilizar cuando no necesitamos
                                                                            %simplicar la expresion
 disp(pn)
 fprintf('\nPolinomio interpolante simplificado:  \n')
pn = simplify(pn);                                                          %este comando nos permite simplificar toda la expresion
 disp(pn)

 
opc=input('\nDesea aproximar un valor (si/no): ','s');
                                                                            %este comando nos permite saber si el usuario quiere obtener una
                                                                            %aproximacion de un punto dado, en el polinomio que se acaba de obtener
if opc=='si'
x=input('\nIngrese el punto a aproximar: ');
y=eval(pn);                                                                 %evaluar el punto en el polinomio
disp('\nLa aproximacion a f(x) es:')
disp(pn)
end



    case 2      
        
        fprintf('INTERPOLACION "POLINIMIO SPLINE CUBICO"\n\n\n');
                                                                            %fprintf me permite ingresar comentarios de manera textual que pueden
                                                                            %orientar al usuario en el uso del programa
X=input('Ingrese la matriz A: ');

        
        
        
      n=length(X(1,:));
for i=1:n
    a(i)=X(2,i);
    disp(a(i))
end
for i=1:n-1
    h(i)=X(1,i+1)-X(1,i);
end
for i=2:n-1
    alfa(i)=3/h(i)*(a(i+1)-a(i))-3/h(i-1)*(a(i)-a(i-1));
end
l(1)=1;
mu(1)=0;
z(1)=0;
for i=2:n-1
    l(i)=2*(X(1,i+1)-X(1,i-1))-h(i-1)*mu(i-1);
    mu(i)=h(i)/l(i);
    z(i)=(alfa(i)-h(i-1)*z(i-1))/l(i);
end
l(n)=1;
z(n)=0;
c(n)=0;
for i=n-1:-1:1
    c(i)=z(i)-mu(i)*c(i+1);
    b(i)=(a(i+1)-a(i))/h(i)-h(i)*(c(i+1)+2*c(i))/3;
    d(i)=(c(i+1)-c(i))/(3*h(i));
    
end



for i=1:n-1
    x=X(1,i):0.1:X(1,i+1);
    y=a(i)+b(i)*(x-X(1,i))+c(i)*(x-X(1,i)).^2+d(i)*(x-X(1,i)).^3;
    hold on;
    plot(x,y,'b');
    
end
for i=1:n
    hold on
    plot(X(1,i),X(2,i),'*','MarkerEdgeColor','r','LineWidth',1);
    title('Interpolacion por splines cubicos')
end
 

    otherwise
        disp('Ingrese un numero Valido')
end
