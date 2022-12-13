%% ENCABEZADO
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
% Autor:    Paul Escobar                                            %
% Examen I PARCIAL                                                                  %
%                                                                   %
% METODOS NUMERICOS                                                         %
%           
% Fecha:	02 de Junio del 2022                                          %
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % % 
function [varargout]=ptaylor(varargin)                                      %Prototipo de la funcion
    disp('                UNIVERSIDAD DE LAS FUERZAS ARMADAS       ');      %Salida de texto - Encabezado   
    disp('                           ESPE'                          );
    disp('                     Métodos Numéricos'                   );      %Salida de texto - Clase
    disp('                      Serie de Taylor'                    );      %Salida de texto Tema
    disp('                        Grupo N° 01'                      );
syms x;                                                                     %Variable x simbolica
aux = 10;                                                                   %Numero de derivadas -Validacion de funcion trascendental
xlength = 7;                                                                %longitud del dibujo en eje x
ylength = 7;                                                                %longitud del dibujo en eje y
xpos= 6;                                                                    %posicion de inicio en eje x
ypos= 0;                                                                    %posicion de inicio en eje y
xp= -10:0.1:10;                                                             %discretizacion para dibujar
fp= subs(cell2sym(varargin(1)),xp);                                         %evaluar los puntos definidos de f
if nargin == 2                                                              %Validacion de dos argumentos
    tic                                                                     %Inicializacion del tiempo
    fx=cell2sym(varargin(1));                                               %se transforma de un string a forma simbolica
    n=cell2mat(varargin(2));                                                %Asignacion del segundo argumento
    if diff(fx,aux) ~= 0                                                    %Verificacion de la funcion trascendental
        if n-round(n) == 0 && n > 0                                         %Verificacion si n es entero positivo
            syms x0;                                                        %Variable representada forma simbolica
            px = 0;                                                         % Inicializacion de funcion de Taylor
            auxpx = 0;                                                      %Auxiliar de funcion de Taylor
            for i=0:n                                                       %For que realiza la representacion de Taylor
                auxpx = (diff(fx,i)*(x-x0)^i)/factorial(i);                 %Operacion de Taylor
                px = px + auxpx;                                            %Guardamos los resultados de la linea anterior
            end
        else
            disp('n no es un entero mayor a cero')
        end
        syms epsilon;                                                       %Epsilon como variable simbolica
        df=diff(fx,n+1);                                                    %Derivacion de la funcion n veces + 1
        df=subs(df,x,epsilon)                                             %Evalua la funcion en epsilon
        R_n(x) = (df*(x-x0)^(n+1))/factorial(n+1);                             % se obtiene el error residual
        
        plot(xp,fp);                                                        %dibujar
        grid;
        title('Serie de Taylor/Mclaurin');
        legend({'Funcion fx = exp(cos(x))'},'Location','southwest');
        xlabel('Eje X');
        ylabel('Eje Y');
        
        axis([xpos,xpos+xlength,ypos,ypos+ylength]);                        %fijar el rango de los ejes
        tcv=toc;
        
        
    else
        disp('funcion no trascendental')
    end
elseif nargin ==3                                                           %validacion de 3 argumentos
    tic
    c = cell2mat(varargin(3));                                              %Asignacion del punto que se va a evaluar
    if isreal(c)==1
        syms ts;                                                            %Se declara ts como variable simbolica
        fx=cell2sym(varargin(1));                                           %se transforma un string a forma simbolica
        n=cell2mat(varargin(2));                                            %Asignacion del segundo argumento
        t=(c-(xlength/2)):0.1:(c+(xlength/2));                              %grilla centrada en c
        px2 = 0;                                                            %Inicializa la variable px2
        pxaux2 = 0;                                                         %Inicializacion de la variable pxaux2
        px = 0;                                                             %Inicializacion de la variable px
        pxaux2s = 0;                                                        %Inicializacion de la variable pxaux2s
        for i =0:n
            pxaux2 = (subs(diff(fx,i),c).*(t-c).^i)./factorial(i);          %Operacion de Taylor
            px2 = px2 + pxaux2;                                             %Se realiza la sumatoria de Taylor
            caux= double(subs(diff(fx,x,i),c)/factorial(i));                %polinomio de Taylor
            pxaux2s = caux*(x-c)^i;                                         %Operacion de Taylor
            px = px + pxaux2s;                                              %Suma de variables
        end
        plot(t,px2);                                                        %Grafica de las funciones
        grid;
        title('Serie de Taylor/Mclaurin');
        legend({'Funcion fx = exp(cos(x))'},'Location','southwest');
        xlabel('Eje X');
        ylabel('Eje Y');
        hold on;
        plot(xp,fp);                                                        %Grafica de funciones
        axis([c-(xlength/2),c+(xlength/2),double(subs(px,c))-(ylength/2),double(subs(px,c))+(ylength/2)]); %Fijar el rango de los ejes alrededor de c
        text(c,double(subs(fx,x,c)),'(c;f(c))');                            %Fijar el punto de interes en la grafica
        er=0;                                                               %Inicializacion de varibales
        eR=0;                                                               %Inicializacion de variables
        erx = c;                                                            %Valor de c aumentado en 2 
        eRx = c;                                                            %Valor de c disminuido en 2 
        while er < 0.005
            erx = erx + 0.001;                                              %Contador para radio menor
            er = abs((double(subs(px,erx))-double(subs(fx,erx)))/double(subs(fx,erx))); %Controla valores del error
            r = abs(erx - c);                                               %Asignación de valor para el radio r
        end
        while eR < 0.8
            eRx = eRx + 0.001;                                              %Contador para radio mayor
            eR = abs((double(subs(px,eRx))-double(subs(fx,eRx)))/double(subs(fx,eRx))); %Controla valores del error
            R = abs(eRx - c);                                               %Asignación de valor para el radio R
            
        end
        syms epsilon;
        df=diff(fx,n+1);                                                    %Derivacion de la funcion fx
        df=subs(df,x,epsilon)                                          %Evaluacion de la funcion en epsilon
        R_n(x) = (df*(x-c)^(n+1))/factorial(n+1);                              %error relativo en funcion de epsilon y x
        viscircles([c double(subs(fx,x,c))],r)                              %Grafico del radio menor de convergencia
        viscircles([c double(subs(fx,x,c))],R)                              %Grafico del radio mayor de convergencia
        tcv =toc
        
    end
elseif nargin == 4
    tic                                                                     %Inicializacion del tiempo
    fx=cell2sym(varargin(1));                                               %Transformar un string a forma simbolica
    n = cell2mat(varargin(2));                                              %Asignacion del segundo argumento
    c = cell2mat(varargin(3));                                              %Asignacion del tercer argumento (punto a evaluar)
    e = cell2mat(varargin(4));                                              %Asignacion del cuarto argumento (epsilon)
    t=(c-(xlength/2)):0.1:(c+(xlength/2));                                  %matriz centrada en c
    if diff(fx,aux) ~= 0                                                    %Verificacion de la funcion trascendental
        if n-round(n) == 0 && n > 0                                         %Verificacion si n es entero positivo
            if isreal(c)==1
                if isreal(e)==1
                    syms ts;                                                %Se declara ts como simbolica
                    px = 0;                                                 % Inicializacion de funcion de Taylor
                    px2 = 0;                                                % Inicializacion de funcion de Taylor
                    auxpx = 0;                                              %Aux de funcion de Taylor
                    for i = 0:n                                             %For que realiza la serie de Taylor
                        pxaux2 = (subs(diff(fx,i),c).*(t-c).^i)./factorial(i); %Operacion de Taylor
                        px2 = px2 + pxaux2;
                        caux= double(subs(diff(fx,x,i),c)/factorial(i));    %Forma del polinomio de Taylor
                        pxaux2s = caux*(x-c)^i;                             %Operacion de Taylor
                        px = px + pxaux2s;                                  %Suma de variables
                    end
                end
                plot(t,px2);                                                %Grafica de las funciones
                grid;
                title('Serie de Taylor/Mclaurin');
                legend({'Funcion fx = exp(cos(x))'},'Location','southwest');
                xlabel('Eje X');
                ylabel('Eje Y');
                hold on;
                plot(xp,fp);                                                %Grafica de funciones
                axis([c-(xlength/2),c+(xlength/2),double(subs(px,c))-(ylength/2),double(subs(px,c))+(ylength/2)]); %Fijar el rango de los ejes alrededor de c
                text(c,double(subs(fx,x,c)),'(c;f(c))');                    %Fijar el punto de interes en la grafica
                er=0;                                                       %Inicializacion y especificacion de varibales
                eR=0;                                                       %Inicializacion y especificacion de variables
                erx = c;                                                    %Valor de c aumentado en 2 unidades
                eRx = c;                                                    %Valor de c disminuido en 2 unidades
                while er < 0.005
                    erx = erx + 0.001;                                      %Contador para radio menor
                    er = abs((double(subs(px,erx))-double(subs(fx,erx)))/double(subs(fx,erx))); %Controla valores del error
                    r = abs(erx - c);                                       %Asignación de valor para el radio r
                end
                while eR < 0.8
                    eRx = eRx + 0.001;                                      %Contador para radio mayor
                    eR = abs((double(subs(px,eRx))-double(subs(fx,eRx)))/double(subs(fx,eRx))); %Controla valores del error
                    R = abs(eRx - c);                                       %Asignación de valor para el radio R
                end
            else
                disp('c no es real');
            end
        else
            disp('n no es entero o positivo')
        end
        df = diff(fx,n+1);                                                  %Derivacion de la funcion n veces + 1
        df = subs(df,x,e);                                                  %Evalua la funcion en epsilon
        R_n(x) = (df*(x-c)^(n+1))/factorial(n+1);                              %Obtener el error residual
        
        plot(xp,fp);                                                        %Plotear las funciones
        axis([xpos,xpos+xlength,ypos,ypos+ylength]);                        %Fijar el rango de los ejes
        viscircles([c double(subs(fx,x,c))],r)                              %Grafico del radio menor de convergencia
        viscircles([c double(subs(fx,x,c))],R)                              %Grafico del radio mayor de convergencia
        tcv =toc
    else
        disp('La funcion no es trascendental')
    end
elseif nargin == 5
    tic                                                                     %Inicializacion del tiempo
    fx=cell2sym(varargin(1));                                               %transformo la funcion de string a simbolica
    n = cell2mat(varargin(2));                                              %Asignacion del segundo argumento
    c = cell2mat(varargin(3));                                              %Asignacion del tercer argumento (punto a evaluar)
    e = cell2mat(varargin(4));                                              %Asignacion del cuarto argumento (epsilon)
    t=(c-(xlength/2)):0.1:(c+(xlength/2));                                  %matriz centrada en c
    N = cell2mat(varargin(5));                                              %Especificacion del quinto argumento (n aumentada N veces)
    if diff(fx,aux) ~= 0                                                    %Verificacion de la funcion trascendental
        if n-round(n) == 0 && n > 0                                         %Verificacion si n ees mayor a cero
            if isreal(c)==1
                if isreal(e)==1
                    if N-round(N) == 0 && N > 0
                        px = 0;                                             % Arranque de la funcion de Taylor
                        px2 = 0;                                            % Arranque de la funcion de Taylor
                        auxpx = 0;                                          %Auxiliar de la funcion de Taylor
                        for i = 0:n                                         %For que realiza las operaciones para Taylor
                            pxaux2 = (subs(diff(fx,i),c).*(t-c).^i)./factorial(i); %Calculo de Taylor
                            px2 = px2 + pxaux2;
                            caux= double(subs(diff(fx,x,i),c)/factorial(i)); %Forma del polinomio de Taylor
                            pxaux2s = caux*(x-c)^i;                         %Calculo de Taylor
                            px = px + pxaux2s;                              %Incremento de las sumas de Taylor
                        end
                 plot(t,px2);                                               %Grafico de las funciones
                grid;
                title('Serie de Taylor/Mclaurin');
                legend({'Funcion fx = exp(cos(x))'},'Location','southwest');
                xlabel('Eje X');
                ylabel('Eje Y');
                hold on;
                plot(xp,fp);                                                %Grafico de funciones              
                axis([c-(xlength/2),c+(xlength/2),double(subs(px,c))-(ylength/2),double(subs(px,c))+(ylength/2)]); %Fijar el rango de los ejes alrededor de c
                text(c,double(subs(fx,x,c)),'(c;f(c))');                    %Fijar el punto de interes en la grafica
                er=0;                                                       %Arranque de varibales
                eR=0;                                                       %Arranque de variables
                erx = c;                                                    %Valor de c incrementado en 2 unidades
                eRx = c;                                                    %Valor de c decrementado en 2 unidades
                while er < 0.005
                    erx = erx + 0.001;                                      %Contador para radio menor
                    er = abs((double(subs(px,erx))-double(subs(fx,erx)))/double(subs(fx,erx))); %Controla valores del error
                    r = abs(erx - c);                                       %Valor para el radio con la variable r
                end
                while eR < 0.8
                    eRx = eRx + 0.001;                                      %Contador para radio mayor
                    eR = abs((double(subs(px,eRx))-double(subs(fx,eRx)))/double(subs(fx,eRx))); %Controla valores del error
                    R = abs(eRx - c);                                       %Valor para el radio R
                end
                else
        disp('El valor asignado a N no es entero')
    end
                else
        disp('El valor asignado en e no es real')
    end
                else
            disp('La funcion que se ingreso no corresponde a una funcion trascendental')
        end
        else
        disp('El valor asignado a n no es entero o mayor a 0')
    end
        df = diff(fx,n+1);                                                  %Derivacion de la funcion n veces + 1
        df = subs(df,x,e);                                                  %Evalua la funcion en epsilon
        R_n(x) = (df*(x-c)^(n+N))/factorial(n+N);                              %Error residual  
        plot(xp,fp);                                                        %Graficar las funciones 
        axis([xpos,xpos+xlength,ypos,ypos+ylength]);                        %Plantear el rango de los ejes
        viscircles([c double(subs(fx,x,c))],r)                              %Grafico del radio menor de convergencia
        viscircles([c double(subs(fx,x,c))],R)                              %Grafico del radio mayor de convergencia
        tcv =toc
    else
        disp('La funcion que ingresaste no es trascendental')
    end
elseif nargin == 6
    tic                                                                     %Arranque del tiempo
    fx=cell2sym(varargin(1));                                               %Transformación de la funcion de string a caracteristico
    n = cell2mat(varargin(2));                                              %Asignacion para el segundo argumento
    c = cell2mat(varargin(3));                                              %Asignacion para el tercer argumento (punto de evaluación)
    e = cell2mat(varargin(4));                                              %Asignacion del cuarto argumento (epsilon)
    t=(c-(xlength/2)):0.1:(c+(xlength/2));                                  %Matriz centrada en c
    N = cell2mat(varargin(5));                                              %Asignacion del quinto argumento (n aumentada N veces)
   pto = cell2mat(varargin(6));                                             %Sexto argumento, "pto" --> punto en el que se evalua la función
    if diff(fx,aux) ~= 0                                                    %Condicionante para verificar si es una función trascendental
        if n-round(n) == 0 && n > 0                                         %Validación: si n > 0
            if isreal(c)==1
                 if isreal(e)==1
                    if N-round(N) == 0 && N > 0
                        px = 0;                                             % Inicialización de función de Taylor en 0
                        px2 = 0;                                            % Inicialización de función de Taylor en 0
                        auxpx = 0;                                          %Auxiliar de funcion de Taylor
                        for i = 0:n                                         %Iteración que realiza la representacion de Taylor
                            pxaux2 = (subs(diff(fx,i),c).*(t-c).^i)./factorial(i); %Formula de serie de Taylor
                            px2 = px2 + pxaux2;
                            caux= double(subs(diff(fx,x,i),c)/factorial(i)); %Polinomio de Taylor
                            pxaux2s = caux*(x-c)^i;                         %Operacion de Taylor
                            px = px + pxaux2s;                              %Suma de variables
                        end
                  
                plot(t,px2);                                                %Graficación de funciones
                grid;
                title('Serie de Taylor/Mclaurin');
                legend({'Funcion fx = exp(cos(x))'},'Location','southwest');
                xlabel('Eje X');
                ylabel('Eje Y');
                hold on;
                plot(xp,fp);                                                %Graficación de funciones
                axis([c-(xlength/2),c+(xlength/2),double(subs(px,c))-(ylength/2),double(subs(px,c))+(ylength/2)]); %Determinar el rango de los ejes alrededor de c
                text(c,double(subs(fx,x,c)),'(c;f(c))');                    %Determinar el punto de interes en la grafica
                er=0;                                                       %Inicializacion de varibales
                eR=0;                                                       %Inicializacion de variables
                erx = c;                                                    %Valor de c incrementando en 2
                eRx = c;                                                    %Valor de c disminuido en 2 
                while er < 0.005
                    erx = erx + 0.001;                                      %Contador para radio menor
                    er = abs((double(subs(px,erx))-double(subs(fx,erx)))/double(subs(fx,erx))); %Controlador de valores del error
                    r = abs(erx - c);                                       %Determinar el valor para el radio r
                end
                while eR < 0.8
                    eRx = eRx + 0.001;                                      %Contador de radio mayor
                    eR = abs((double(subs(px,eRx))-double(subs(fx,eRx)))/double(subs(fx,eRx))); %Controlador valores del error
                    R = abs(eRx - c);                                       %Determinar el valor para el radio R
                end
            else
        disp('N no es entero')
    end
                else
        disp('e no es real')
    end
                else
            disp('La funcion no es trascendental')
        end
        else
        disp('n no es entero o positivo')
    end
    pxy = subs(px,x,pto);                                                   %Evaluación de la función de Taylor en un valor de x
    fy = subs(fx,x,pto);                                                    % Evalucación de la funcion original en un valor de x
    df = diff(fx,n+1);                                                      %Derivada de la funcion n veces + 1
    df = subs(df,x,e);                                                      %Evalua la función en epsilon
    R_n(x) = (df*(pto-c)^(n+N))/factorial(n+N);                                %Obtener el error residual  
    Ea = fy - pxy;                                                          %Calculo del error absoluto
    Er = Ea/fy;                                                             %Calculo del error relativo
    plot(xp,fp);                                                            %Graficación de las funciones 
    axis([xpos,xpos+xlength,ypos,ypos+ylength]);                            %Fijar el rango de los ejes
    viscircles([c double(subs(fx,x,c))],r)                                  %Grafico del radio menor de convergencia
    viscircles([c double(subs(fx,x,c))],R)                                  %Grafico del radio mayor de convergencia
    tcv =toc
    else
        disp('La funcion no es trascendental')
    end
end
if nargout==4
        varargout{1}= fx;
        varargout{2}= n;
        varargout{3}= px;
        varargout{4}= R_n(x);
elseif nargout==7
        varargout{1}= fx;
        varargout{2}= n;
        varargout{3}= px;
        varargout{4}= R_n(x);
        varargout{5}= c;
        varargout{6}= R;
        varargout{7}= r;
elseif nargout == 8
        varargout{1}= fx;
        varargout{2}= n;
        varargout{3}= px;
        varargout{4}= R_n(x);
        varargout{5}= c;
        varargout{6}= R;
        varargout{7}= r;
        varargout{8}= e;
elseif nargout == 9
        varargout{1}= fx;
        varargout{2}= n;
        varargout{3}= px;
        varargout{4}= R_n(x);
        varargout{5}= c;
        varargout{6}= R;
        varargout{7}= r;
        varargout{8}= e;
        varargout{9}= N;
elseif nargout == 11
        varargout{1}= fx;
        varargout{2}= n;
        varargout{3}= px;
        varargout{4}= R_n(x);
        varargout{5}= c;
        varargout{6}= R;
        varargout{7}= r;
        varargout{8}= e;
        varargout{9}= N;
        varargout{10}= Ea;
        varargout{11}= Er;
end
end