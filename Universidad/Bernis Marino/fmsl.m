%UNIVERSIDAD DE LAS FUERZAS ARMADAS 
%               ESPE
%               GRUPO N°1

function [tablaX] = fmsl()
banderaDimension = 1; %Inicializacion variable bandera
while banderaDimension %Bucle para validacion de la entrada de datos
    prompt = 'Ingrese la matriz A: ';
    A = input(prompt) %Solicita los valores para la matriz A
    dimA = size(A); %Verifica que A sea una matriz cuadrada
    if dimA(1) == dimA(2) %Verifica si la matriz A es cuadrada
        banderaDimension = 0; %El valor que toma de A es falso al ver que la matriz no es cuadrada
        banderaDimB = 1; %Inicializacion de variable 
        while banderaDimB %se verifica si se cumple la condicion de la matriz B
            prompt = 'Ingrese la matriz B: ';
            B = input(prompt) %Solicita valores para la matriz B
            dimB = size(B); %Calcula y Verifica dimension de matriz B
            if dimA(2) == dimB(1) && dimB(2) == 1 %Se realiza el proceso si se cumplen las dimensiones correctas entre A y B
                banderaDimB = 0; %Devuelve el valor de falso si la matriz B no es cuadrada
                banderaMetodo = 1; %Inicializacion de bandera para cumplir con la condicion de opciones de metodo
                while banderaMetodo %Se realiza el proceso si se cumple la restriccion de metodo
                    prompt = 'Seleccione una opción para el método: ';
                    disp('0. Método de Gauss')
                    disp('1. Método de Gauss-Jordan')
                    disp('2. Método de Gauss-Seidel')
                    disp('3. Método de la Matriz Inversa')
                    disp('4. Método de descomposición LU')
            
                    m = input(prompt) %Se pide valores para el metodo
                    if m >= 0 && m <= 5 %Validacion para que m se ecnuentre entre 0 y 5
                        banderaMetodo = 0; %Retorna falso si se cumple la condicion del metodo
                    else
                        disp('Opción incorrecta.')
                    end
                end
                banderaFormato = 1; %Se inicializa bandera para validacion del formato
                while banderaFormato %Se realiza el proceso si se cumple la condicion de formato
                    prompt = 'Seleccione una opción para el formato: ';
                    disp('0. Formato Short')
                    disp('1. Formato Long')
                    disp('2. Formato Notacion científica (short)')
                    disp('3. Formato Notacion científica (long)')
                    disp('4. Formato Bank')
                    disp('5. Formato Rat')
                    f = input(prompt) %Se piden valores pra la variable f
                    if f==0 %Opcion del formato
                        banderaFormato = 0; %Retorna valor de 0 si se cumple la condicion de formato
                        format short %Formato seleccionado
                    elseif f == 1 %Opcion escogida del formato
                        banderaFormato = 0; %Retorna valor de 0 si se cumple la condicion de formato
                        format long %Formato seleccionado
                    elseif f == 2 %Opcion escogida de formato
                        banderaFormato = 0; %Retorna valor de falso si se cumple la condicion de formato
                        format shortE %Se define el formato seleccionado
                    elseif f == 3 %Opcion escogida de formato
                        banderaFormato = 0; %Retorna valor de falso si se cumple la condicion de formato
                        format longE %Se define el formato seleccionado
                    elseif f == 4 %Opcion escogida de formato
                        banderaFormato = 0; %Retorna valor de falso si se cumple la condicion de formato
                        format bank %Se define el formato seleccionado
                    elseif f==5
                        banderaFormato = 0;
                        format rat
                    elseif f < 0 || f > 5 %Si no cumple la condicion de formato
                        disp('Opción incorrecta')
                    end
                end
                grapA=[A B];%Matrix de coeficientes extendida
                if m == 0 %Opcion escogida de metodo
                    vt = A\B; %Calculo teorico del metodo de Gauss
                    n = length(A); %Calcula la dimension de las filas de A
                    ve = zeros(n,1); %Se crea un vector vertical de 0 con longitud filas de A
                    
                    for k = 1:n %k va desde 1 hasta n
                        for i = k+1:n %i va desde la fila k+1 hasta la ultima
                            li = A(i,k)/A(k,k); %Producto para obtener el elemento neutro de las demas filas
                            A(i,:) = A(i,:)-li*A(k,:); %Se enceran los elementos bajo la diagonal
                            B(i) = B(i)-li*B(k); %Resta de filas del vector independiente
                        end
                    end
                    Ab = [A B]; %Matriz extendida
                    ve(n) = Ab(n,n+1)/Ab(n,n); %Se divide el ultimo elemento de la matriz extendida para el ultimo elemento de A
                    for i = n-1:-1:1 %i recorre los valores de n-1 hasta 1
                        ve(i) = Ab(i,n+1)/Ab(i,i)-Ab(i,i+1:n)*ve(i+1:n)/Ab(i,i); %Se realiza los despejes de cada incognita
                    end
                    Ea = abs(vt -ve);%error absoluto
                    Er = abs(Ea./vt);%error relativa
                    xi= zeros(dimA(1),1);%vector de incognitas
                    for k = 1:dimA(1)
                        xi = 'x';%escribir incognitas
                    end
                    %tablaX = struct('Incógnitas', xi, 'ValorTeorico', vt,'ValorExperimental', ve, 'ErrorAbsoluto',Ea,'ErrorRelativo', Er);%tabla de analisis de valor experimental y teorico
                    xi
                    vt
                    ve                   
                    Ea
                    Er
                    
                    if(dimA(1)==2 )%graficar en dos dimensiones
                        xgrid= (ve(2)-20):0.1:(ve(2)+20);%hacer grilla para x
                        syms y;%variables simbolica para evaluar funciones
                        fy1 = (grapA(1,3)- grapA(1,2)*y)/grapA(1,1);%funcion a evaluar
                        fy2 = (grapA(2,3)- grapA(2,2)*y)/grapA(2,1);%funcion a evaluar
                        ygrid1= subs(fy1,xgrid);%grilla de funcion evaluada
                        ygrid2= subs(fy2,xgrid);%grilla de funcion evaluada
                        plot(xgrid,ygrid1);%dibujar funcion 1
                        hold on%sobreescribir
                        plot(xgrid,ygrid2);%dibujar funcion 2
                        title('Grafico del sistema de ecuaciones en 2D');%Poner titulo
                        xlabel('Eje x');%nombrar eje
                        ylabel('Eje y');%nombrar eje
                        text(ve(2),ve(1),'pSol');%etiquetar solucion
                    elseif (dimA==3)%dibujar en 3 dimensiones
                        [Xgrid,Ygrid]=meshgrid((ve(2)-20):0.1:(ve(2)+20));%hacer malla de puntos
                        fz1= (grapA(1,4)-grapA(1,3)*Xgrid-grapA(1,2)*Ygrid)/grapA(1,1);%evaluar en z1
                        fz2= (grapA(2,4)-grapA(2,3)*Xgrid-grapA(2,2)*Ygrid)/grapA(2,1);%evaluar en z2
                        fz3= (grapA(3,4)-grapA(3,3)*Xgrid-grapA(3,2)*Ygrid)/grapA(3,1);%evaluar en z3
                        su1 = surf(Xgrid,Ygrid,fz1);%graficar superficie
                        hold on;%sobreescribir
                        su2 = surf(Xgrid,Ygrid,fz2);%graficar superficie
                        su3 = surf(Xgrid,Ygrid,fz3);%graficar superficie
                        su1.EdgeColor = [1 0 0];%cambiar color
                        su2.EdgeColor = [0 0 1];%cambiar color
                        su3.EdgeColor = 'interp';%cambiar color
                        title('Gráfico del sistema de ecuaciones en 3D');%titular
                        xlabel('Eje x');%etiquetar eje
                        ylabel('Eje y');%etiquetar eje
                        zlabel('Eje z');%etiquetar eje
                        text(ve(1)+13,ve(2),ve(3),'pSol','Color','red','FontSize',20);%etiquetar punto
                    end
                end
                if(m == 1)
                    vt = rref([A B])%valor teorico
                    xt = zeros(dimA(1),1);
                    for q = 1:dimA(1)
                        xt(q)=vt(q,(dimA(1)+1));
                    end
                    xt
                    C=[A B]; %%unión de los datos en una solo matriz
                    for i=1:length(C(:,1)) %%recorre matriz extendida
                        if C(i,i)~=1 %%si el elemento i,i de la diagonal es diferente de 1
                            C(i,:)= C(i,:)./C(i,i);  %entonces se convierte a 1  dividiendo toda la fila por dicho elemento
                        end
                        for n=1:length(C(:,1)) %recorre matrix extendida
                            if n~=i % si n en la columna i no está en la diagonal es decir si i no es igual a n
                                C(n,:)=-C(n,i).*C(i,:)+C(n,:); %entonces se convierte a 0
                            end
                        end
                    end
                    ve = zeros(dimA(1),1);
                    for q = 1:dimA(1)
                        ve(q)=C(q,(dimA(1)+1));
                    end
                    ve
                    Ea = abs(xt - ve)%error absoluto
                    Er = abs(Ea./xt)%error relativo
                    xi= zeros(dimA(1),1);%vector de incognitas
                    for k = 1:dimA(1)
                        xi = 'x';
                    end
                    tablaX = struct('incognitas', xi, 'ValorTeorico', vt,'ValorExperimental', ve, 'ErrorAbsoluto',Ea,'ErrorRelativo', Er);%tabla de analisis de valores teoricos y experimentales
                    if(dimA(1)==2 )%graficar 2 dimensiones
                        xgrid= (ve(2)-20):0.1:(ve(2)+20);%hacer grilla
                        syms y;%declarar variable simbolica
                        fy1 = (grapA(1,3)- grapA(1,2)*y)/grapA(1,1);%funcion a evaluar
                        fy2 = (grapA(2,3)- grapA(2,2)*y)/grapA(2,1);%funcion a evaluar
                        ygrid1= subs(fy1,xgrid);%evaluar funcion
                        ygrid2= subs(fy2,xgrid);%evaluar funcion
                        plot(xgrid,ygrid1);%dibujar
                        hold on%sobreescribir
                        plot(xgrid,ygrid2);%dibujar
                        title('Grafico del sistema de ecuaciones en 2D');%etiquetar titulo
                        xlabel('Eje x');%etiquetar eje
                        ylabel('Eje y');%etiquetar eje
                        text(ve(2),ve(1),'pSol');%etiquetar punto
                    elseif (dimA==3)%dibujar 3 dimensiones
                        [Xgrid,Ygrid]=meshgrid((ve(2)-20):0.1:(ve(2)+20));%hacer malla de puntos
                        fz1= (grapA(1,4)-grapA(1,3)*Xgrid-grapA(1,2)*Ygrid)/grapA(1,1);%evaluar en la funcion z1
                        fz2= (grapA(2,4)-grapA(2,3)*Xgrid-grapA(2,2)*Ygrid)/grapA(2,1);%evaluar en la funcion z2
                        fz3= (grapA(3,4)-grapA(3,3)*Xgrid-grapA(3,2)*Ygrid)/grapA(3,1);%evaluar en la funcion z3
                        su1 = surf(Xgrid,Ygrid,fz1);%graficar superficie
                        hold on;%sobreescribir
                        su2 = surf(Xgrid,Ygrid,fz2);%graficar superficie
                        su3 = surf(Xgrid,Ygrid,fz3);%graficar superficie
                        su1.EdgeColor = [1 0 0];%cambiar color
                        su2.EdgeColor = [0 0 1];%cambiar color
                        su3.EdgeColor = 'interp';%cambiar color
                        title('Grafico del sistema de ecuaciones en 3D');%etiquetar titulo
                        xlabel('Eje x');%etiquetar eje
                        ylabel('Eje y');%etiquetar eje
                        zlabel('Eje z');%etiquetar eje
                        text(ve(1)+13,ve(2),ve(3),'pSol','Color','red','FontSize',20);%etiquetar punto
                    end
                elseif (m == 2)
                     prompt = 'Ingrese un numero de itearciones o un limite de error de carry: ';
                     entradaN = input(prompt) %Guarda la entrada del usuario
                     if isreal(entradaN)%Comprobacion si es real
                        if abs((entradaN - round(entradaN))) == 0 %Valido si es entero
                            AB = [A B];
                        for k = 1:dimA(1)
                            for j = k:dimA(1)                                
                              if (abs(AB(k,k)) < abs(AB(j,k))) && (k~=j) %Intercambio de filas para validar
                                  aux = AB(j,:);
                                  AB(j,:) = AB(k,:);
                                  AB(k,:) = aux;
                              end
                            end                           
                        end
                        x1 = zeros(1,dimA(1));
                        k = 1;
                        matrizDeIteraciones = zeros(entradaN,dimA(1));
                        while  k <= entradaN
                            for i = 1 : dimA(1)
                                s = 0;
                                for j = 1 : dimA(1)
                                    s = s-AB(i,j)*x1(j);
                                end
                                s = (s+AB(i,dimA(1)+1))/AB(i,i);
                                x1(i) = x1(i) + s;
                            end
                            k = k+1;
                            matrizDeIteraciones(k,:) = x1;
                        end
                        matrizDeCarry = zeros(entradaN-1,dimA(1));
                        for z = 1:(entradaN-1)
                            matrizDeCarry(z,:) = matrizDeIteraciones(z+1,:) - matrizDeIteraciones(z,:);
                        end
                        matrizDeIteraciones
                        matrizDeCarry
                        else
                            AB = [A B];
                        for k = 1:dimA(1)
                            for j = k:dimA(1)                                
                              if (abs(AB(k,k)) < abs(AB(j,k))) && (k~=j) %Intercambio de filas para validar
                                  aux = AB(j,:);
                                  AB(j,:) = AB(k,:);
                                  AB(k,:) = aux;
                              end
                            end                           
                        end
                        x1 = zeros(1,dimA(1));
                        k = 1;
                        ec = zeros(1,dimA(1));
                        %matrizDeIteraciones = zeros(entradaN,dimA(1));
                        vectorEc = ones(dimA(1),1);
                        for w = 1:dimA(1)
                            vectorEc(w) = entradaN;
                        end
                        
                        bandera = 1;
                        %while  ec >= entradaN
                        while bandera
                            for i = 1 : dimA(1)
                                s = 0;
                                for j = 1 : dimA(1)
                                    s = s-AB(i,j)*x1(j);
                                end
                                s = (s+AB(i,dimA(1)+1))/AB(i,i);
                                x1(i) = x1(i) + s;
                            end
                            
                            k = k+1;
                            matrizDeIteraciones(k,:) = x1;
                            matrizDeCarry(k,:) = abs(matrizDeIteraciones(k,:)-matrizDeIteraciones(k-1,:));
                            count = 0;
                            veclogical = matrizDeCarry(k,:)>vectorEc;
                            for h = 1:dimA(1)
                                if veclogical(h) == 0;
                                    count = count+1;
                                end
                            end
                            if count == dimA(1)
                                bandera = 0;
                            end
                        end
                        
                        matrizDeIteraciones
                        
                        matrizDeCarry
                        end
                     else
                         disp('La entrada no es real')
                     end
                     
                elseif (m == 3)
                    vt = inv(A)*B
                    C=[A eye(dimA(1))]; %%unión de los datos en una solo matriz
                    for i=1:length(C(:,1)) %%recorre matriz extendida
                        if C(i,i)~=1 %%si el elemento i,i de la diagonal es diferente de 1
                            C(i,:)= C(i,:)./C(i,i);  %entonces se convierte a 1  dividiendo toda la fila por dicho elemento
                        end
                        for n=1:length(C(:,1)) %recorre matrix extendida
                            if n~=i % si n en la columna i no está en la diagonal es decir si i no es igual a n
                                C(n,:)=-C(n,i).*C(i,:)+C(n,:); %entonces se convierte a 0
                            end
                        end
                    end
                    dimC = size(C);
                    matrizInv = C(:,dimA(1)+1:dimC(2));
                    X = matrizInv*B
                elseif(m == 4)
                    [L U]= lu(A);
                    xT = U\(L\B);
                    [n n]=size(A);
                    [L U P]=lu(A);
                    B1=P*B;
                    [n1 n2]=size(L);
                    n = n1;
                    X(1)= B1(1)/L(1,1);
                    for i=2:1:n
                        X(i)=(B1(i)-L(i,1:i-1)*X(1:i-1)')/L(i,i);
                    end
                    [nU nU2]= size(U);
                    xE(nU)=X(nU)/U(nU,nU);
                    for i=(nU-1):-1:1
                        xE(i)=(X(i)-U(i,i+1:nU)*xE(i+1:nU)')/U(i,i);
                    end
                xExperimental = xE';
                xExperimental
                xT
                end
            else
                disp('La matriz columna no coincide con las dimensiones de la matriz principal.')
            end
        end
    else
        disp('La matriz no es cuadrada, no cumple con lo solicitado.')%escribir mensaje de error
    end
end
end