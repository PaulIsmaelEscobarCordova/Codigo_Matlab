%UNIVERSIDAD DE LAS FUERZAS ARMADAS ESPE
%GRUPO N°1
%FUNCION FAC

function [T,T2] = fac(varargin)
if nargin == 1%Comparar los valores de entrada
    tic%inicia el tictoc
M = cell2mat(varargin(1));%se asigna a M la matriz de puntos
sizeM = size(M);    %tamaño de la matriz
    if sizeM(2) == 2    %se comparan las columnas de la matriz
    sumatoriaX = sum(M(:,1));   %sumatoria de x
    sumatoriaY = sum(M(:,2));   %sumatoria de y
    sumatoriaXY = sum(M(:,1).*M(:,2));  %sumatoria de xy
    sumatoriaX2 = sum(M(:,1).^2);       %sumatoria de xx
    sumatoriaY2 = sum(M(:,2).^2);       %sumatoria de yy
    n = sizeM(1);   %cantidad de datos
    xMedia = sumatoriaX/n;      %promedio de x
    yMedia = sumatoriaY/n;      %promedio de y
    a1 = (n*sumatoriaXY-sumatoriaX*sumatoriaY)/(n*sumatoriaX2-sumatoriaX^2);%coeficiente a1
    a0 = yMedia-a1*xMedia;  %coeficiente a0
    y = a0 + a1*M(:,1);     %calculo los valores de y evaluados en los valores independientes de entrada
    plot(M(:,1),M(:,2),'dk')%dibujo los puntos
    hold on%sobredibujo
    plot(M(:,1),y,'r--')    %dibujo la regresion lineal
    grid on%enciende la grilla
    xlabel('Eje x')%etiqueto el eje x
    ylabel('Eje y')%etiqueto el eje y
    title('Regresion lineal')   %etiqueto la imagen
    legend('Puntos', 'Linea de ajuste') %descripcion de la imagen
    r = (n*sumatoriaXY-sumatoriaX*sumatoriaY)/(sqrt(n*sumatoriaX2-sumatoriaX^2)*sqrt(n*sumatoriaY2-sumatoriaY^2));%calcular coeficiente de correlacion
    syms x;%declaro variable simbolica
    y1 = a0 + a1*x; %inicializo funcion lineal de la regresion
    Ea = 0;     %inicializo error absoluto
    Er = 0;     %inicializo error relativo
    MatrizYReal = 0;    %inicializo de la matriz 
    for i = 1:sizeM(1)  %contador de uno hasta el numero de datos
        yReal = subs(y1,M(i,1));    %evaluo los puntos x de entrada en la funcion
        Ea(i) = abs(yReal-M(i,2));  %calculo el error absoluto de cada y
        Er(i) = (Ea(i)/yReal)*100;  %calculo el error relativo de cada y
        MatrizYReal(i) = yReal;     %guardo los valores reales de y real
    end
    Er = Er';   %transpuesta de los errores relativos
    Ea = Ea';   %transpuesta de los errores absolutos
    YReal = MatrizYReal';   %transpuesta de los valores reales de y
    x = M(:,1);     %asigno los valores experimentales a x
    y = M(:,2);     %asigno los valores experimentales a y
    T = table(x,y,YReal,Ea,Er);  %crear tabla
    tcv = toc;%finalizo reloj
    T2 = table(r,tcv) %crear tabla 2
        
    else
        disp('Dimension incorrecta de la matriz.')%envio mensaje de error
    end
elseif nargin ==2;%segunda entrada
    M = cell2mat(varargin(1));%se asigna a M la matriz de puntos
    m = cell2mat(varargin(2));%se asigna a m el numero para seleccionar el metodo de ajuste
    sizeM = size(M);    %tamaño de la matriz
    tic%inicia el tictoc
    if sizeM(2) == 2%se comparan las columnas de la matriz
        if m>=0 && m<=3 && abs(round(m) -m) == 0
            if m == 1
                sumatoriaX = sum(M(:,1));   %sumatoria de x
                sumatoriaY = sum(M(:,2));   %sumatoria de y
                sumatoriaXY = sum(M(:,1).*M(:,2));  %sumatoria de xy
                sumatoriaX2Y = sum((M(:,1).^2).*M(:,2));       %sumatoria de x2y
                sumatoriaX2 = sum(M(:,1).^2);       %sumatoria de xx
                sumatoriaX3 = sum(M(:,1).^3);       %sumatoria de xxx
                sumatoriaX4 = sum(M(:,1).^4);       %sumatoria de xxxx
                sumatoriaY2 = sum(M(:,2).^2);       %sumatoria de yy
                n = sizeM(1);   %cantidad de datos
                xMedia = sumatoriaX/n;      %promedio de x
                yMedia = sumatoriaY/n;      %promedio de y
                matCoeficientes = zeros(3,3);%inicializo matriz de coeficientes
                vectorB= zeros(3,1);        %inicializo vector de valores independientes
                matCoeficientes(1,1)= n;    %asigno numero de puntos
                matCoeficientes(1,2)= sumatoriaX;   %asigno sumatoria de x
                matCoeficientes(1,3)= sumatoriaX2;  %asigno sumatoria de xx
                matCoeficientes(2,1)= sumatoriaX;   %asigno sumatoria de x
                matCoeficientes(2,2)= sumatoriaX2;  %asigno sumatoria de xx
                matCoeficientes(2,3)= sumatoriaX3;  %asigno sumatoria de xxx
                matCoeficientes(3,1)= sumatoriaX2;  %asigno sumatoria de xx
                matCoeficientes(3,2)= sumatoriaX3;  %asigno sumatoria de xxx
                matCoeficientes(3,3)= sumatoriaX4;  %asigno sumatoria de xxxx
                vectorB(1) = sumatoriaY;    %asigno sumatoria de y
                vectorB(2) = sumatoriaXY;   %asigno sumatoria de xy
                vectorB(3) = sumatoriaX2Y;  %asigno sumatoria de xxy
                coefsR= matCoeficientes\vectorB;%calculo los coeficientes
                a0 = coefsR(1);%guardo valor del coeficiente
                a1 = coefsR(2);%guardo valor del coeficiente
                a2 = coefsR(3);%guardo valor del coeficiente
                y = a0 + a1*M(:,1) + a2*(M(:,1)).^2;     %calculo los valores de y evaluados en los valores independientes de entrada
                plot(M(:,1),M(:,2),'dk')%dibujo los puntos
                hold on%sobredibujo
                plot(M(:,1),y,'r--')    %dibujo la regresion de la curva
                grid on%enciende la grilla
                xlabel('Eje x')%etiqueto el eje x
                ylabel('Eje y')%etiqueto el eje y
                title('Regresion cuadratica')   %etiqueto la imagen
                legend('Puntos', 'Curva de ajuste') %descripcion de la imagen
                syms x;%declaro variable simbolica
                y1 = a0 + a1*x + a2*x^2; %inicializo funcion lineal de la regresion
                Ea = 0;     %inicializo error absoluto
                Er = 0;     %inicializo error relativo
                MatrizYReal = 0;    %inicializo de la matriz
                for i = 1:sizeM(1)  %contador de uno hasta el numero de datos
                    yReal = subs(y1,M(i,1));    %evaluo los puntos x de entrada en la funcion
                    Ea(i) = abs(yReal-M(i,2));  %calculo el error absoluto de cada y
                    Er(i) = (Ea(i)/yReal)*100;  %calculo el error relativo de cada y
                    MatrizYReal(i) = yReal;     %guardo los valores reales de y real
                end
                Er = Er';   %transpuesta de los errores relativos
                Ea = Ea';   %transpuesta de los errores absolutos
                YReal = MatrizYReal';   %transpuesta de los valores reales de y
                x = M(:,1);     %asigno los valores experimentales a x
                y = M(:,2);     %asigno los valores experimentales a y
                T = table(x,y,YReal,Ea,Er);  %crear tabla
                disp('Matriz de coeficientes: ');%etiqueta de matriz
                matCoeficientes         %imprime matriz de coeficientes
                disp('Vector de incognitas: ');%etiqueta de incognitas
                disp('a0');%imprimo coeficiente a0  
                disp('a1');%imprimo coeficiente a1
                disp('a2');%imprimo coeficiente a2
                disp(''); %imprimo salto de fila
                disp('Vector de terminos independientes');%imprimo etiqueta de terminos independientes
                vectorB%imprimo vector de terminos indendientes
                disp('Ecuacion de la aproximacion cuadratica');%etiqueta
                Ecuacion = vpa(y1) %Ecuacion de regresion
                tcv = toc;%finalizo reloj
                T2 = table(tcv);  %crear tabla 2
            elseif m == 0
                sumatoriaX = sum(M(:,1));   %sumatoria de x
                sumatoriaY = sum(M(:,2));   %sumatoria de y
                sumatoriaXY = sum(M(:,1).*M(:,2));  %sumatoria de xy
                sumatoriaX2 = sum(M(:,1).^2);       %sumatoria de xx
                sumatoriaY2 = sum(M(:,2).^2);       %sumatoria de yy
                n = sizeM(1);   %cantidad de datos
                xMedia = sumatoriaX/n;      %promedio de x
                yMedia = sumatoriaY/n;      %promedio de y
                a1 = (n*sumatoriaXY-sumatoriaX*sumatoriaY)/(n*sumatoriaX2-sumatoriaX^2);%coeficiente a1
                a0 = yMedia-a1*xMedia;  %coeficiente a0
                y = a0 + a1*M(:,1);     %calculo los valores de y evaluados en los valores independientes de entrada
                plot(M(:,1),M(:,2),'dk')%dibujo los puntos
                hold on%sobredibujo
                plot(M(:,1),y,'r--')    %dibujo la regresion lineal
                grid on%enciende la grilla
                xlabel('Eje x')%etiqueto el eje x
                ylabel('Eje y')%etiqueto el eje y
                title('Regresion lineal')   %etiqueto la imagen
                legend('Puntos', 'Linea de ajuste') %descripcion de la imagen
                r = (n*sumatoriaXY-sumatoriaX*sumatoriaY)/(sqrt(n*sumatoriaX2-sumatoriaX^2)*sqrt(n*sumatoriaY2-sumatoriaY^2));%calcular coeficiente de correlacion
                syms x;%declaro variable simbolica
                y1 = a0 + a1*x; %inicializo funcion lineal de la regresion
                Ea = 0;     %inicializo error absoluto
                Er = 0;     %inicializo error relativo
                MatrizYReal = 0;    %inicializo de la matriz
                for i = 1:sizeM(1)  %contador de uno hasta el numero de datos
                    yReal = subs(y1,M(i,1));    %evaluo los puntos x de entrada en la funcion
                    Ea(i) = abs(yReal-M(i,2));  %calculo el error absoluto de cada y
                    Er(i) = (Ea(i)/yReal)*100;  %calculo el error relativo de cada y
                    MatrizYReal(i) = yReal;     %guardo los valores reales de y real
                end
                Er = Er';   %transpuesta de los errores relativos
                Ea = Ea';   %transpuesta de los errores absolutos
                YReal = MatrizYReal';   %transpuesta de los valores reales de y
                x = M(:,1);     %asigno los valores experimentales a x
                y = M(:,2);     %asigno los valores experimentales a y
                T = table(x,y,YReal,Ea,Er);  %crear tabla
                disp('Matriz de coeficientes: ');%etiqueta de matriz
                matCoeficientes = zeros(2,2);%inicializo la matriz de coeficientes
                matCoeficientes(1,1) = n;%asigno el valor de la fila 1 columna 1
                matCoeficientes(1,2) = sumatoriaX;%asigno el valor de la fila 1 columna 2
                matCoeficientes(2,1) = sumatoriaX;%asigno el valor de la fila 2 columna 1
                matCoeficientes(2,2) = sumatoriaX2;%asigno el valor de la fila 2 columna 2
                matCoeficientes         %imprime matriz de coeficientes
                disp('Vector de incognitas: ');%etiqueta de incognitas
                disp('a0');%imprimo coeficiente a0  
                disp('a1');%imprimo coeficiente a1
                disp(''); %imprimo salto de fila
                disp('Vector de terminos independientes');%imprimo etiqueta de terminos independientes
                vectorB = zeros(2,1);%inicializo vector de terminos independientes
                vectorB(1,1)= sumatoriaY;%asigno primer valor
                vectorB(2,1)= sumatoriaXY;%asigno segundo valor
                vectorB%imprimo vector de terminos indendientes
                disp('Ecuacion de la aproximacion lineal');%etiqueta
                Ecuacion = vpa(y1) %Ecuacion de regresion
                tcv = toc;%finalizo reloj
                T2 = table(tcv);  %crear tabla 2
            elseif m == 2
                sumatoriaX = sum(M(:,1));   %sumatoria de x
                sumatoriaY = sum(M(:,2));   %sumatoria de y
                sumatoriaXY = sum(M(:,1).*M(:,2));  %sumatoria de xy
                sumatoriaX2Y = sum((M(:,1).^2).*M(:,2));       %sumatoria de x2y
                sumatoriaX3Y = sum((M(:,1).^3).*M(:,2));       %sumatoria de x2y
                sumatoriaX2 = sum(M(:,1).^2);       %sumatoria de xx
                sumatoriaX3 = sum(M(:,1).^3);       %sumatoria de xxx
                sumatoriaX4 = sum(M(:,1).^4);       %sumatoria de xxxx
                sumatoriaX5 = sum(M(:,1).^5);       %sumatoria de xxxx
                sumatoriaX6 = sum(M(:,1).^6);       %sumatoria de xxxx
                sumatoriaY2 = sum(M(:,2).^2);       %sumatoria de yy
                n = sizeM(1);   %cantidad de datos
                xMedia = sumatoriaX/n;      %promedio de x
                yMedia = sumatoriaY/n;      %promedio de y
                matCoeficientes = zeros(4,4);%inicializo matriz de coeficientes
                vectorB= zeros(4,1);        %inicializo vector de valores independientes
                matCoeficientes(1,1)= n;    %asigno numero de puntos
                matCoeficientes(1,2)= sumatoriaX;   %asigno sumatoria de x
                matCoeficientes(1,3)= sumatoriaX2;  %asigno sumatoria de xx
                matCoeficientes(1,4)= sumatoriaX3;  %asigno sumatoria de xxx
                matCoeficientes(2,1)= sumatoriaX;   %asigno sumatoria de x
                matCoeficientes(2,2)= sumatoriaX2;  %asigno sumatoria de xx
                matCoeficientes(2,3)= sumatoriaX3;  %asigno sumatoria de xxx
                matCoeficientes(2,4)= sumatoriaX4;  %asigno sumatoria de xxxx
                matCoeficientes(3,1)= sumatoriaX2;  %asigno sumatoria de xx
                matCoeficientes(3,2)= sumatoriaX3;  %asigno sumatoria de xxx
                matCoeficientes(3,3)= sumatoriaX4;  %asigno sumatoria de xxxx
                matCoeficientes(3,4)= sumatoriaX5;  %asigno sumatoria de xxxxx
                matCoeficientes(4,1)= sumatoriaX3;  %asigno sumatoria de xx
                matCoeficientes(4,2)= sumatoriaX4;  %asigno sumatoria de xxx
                matCoeficientes(4,3)= sumatoriaX5;  %asigno sumatoria de xxxx
                matCoeficientes(4,4)= sumatoriaX6;  %asigno sumatoria de xxxxx
                vectorB(1) = sumatoriaY;    %asigno sumatoria de y
                vectorB(2) = sumatoriaXY;   %asigno sumatoria de xy
                vectorB(3) = sumatoriaX2Y;  %asigno sumatoria de xxy
                vectorB(4) = sumatoriaX3Y;  %asigno sumatoria de xxy
                coefsR= matCoeficientes\vectorB;%calculo los coeficientes
                a0 = coefsR(1);%guardo valor del coeficiente
                a1 = coefsR(2);%guardo valor del coeficiente
                a2 = coefsR(3);%guardo valor del coeficiente
                a3 = coefsR(4);%guardo valor del coeficiente
                y = a0 + a1*M(:,1) + a2*(M(:,1)).^2 + a3*(M(:,1)).^3;     %calculo los valores de y evaluados en los valores independientes de entrada
                plot(M(:,1),M(:,2),'dk')%dibujo los puntos
                hold on%sobredibujo                
                plot(M(:,1),y,'r--')    %dibujo la regresion de la curva
                grid on%enciende la grilla
                xlabel('Eje x')%etiqueto el eje x
                ylabel('Eje y')%etiqueto el eje y
                title('Regresion cubica')   %etiqueto la imagen
                legend('Puntos', 'Curva de ajuste') %descripcion de la imagen
                syms x;%declaro variable simbolica
                y1 = a0 + a1*x + a2*x^2 + a3*x^3; %inicializo funcion lineal de la regresion
                Ea = 0;     %inicializo error absoluto
                Er = 0;     %inicializo error relativo
                MatrizYReal = 0;    %inicializo de la matriz
                for i = 1:sizeM(1)  %contador de uno hasta el numero de datos
                    yReal = subs(y1,M(i,1));    %evaluo los puntos x de entrada en la funcion
                    Ea(i) = abs(yReal-M(i,2));  %calculo el error absoluto de cada y
                    Er(i) = (Ea(i)/yReal)*100;  %calculo el error relativo de cada y
                    MatrizYReal(i) = yReal;     %guardo los valores reales de y real
                end
                Er = Er';   %transpuesta de los errores relativos
                Ea = Ea';   %transpuesta de los errores absolutos
                YReal = MatrizYReal';   %transpuesta de los valores reales de y
                x = M(:,1);     %asigno los valores experimentales a x
                y = M(:,2);     %asigno los valores experimentales a y
                T = table(x,y,YReal,Ea,Er);  %crear tabla
                
                disp('Matriz de coeficientes: ');%etiqueta de matriz
                matCoeficientes         %imprime matriz de coeficientes
                disp('Vector de incognitas: ');%etiqueta de incognitas
                disp('a0');%imprimo coeficiente a0  
                disp('a1');%imprimo coeficiente a1
                disp('a2');%imprimo coeficiente a2
                disp('a3');%imprimo coeficiente a3
                disp(''); %imprimo salto de fila
                disp('Vector de terminos independientes');%imprimo etiqueta de terminos independientes
                vectorB%imprimo vector de terminos indendientes
                disp('Ecuacion de la aproximacion cubica');%etiqueta
                Ecuacion = vpa(y1) %Ecuacion de regresion               
                tcv = toc;%finalizo reloj
                T2 = table(tcv); %crear tabla 2
            elseif m == 3
                sumatoriaX = sum(M(:,1));   %sumatoria de x
                sumatoriaY = sum(M(:,2));   %sumatoria de y
                sumatoriaYP = sum(log(M(:,2)));   %sumatoria para y prima
                sumatoriaXYP = sum(M(:,1).*log(M(:,2)));  %sumatoria de xy
                sumatoriaX2 = sum(M(:,1).^2);   %sumatoria de xx
                sumatoriaYP2 = sum(log(M(:,2)).^2);  %sumatoria de yy
                n = sizeM(1);   %cantidad de datos
                xMedia = sumatoriaX/n;      %promedio de x
                yPMedia = sumatoriaYP/n;      %promedio de y
                a1 = (n*sumatoriaXYP-sumatoriaX*sumatoriaYP)/(n*sumatoriaX2-sumatoriaX^2);%coeficiente a1
                a0 = yPMedia-a1*xMedia;  %coeficiente a0
                b = exp(a0);
                y = b * exp(a1*M(:,1));     %calculo los valores de y evaluados en los valores independientes de entrada
                plot(M(:,1),M(:,2),'dk')%dibujo los puntos
                hold on%sobredibujo
                plot(M(:,1),y,'r--')    %dibujo la regresion lineal
                grid on%enciende la grilla
                xlabel('Eje x')%etiqueto el eje x
                ylabel('Eje y')%etiqueto el eje y
                title('Regresion Exponencial')   %etiqueto la imagen
                legend('Puntos', 'Linea de ajuste') %descripcion de la imagen
                r = (n*sumatoriaXYP-sumatoriaX*sumatoriaYP)/(sqrt(n*sumatoriaX2-sumatoriaX^2)*sqrt(n*sumatoriaYP2-sumatoriaYP^2));%calcular coeficiente de correlacion
                syms x;%declaro variable simbolica
                y1 = b * exp(a1*x); %inicializo funcion lineal de la regresion
                Ea = 0;     %inicializo error absoluto
                Er = 0;     %inicializo error relativo
                MatrizYReal = 0;    %inicializo de la matriz
                for i = 1:sizeM(1)  %contador de uno hasta el numero de datos
                    yReal = subs(y1,M(i,1));    %evaluo los puntos x de entrada en la funcion
                    Ea(i) = abs(yReal-M(i,2));  %calculo el error absoluto de cada y
                    Er(i) = (Ea(i)/yReal)*100;  %calculo el error relativo de cada y
                    MatrizYReal(i) = yReal;     %guardo los valores reales de y real
                end
                Er = Er';   %transpuesta de los errores relativos
                Ea = Ea';   %transpuesta de los errores absolutos
                YReal = MatrizYReal';   %transpuesta de los valores reales de y
                x = M(:,1);     %asigno los valores experimentales a x
                y = M(:,2);     %asigno los valores experimentales a y
                yPrima = log(M(:,2)); %asigno los valores experimentales a y prima
                T = table(x,y,yPrima,YReal,Ea,Er);  %crear tabla
                
                disp('Matriz de coeficientes: ');%etiqueta de matriz
                matCoeficientes = zeros(2,2);%inicializo la matriz de coeficientes
                matCoeficientes(1,1) = n;%asigno el valor de la fila 1 columna 1
                matCoeficientes(1,2) = sumatoriaX;%asigno el valor de la fila 1 columna 2
                matCoeficientes(2,1) = sumatoriaX;%asigno el valor de la fila 2 columna 1
                matCoeficientes(2,2) = sumatoriaX2;%asigno el valor de la fila 2 columna 2
                matCoeficientes         %imprime matriz de coeficientes
                disp('Vector de incognitas: ');%etiqueta de incognitas
                disp('a0');%imprimo coeficiente a0  
                disp('a1');%imprimo coeficiente a1
                disp(''); %imprimo salto de fila
                disp('Vector de terminos independientes');%imprimo etiqueta de terminos independientes
                vectorB = zeros(2,1);%inicializo vector de terminos independientes
                vectorB(1,1)= sumatoriaYP;%asigno primer valor
                vectorB(2,1)= sumatoriaXYP;%asigno segundo valor
                vectorB%imprimo vector de terminos indendientes
                disp('Ecuacion de la aproximacion exponencial');%etiqueta
                Ecuacion = vpa(y1) %Ecuacion de regresion              
                tcv = toc; %finalizo reloj
                T2 = table(r,tcv);  %crear tabla 2
            end
        else
            disp('Ingrese un m valido')
        end
    else
        disp('La matriz no es correcta')
    end
elseif nargin == 3
    M = cell2mat(varargin(1));%se asigna a M la matriz de puntos
    m = cell2mat(varargin(2));%se asigna a m el numero para seleccionar el metodo de ajuste
    xEvaluar = cell2mat(varargin(3));%se asigna x para evaluar Yi(x)
    sizeM = size(M);    %tamaño de la matriz
    tic     %inicia el tictoc
    if sizeM(2) == 2%se comparan las columnas de la matriz
        if m>=0 && m<=3 && abs(round(m) -m) == 0
            if m == 1
                sumatoriaX = sum(M(:,1));   %sumatoria de x
                sumatoriaY = sum(M(:,2));   %sumatoria de y
                sumatoriaXY = sum(M(:,1).*M(:,2));  %sumatoria de xy
                sumatoriaX2Y = sum((M(:,1).^2).*M(:,2));       %sumatoria de x2y
                sumatoriaX2 = sum(M(:,1).^2);       %sumatoria de xx
                sumatoriaX3 = sum(M(:,1).^3);       %sumatoria de xxx
                sumatoriaX4 = sum(M(:,1).^4);       %sumatoria de xxxx
                sumatoriaY2 = sum(M(:,2).^2);       %sumatoria de yy
                n = sizeM(1);   %cantidad de datos
                xMedia = sumatoriaX/n;      %promedio de x
                yMedia = sumatoriaY/n;      %promedio de y
                matCoeficientes = zeros(3,3);%inicializo matriz de coeficientes
                vectorB= zeros(3,1);        %inicializo vector de valores independientes
                matCoeficientes(1,1)= n;    %asigno numero de puntos
                matCoeficientes(1,2)= sumatoriaX;   %asigno sumatoria de x
                matCoeficientes(1,3)= sumatoriaX2;  %asigno sumatoria de xx
                matCoeficientes(2,1)= sumatoriaX;   %asigno sumatoria de x
                matCoeficientes(2,2)= sumatoriaX2;  %asigno sumatoria de xx
                matCoeficientes(2,3)= sumatoriaX3;  %asigno sumatoria de xxx
                matCoeficientes(3,1)= sumatoriaX2;  %asigno sumatoria de xx
                matCoeficientes(3,2)= sumatoriaX3;  %asigno sumatoria de xxx
                matCoeficientes(3,3)= sumatoriaX4;  %asigno sumatoria de xxxx
                vectorB(1) = sumatoriaY;    %asigno sumatoria de y
                vectorB(2) = sumatoriaXY;   %asigno sumatoria de xy
                vectorB(3) = sumatoriaX2Y;  %asigno sumatoria de xxy
                coefsR= matCoeficientes\vectorB;%calculo los coeficientes
                a0 = coefsR(1);%guardo valor del coeficiente
                a1 = coefsR(2);%guardo valor del coeficiente
                a2 = coefsR(3);%guardo valor del coeficiente
                y = a0 + a1*M(:,1) + a2*(M(:,1)).^2;     %calculo los valores de y evaluados en los valores independientes de entrada
                plot(M(:,1),M(:,2),'dk')%dibujo los puntos
                hold on%sobredibujo
                plot(M(:,1),y,'r--')    %dibujo la regresion de la curva
                grid on%enciende la grilla
                xlabel('Eje x')%etiqueto el eje x
                ylabel('Eje y')%etiqueto el eje y
                title('Regresion cuadratica')   %etiqueto la imagen
                legend('Puntos', 'Curva de ajuste') %descripcion de la imagen
                syms x;%declaro variable simbolica
                y1 = a0 + a1*x + a2*x^2; %inicializo funcion lineal de la regresion
                Ea = 0;     %inicializo error absoluto
                Er = 0;     %inicializo error relativo
                MatrizYReal = 0;    %inicializo de la matriz
                for i = 1:sizeM(1)  %contador de uno hasta el numero de datos
                    yReal = subs(y1,M(i,1));    %evaluo los puntos x de entrada en la funcion
                    Ea(i) = abs(yReal-M(i,2));  %calculo el error absoluto de cada y
                    Er(i) = (Ea(i)/yReal)*100;  %calculo el error relativo de cada y
                    MatrizYReal(i) = yReal;     %guardo los valores reales de y real
                end
                Er = Er';   %transpuesta de los errores relativos
                Ea = Ea';   %transpuesta de los errores absolutos
                YReal = MatrizYReal';   %transpuesta de los valores reales de y
                x = M(:,1);     %asigno los valores experimentales a x
                y = M(:,2);     %asigno los valores experimentales a y
                T = table(x,y,YReal,Ea,Er);  %crear tabla
                Yi = vpa(subs(y1,xEvaluar))  %asigno el valor evaluado por x en Yi(x)
                Ecuacion = vpa(y1) %Ecuacion de regresion
                tcv = toc;%finalizo reloj
                T2 = table(tcv); %crear tabla 2
            elseif m == 0
                sumatoriaX = sum(M(:,1));   %sumatoria de x
                sumatoriaY = sum(M(:,2));   %sumatoria de y
                sumatoriaXY = sum(M(:,1).*M(:,2));  %sumatoria de xy
                sumatoriaX2 = sum(M(:,1).^2);       %sumatoria de xx
                sumatoriaY2 = sum(M(:,2).^2);       %sumatoria de yy
                n = sizeM(1);   %cantidad de datos
                xMedia = sumatoriaX/n;      %promedio de x
                yMedia = sumatoriaY/n;      %promedio de y
                a1 = (n*sumatoriaXY-sumatoriaX*sumatoriaY)/(n*sumatoriaX2-sumatoriaX^2);%coeficiente a1
                a0 = yMedia-a1*xMedia;  %coeficiente a0
                y = a0 + a1*M(:,1);     %calculo los valores de y evaluados en los valores independientes de entrada
                plot(M(:,1),M(:,2),'dk')%dibujo los puntos
                hold on%sobredibujo
                plot(M(:,1),y,'r--')    %dibujo la regresion lineal
                grid on%enciende la grilla
                xlabel('Eje x')%etiqueto el eje x
                ylabel('Eje y')%etiqueto el eje y
                title('Regresion lineal')   %etiqueto la imagen
                legend('Puntos', 'Linea de ajuste') %descripcion de la imagen
                r = (n*sumatoriaXY-sumatoriaX*sumatoriaY)/(sqrt(n*sumatoriaX2-sumatoriaX^2)*sqrt(n*sumatoriaY2-sumatoriaY^2));%calcular coeficiente de correlacion
                syms x;%declaro variable simbolica
                y1 = a0 + a1*x; %inicializo funcion lineal de la regresion
                Ea = 0;     %inicializo error absoluto
                Er = 0;     %inicializo error relativo
                MatrizYReal = 0;    %inicializo de la matriz
                for i = 1:sizeM(1)  %contador de uno hasta el numero de datos
                    yReal = subs(y1,M(i,1));    %evaluo los puntos x de entrada en la funcion
                    Ea(i) = abs(yReal-M(i,2));  %calculo el error absoluto de cada y
                    Er(i) = (Ea(i)/yReal)*100;  %calculo el error relativo de cada y
                    MatrizYReal(i) = yReal;     %guardo los valores reales de y real
                end
                Er = Er';   %transpuesta de los errores relativos
                Ea = Ea';   %transpuesta de los errores absolutos
                YReal = MatrizYReal';   %transpuesta de los valores reales de y
                x = M(:,1);     %asigno los valores experimentales a x
                y = M(:,2);     %asigno los valores experimentales a y
                T = table(x,y,YReal,Ea,Er);  %crear tabla
                Yi = vpa(subs(y1,xEvaluar))  %asigno el valor evaluado por x en Yi(x)
                Ecuacion = vpa(y1) %Ecuacion de regresion
                tcv = toc;     %finalizo reloj
                T2 = table(r,tcv);  %crear tabla 2
            elseif m == 2
                sumatoriaX = sum(M(:,1));   %sumatoria de x
                sumatoriaY = sum(M(:,2));   %sumatoria de y
                sumatoriaXY = sum(M(:,1).*M(:,2));  %sumatoria de xy
                sumatoriaX2Y = sum((M(:,1).^2).*M(:,2));       %sumatoria de x2y
                sumatoriaX3Y = sum((M(:,1).^3).*M(:,2));       %sumatoria de x2y
                sumatoriaX2 = sum(M(:,1).^2);       %sumatoria de xx
                sumatoriaX3 = sum(M(:,1).^3);       %sumatoria de xxx
                sumatoriaX4 = sum(M(:,1).^4);       %sumatoria de xxxx
                sumatoriaX5 = sum(M(:,1).^5);       %sumatoria de xxxx
                sumatoriaX6 = sum(M(:,1).^6);       %sumatoria de xxxx
                sumatoriaY2 = sum(M(:,2).^2);       %sumatoria de yy
                n = sizeM(1);   %cantidad de datos
                xMedia = sumatoriaX/n;      %promedio de x
                yMedia = sumatoriaY/n;      %promedio de y
                matCoeficientes = zeros(4,4);%inicializo matriz de coeficientes
                vectorB= zeros(4,1);        %inicializo vector de valores independientes
                matCoeficientes(1,1)= n;    %asigno numero de puntos
                matCoeficientes(1,2)= sumatoriaX;   %asigno sumatoria de x
                matCoeficientes(1,3)= sumatoriaX2;  %asigno sumatoria de xx
                matCoeficientes(1,4)= sumatoriaX3;  %asigno sumatoria de xxx
                matCoeficientes(2,1)= sumatoriaX;   %asigno sumatoria de x
                matCoeficientes(2,2)= sumatoriaX2;  %asigno sumatoria de xx
                matCoeficientes(2,3)= sumatoriaX3;  %asigno sumatoria de xxx
                matCoeficientes(2,4)= sumatoriaX4;  %asigno sumatoria de xxxx
                matCoeficientes(3,1)= sumatoriaX2;  %asigno sumatoria de xx
                matCoeficientes(3,2)= sumatoriaX3;  %asigno sumatoria de xxx
                matCoeficientes(3,3)= sumatoriaX4;  %asigno sumatoria de xxxx
                matCoeficientes(3,4)= sumatoriaX5;  %asigno sumatoria de xxxxx
                matCoeficientes(4,1)= sumatoriaX3;  %asigno sumatoria de xx
                matCoeficientes(4,2)= sumatoriaX4;  %asigno sumatoria de xxx
                matCoeficientes(4,3)= sumatoriaX5;  %asigno sumatoria de xxxx
                matCoeficientes(4,4)= sumatoriaX6;  %asigno sumatoria de xxxxx
                vectorB(1) = sumatoriaY;    %asigno sumatoria de y
                vectorB(2) = sumatoriaXY;   %asigno sumatoria de xy
                vectorB(3) = sumatoriaX2Y;  %asigno sumatoria de xxy
                vectorB(4) = sumatoriaX3Y;  %asigno sumatoria de xxy
                coefsR= matCoeficientes\vectorB;%calculo los coeficientes
                a0 = coefsR(1);%guardo valor del coeficiente
                a1 = coefsR(2);%guardo valor del coeficiente
                a2 = coefsR(3);%guardo valor del coeficiente
                a3 = coefsR(4);%guardo valor del coeficiente
                y = a0 + a1*M(:,1) + a2*(M(:,1)).^2 + a3*(M(:,1)).^3;     %calculo los valores de y evaluados en los valores independientes de entrada
                plot(M(:,1),M(:,2),'dk')%dibujo los puntos
                hold on%sobredibujo                
                plot(M(:,1),y,'r--')    %dibujo la regresion de la curva
                grid on%enciende la grilla
                xlabel('Eje x')%etiqueto el eje x
                ylabel('Eje y')%etiqueto el eje y
                title('Regresion cubica')   %etiqueto la imagen
                legend('Puntos', 'Curva de ajuste') %descripcion de la imagen
                syms x;%declaro variable simbolica
                y1 = a0 + a1*x + a2*x^2 + a3*x^3; %inicializo funcion lineal de la regresion
                Ea = 0;     %inicializo error absoluto
                Er = 0;     %inicializo error relativo
                MatrizYReal = 0;    %inicializo de la matriz
                for i = 1:sizeM(1)  %contador de uno hasta el numero de datos
                    yReal = subs(y1,M(i,1));    %evaluo los puntos x de entrada en la funcion
                    Ea(i) = abs(yReal-M(i,2));  %calculo el error absoluto de cada y
                    Er(i) = (Ea(i)/yReal)*100;  %calculo el error relativo de cada y
                    MatrizYReal(i) = yReal;     %guardo los valores reales de y real
                end
                Er = Er';   %transpuesta de los errores relativos
                Ea = Ea';   %transpuesta de los errores absolutos
                YReal = MatrizYReal';   %transpuesta de los valores reales de y
                x = M(:,1);     %asigno los valores experimentales a x
                y = M(:,2);     %asigno los valores experimentales a y
                T = table(x,y,YReal,Ea,Er);  %crear tabla
                Yi = vpa(subs(y1,xEvaluar))  %asigno el valor evaluado por x en Yi(x)
                Ecuacion = vpa(y1) %Ecuacion de regresion
                tcv = toc;%finalizo reloj
                T2 = table(tcv);  %crear tabla 2
            elseif m == 3
                sumatoriaX = sum(M(:,1));   %sumatoria de x
                sumatoriaY = sum(M(:,2));   %sumatoria de y
                sumatoriaYP = sum(log(M(:,2)));   %sumatoria para y prima
                sumatoriaXYP = sum(M(:,1).*log(M(:,2)));  %sumatoria de xy
                sumatoriaX2 = sum(M(:,1).^2);   %sumatoria de xx
                sumatoriaYP2 = sum(log(M(:,2)).^2);  %sumatoria de yy
                n = sizeM(1);   %cantidad de datos
                xMedia = sumatoriaX/n;      %promedio de x
                yPMedia = sumatoriaYP/n;      %promedio de y
                a1 = (n*sumatoriaXYP-sumatoriaX*sumatoriaYP)/(n*sumatoriaX2-sumatoriaX^2);%coeficiente a1
                a0 = yPMedia-a1*xMedia;  %coeficiente a0
                b = exp(a0);
                y = b * exp(a1*M(:,1));     %calculo los valores de y evaluados en los valores independientes de entrada
                plot(M(:,1),M(:,2),'dk')%dibujo los puntos
                hold on%sobredibujo
                plot(M(:,1),y,'r--')    %dibujo la regresion lineal
                grid on%enciende la grilla
                xlabel('Eje x')%etiqueto el eje x
                ylabel('Eje y')%etiqueto el eje y
                title('Regresion Exponencial')   %etiqueto la imagen
                legend('Puntos', 'Linea de ajuste') %descripcion de la imagen
                r = (n*sumatoriaXYP-sumatoriaX*sumatoriaYP)/(sqrt(n*sumatoriaX2-sumatoriaX^2)*sqrt(n*sumatoriaYP2-sumatoriaYP^2));%calcular coeficiente de correlacion
                syms x;%declaro variable simbolica
                y1 = b * exp(a1*x); %inicializo funcion lineal de la regresion
                Ea = 0;     %inicializo error absoluto
                Er = 0;     %inicializo error relativo
                MatrizYReal = 0;    %inicializo de la matriz
                for i = 1:sizeM(1)  %contador de uno hasta el numero de datos
                    yReal = subs(y1,M(i,1));    %evaluo los puntos x de entrada en la funcion
                    Ea(i) = abs(yReal-M(i,2));  %calculo el error absoluto de cada y
                    Er(i) = (Ea(i)/yReal)*100;  %calculo el error relativo de cada y
                    MatrizYReal(i) = yReal;     %guardo los valores reales de y real
                end
                Er = Er';   %transpuesta de los errores relativos
                Ea = Ea';   %transpuesta de los errores absolutos
                YReal = MatrizYReal';   %transpuesta de los valores reales de y
                x = M(:,1);     %asigno los valores experimentales a x
                y = M(:,2);     %asigno los valores experimentales a y
                yPrima = log(M(:,2)); %asigno los valores experimentales a y prima
                T = table(x,y,yPrima,YReal,Ea,Er);  %crear tabla
                Yi = vpa(subs(y1,xEvaluar)) %asigno el valor evaluado por x en Yi(x)
                Ecuacion = vpa(y1) %Ecuacion de regresion
                tcv = toc; %finalizo reloj
                T2 = table(r,tcv);  %crear tabla
            end
        else
            disp('Ingrese un m valido')
        end
    else
        disp('La matriz no es correcta')
    end
end