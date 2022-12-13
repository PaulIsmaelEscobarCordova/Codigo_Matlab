%Universidad de las Fuerzas Armadas
%Grupo n�1
%Kevin Castillo
%Paul Escobar
%Yandri Vacas
% para la inicialización se debe definir syms x para el funcionamiento del
% programa y correr la función Gauss.m
% Realizar el ingreso de la siguiente manera
% fint(f,a,b,n)
% Siendo:
% f ---> funcion a evaluar
% a ---> limite inferior
% b ---> limite superior
% n ---> numero de intervalos
function [] = fintg(f1,a,b,n)
clc;                        %Limpiar Pantalla
tic;                        %Inicio del contador
syms x
v1 = 0;
p = 0;
ES1=0;
ES3=0;
%para el primer caso de integracion metodo trapecio
f=matlabFunction(f1);       %Generacion de la funcion anonima
for i=a:0.01:b
    if (f(i)>10^6 || f(i)<-10^6 || f(i)==inf || ~isreal(f(i)) || isnan(f(i)) || f(i)==-inf)
        v1 = 1;
        
    end
end
% Validaciones dentro de la funcion
if (a>b)
    disp('El intervalo no es permitido')
elseif (isnumeric(a)==0 || isnumeric(b)==0 || isnumeric(n)==0)
    disp('Valores del rango o intervalo no permitido')
elseif (mod(n,1)~=0 || n<1)
    disp('n tiene que ser un numero entero positivo')
elseif (v1==1)
    disp('La funcion no es continua en el intervalo asignado')
else
    p=1; %Se puede realizar el proceso de las funciones asignadas
end

if (p==1)
    h=(b-a)/n;              %Calculo de intervalos segun el rango entregado
    sum_I=0;                %Inicializacion de la Sumatoria de la Integral del Trapecio
    sum_E=0;
    A_I=zeros(1,4);         %Inicializacion de la Matriz de Integracion
    %---------------------------------------------------------------------------------------------------------------------------------
    f_v=integral(f,a,b);    %Calculo del valor exacto de la integral
    %---------------------------------------------------------------------------------------------------------------------------------
    %METODO DEL TRAPECIO
    for i=1:1:n                                       %Inicio del ciclo for para el Metodo del Trapecio
        A_I(i+1,1)=i;                                   %Asignacion de posiciones para la Tabla de Integracion
        A_I(i+1,2)=a+(i*h);                             %Asignacion del los intervalos segun el valor de n
        A_I(i+1,3)=f(a+(i*h));                          %Asignacion del valor de la funcion dentro del intervalo analizado
        I_t = (h/2)*(f(a+(i*h)) + f(a+((i+1)*h)));      %Calculo de la integral por el Metodo del Trapecio
        sum_I = sum_I + I_t;                            %Sumatoria para el valor de la integral en el intervalo analizado
        A_I(i+2,4) = real(sum_I);                             %Asignacion del valor de la sumatoria a la Matriz de Integracion
        df2 = diff(f,x,2);                              %Calculo de la derivada de segundo grado de la funcion
        I_v = int(df2,x,(a+(i*h)),(a+((i+1)*h)));       %Calculo del valor de la integral de la segunda derivada en el rango analizado
        E_t = (1/12)*((I_v*((a+(i+1)*h)-(a+(i*h)))^3)/((a+(i+1)*h)-a+(i*h)));   %Calculo del error local del metodo del trapecio
        sum_E = sum_E + abs(real(E_t));                            %Sumatoria para el error local del metodo
        A_I(i+1,5) = sum_E;
    end                                                 %Fin del ciclo for para el Metodo del Trapecio
    %---------------------------------------------------------------------------------------------------------------------------------
    A_I(end,1)=i+1;                                     %Asignacion de la ultima posicion de la matriz de integracion
    A_I(end,2)=a+((i+1)*h);                             %Asignacion del valor del ultimo intervalo del metodo
    A_I(end,3)=f(a+((i+1)*h));                          %Asignacion del valor del ultimo valor de la funcion en el ultimo intervalo
    %---------------------------------------------------------------------------------------------------------------------------------
    Ea_f = abs(f_v-sum_I);                              %Error absoluto del metodo referente al valor real
    Er_f = (abs(f_v-sum_I)/f_v)*100;                    %Error relativo del metodo referente al valor real
    %---------------------------------------------------------------------------------------------------------------------------------
    Er(1,1)=Ea_f;                                       %Asignacion del error absoluto a la Matriz de errores
    Er(1,2)=Er_f;                                       %Asignacion del error relativo a la Matriz de errores
    %---------------------------------------------------------------------------------------------------------------------------------
    T1t=array2table(A_I,'VariableNames',{'i','x_i','fx_i','Sumatoria_Trapecio','Error_Local'});      %Generacion de la tabla de Integracion del metodo del trapecio
    T2t=array2table(Er,'VariableNames',{'Error_Absoluto','Error_Relativo'});           %Generacion de la tabla de Errores del metodo del Trapecio
        
    %---------------------------------------------------------------------------------------------------------------------------------
    V_iniciales={'n';'h';'a';'b'};              %Asignacion de Valores Ingresados
    V_1(1,1)=n;
    V_1(2,1)=h;
    V_1(3,1)=a;
    V_1(4,1)=b;
    T3=table(V_iniciales,V_1);                  %Generacion de Tabla de Valores Iniciales Ingresados    
    %-------------------------------------------------------------------------------------------------------------------------------------
    %METODO GAUSS LEGENDRE
    n_GL = n+1;
    [z,w]=Gauss(n_GL);
    sumGL = 0;
    A_IGL = zeros(1,4);
    for i=1:1:n_GL
        fvalGL = ((b-a)/2)*z(i)+((a+b)/2);
        sumGL = (w(i)*f(fvalGL))+sumGL;
        A_IGL(i,1) = i;
        A_IGL(i,2) = z(i);
        A_IGL(i,3) = w(i);
        A_IGL(i,4) = ((b-a)/2)*sumGL;
    end
    Ea_GL = abs(f_v-A_IGL(end,4));                              %Error absoluto del metodo referente al valor real
    Er_GL = (abs(f_v-A_IGL(end,4))/f_v)*100;                    %Error relativo del metodo referente al valor real
    %----------------------------------------------------------------------
    Er(1,1)=Ea_GL;
    Er(1,2)=Er_GL;
    %----------------------------------------------------------------------
    T1GL = array2table(A_IGL,'VariableNames',{'i','z_i','w_i','Sumatoria_GL'});
    T2GL = array2table(Er,'VariableNames',{'Error_Absoluto','Error_Relativo'});
    Vf(5,1) = {A_IGL(end,4)};
    
    %METODO DE SIMPSON 1/3    
    if (rem(n,2)~=0 || n<2 || mod(n,1)~=0)        %Validacion de las condiciones de n para realizar el metodo de Simpson
        %---------------------------------------------------------------------------------------------------------------------------------
        Vf(1,1) = {real(sum_I)};                                                    %Asignacion del Valor de la Integral por el metodo del Trapecio
        Vf(2,1) = {'n No es Par'};                                            %Validacion Metodo Simpson
        Vf(4,1) = {f_v};                                                      %Asignacion del Valor de la Integral Exacta
        ES1=1;                                                                %Validacion del Metodo de Simpson 1/3
        %---------------------------------------------------------------------------------------------------------------------------------
        disp('------------------------------------------------------------------------------------');
        disp('Funcion ingresada')
        disp(f1)
        disp('------------------------------------------------------------------------------------');
        disp('Tabla de Valores Ingresados para la Resolucion por los Dos Metodos');
        disp(T3)
        disp('------------------------------------------------------------------------------------');
        disp('Tabla de Integracion para el Metodo del Trapecio');
        disp(T1t)
        disp('------------------------------------------------------------------------------------');
        disp('Tabla de Errores Relativos y Absolutos del Metodo del Trapecio');
        disp(T2t);
        disp('------------------------------------------------------------------------------------');
        disp('Tabla de Integracion Gauss Legendre');
        disp(T1GL)
        disp('------------------------------------------------------------------------------------');
        disp('Tabla de Errores Absolutos y Relativos del metodo de Gauss Legendre');
        disp(T2GL)
        disp('------------------------------------------------------------------------------------');
    else
        h=(b-a)/n;                  %Calculo de los intervalos segun el n asignado
        n_veces=n/2;                %Calculo de los intervalos contados de 2 en 2
        x_0 = a;                    %Valor inicial para el metodo de Simpson
        x_1 = a+h;                  %Segundo valor para el metodo de Simpson
        x_2 = a+2*h;                %Tercer valor para el metodo de Simpson
        sum_Is = 0;                 %Inicializacion para la sumatoria del metodo de Simpson
        sum_Es = 0;
        A_Is = zeros(1,4);          %Inicializacion de la matriz 
        %---------------------------------------------------------------------------------------------------------------------------------
        for i = 1:1:n_veces                                 %Inicializacion del ciclo for para el calculo del Metodo de Simpson
            I_s = ((h)*((f(x_0)+4*f(x_1)+f(x_2))/3));       %Calculo del Metodo de Simpson segun el metodo asignado
            sum_Is = sum_Is +I_s;                           %Sumatoria de la Integral segun el metodo asignado
            %-----------------------------------------------------------------------------------------------------------------------------
            A_Is(1+(2*i),4) = sum_Is; %Redireccionamiento de la posicion de la sumatoria
            df4 = diff(f,x,4);                  %Valor de la cuarta derivada
            I_v = int(df4,x,x_0,x_2);           %Valor promedio de la integral
            E_ts = (((-(h)^5)/2880)*I_v);       %Valor del error local de la integral
            sum_Es = sum_Es+abs(real(E_ts));    %Valor del sumatorio del error
            A_Is(1+(2*i),5) = sum_Es;
            %-----------------------------------------------------------------------------------------------------------------------------
            x_0=x_2;            %Cambio de posiciones para el nuevo ciclo
            x_1=x_2+h;          
            x_2=x_2+(2*h);
            
        end
        %---------------------------------------------------------------------------------------------------------------------------------
        for i=0:1:n                         %Inicio del ciclo para llenado de la tabla de integracion del Metodo de Simpson
            A_Is(i+1,1)=i;                  %Posicion 1
            A_Is(i+1,2)=a+(i*h);            %Posicion 2
            A_Is(i+1,3)=f(a+(i*h));         %Posicion 3
        end                                 %Fin del ciclo for
        %---------------------------------------------------------------------------------------------------------------------------------
        Ea_f = abs(f_v-sum_Is);                 %Calculo del Error absoluto del Metodo vs el Valor Real
        Er_f = (abs(f_v-sum_Is)/f_v)*100;       %Calculo del Error relativo del Metodo vs el Valor Real
        %---------------------------------------------------------------------------------------------------------------------------------
        Er(1,1)=Ea_f;                           %Asignacion del error absoluto del Metodo en la matriz de Errores
        Er(1,2)=Er_f;                           %Asignacion del error relativo del Metodo en la matriz de Errores
        %---------------------------------------------------------------------------------------------------------------------------------
        T1s=array2table(A_Is,'VariableNames',{'i','x_i','fx_i','Sumatoria_Simpson','Error_Local'});  %Generacion de la tabla de Integracion de Simpson
        T2s=array2table(Er,'VariableNames',{'Error_Absoluto','Error_Relativo'});        %Generacion de la Tabla de Errores del Metodo de Simpson
        Vf(1,1) = {real(sum_I)};                                                    %Asignacion del Valor de la Integral por el metodo del Trapecio
        Vf(2,1) = {sum_Is};                                                   %Asignacion del Valor de la Integral por el metodo de Simpson
        Vf(4,1) = {f_v};                                                      %Asignacion del Valor de la Integral Exacta
                                              
        %----------------------------------------------------------------------------------------------------------------------------------
        disp('------------------------------------------------------------------------------------');
        disp('Funcion ingresada')
        disp(f1)
        disp('------------------------------------------------------------------------------------');
        disp('Tabla de Valores Ingresados para la Resolucion');
        disp(T3)
        disp('------------------------------------------------------------------------------------');
        disp('Tabla de Integracion para el Metodo del Trapecio');
        disp(T1t)
        disp('------------------------------------------------------------------------------------');
        disp('Tabla de Errores Relativos y Absolutos del Metodo del Trapecio');
        disp(T2t);
        disp('------------------------------------------------------------------------------------');
        disp('Tabla de Integracion para el Metodo de Simpson');
        disp(T1s);
        disp('------------------------------------------------------------------------------------');
        disp('Tabla de Errores Relativos y Absolutos del Metodo de Simpson');
        disp(T2s);
        disp('------------------------------------------------------------------------------------');
        disp('Tabla de Integracion Gauss Legendre');
        disp(T1GL)
        disp('------------------------------------------------------------------------------------');
        disp('Tabla de Errores Absolutos y Relativos del metodo de Gauss Legendre');
        disp(T2GL)
        disp('------------------------------------------------------------------------------------');
        
        
        
        
    end             %FIN METODO SIMPSON
    %METODO DE SIMPSON 3/8
    %--------------------------------------------------------------------------------------------------------------------------------------
    if rem(n,3)~=0 || n<3 || mod(n,1)~=0
        %---------------------------------------------------------------------------------------------------------------------------------
        Vf(3,1) = {'n No es multiplo de 3'};                                                                                         %Generacion de la Tabla de Valores finales
        ES3=1;
        %---------------------------------------------------------------------------------------------------------------------------------
        
        
    else
        n_veces = n/3;
        x_0 = a;                %valores de cada uno de los intervalos equidistantes
        x_1 = a+h;              %valor del punto X1
        x_2 = a+2*h;            %Valor del punto X2
        x_3 = a+3*h;            %Valor del punto final
        sum_Is3=0;                %Sumatoria integral
        sum_Es3=0;
        A_Is3 = zeros(3,4);       %Inicializacion del vector A_I
        %----------------------------------------------------------------------------------------------------------------------------------
        for i=0:1:n_veces-1                                     %For para llenado de tabla integracion
            Is3 = (((3*h)/8)*(f(x_0)+3*f(x_1)+3*f(x_2)+f(x_3)));    %Valor de la integral en el intervalo
            sum_Is3=sum_Is3+Is3;                                    %sumatorio de la integral
            A_Is3(4+(3*i),4) = sum_Is3;                         %Valor del sumatorio de la integral
            %-------------------------------------------------%
            df4 = diff(f,x,4);                 %Valor de la cuarta derivada
            I_v = int(df4,x,x_0,x_3);           %Valor promedio de la integral
            E_t = (((-(b-a)^5)/6480)*I_v);      %Valor del error local de la integral
            sum_Es3=sum_Es3+E_t;                %Sumatoria del error local de la integral
            A_Is3(4+(3*i),5) = sum_Es3;         %Asignacion del error
            %-------------------------------------------------%
            x_0=x_3;        %Reemplazo de las variables.
            x_1=x_3+h;
            x_2=x_3+2*h;
            x_3=x_3+3*h;
        end
        for i=0:1:n                         %Inicio del ciclo para llenado de la tabla de integracion del Metodo de Simpson
            A_Is3(i+1,1)=i;                  %Posicion 1
            A_Is3(i+1,2)=a+(i*h);            %Posicion 2
            A_Is3(i+1,3)=f(a+(i*h));         %Posicion 3
        end                                 %Fin del ciclo for 
        
        T1s3=array2table(A_Is3,'VariableNames',{'i','x_i','fx_i','Sumatoria_Simpson3','Error_Local'});  %Generacion de la tabla de Integracion de Simpson
        T2s3=array2table(Er,'VariableNames',{'Error_Absoluto','Error_Relativo'});        %Generacion de la Tabla de Errores del Metodo de Simpson
        Vf(3,1) = {sum_Is3};   
        
        %----------------------------------------------------------------------------------------------------------------------------------
        
        
        %------------------------------------------MUESTRA DE RESULTADOS-------------------------------------------------------------------
        
        disp('Tabla de Integracion para el Metodo de Simpson 3/8');
        disp(T1s3)
        disp('------------------------------------------------------------------------------------');
        disp('Tabla de Errores Relativos y Absolutos del Metodo de Simpson 3/8');
        disp(T2s3);
        disp('------------------------------------------------------------------------------------');
        %----------------------------------------------------------------------------------------------------------------------------------
        
    end
    
    %Metodo de Boole
    if (rem(n,4)==0 && n>3)
        h = (b-a)/n;
        n_veces = n/4;
        x_0 = a;
        x_1 = a+h;
        x_2 = a+2*h;
        x_3 = a+3*h;
        x_4 = a+4*h;
        sum_IB = 0;
        A_IB = zeros(5,4);
        for i = 0:1:n_veces-1
            I_B = ((2*h)/45)*(7*f(x_0)+32*f(x_1)+12*f(x_2)+32*f(x_3)+7*f(x_4));
            sum_IB = I_B + sum_IB;
            A_IB(5+(4*i),4) = sum_IB;
            %--------------------------------------------------------------
            x_0 = x_4;
            x_1 = x_4+h;
            x_2 = x_4+2*h;
            x_3 = x_4+3*h;
            x_4 = x_4+4*h;
        end
        for i = 0:1:n
            A_IB(i+1,1)=i;
            A_IB(i+1,2)=a+(i*h);
            A_IB(i+1,3)=f(a+(i*h));
        end
        Ea_B=(f_v-sum_IB);
        Er_B=(f_v-sum_IB)/f_v;
        %------------------------------------------------------------------
        T_EB(1,1)=Ea_B;
        T_EB(1,2)=Er_B;
        %------------------------------------------------------------------
        T1B=array2table(A_IB,'VariableNames',{'i','x_i','fx_i','Sumatoria_de_Boole'});
        T2B=array2table(T_EB,'VariableNames',{'Error_Absoluto','Error_Relativo'});
        %------------------------------------------------------------------
        Vf(6,1) = {sum_IB};
        Variables_F = {'I_Trapecio';'I_Simpson 1/3';'I_Simpson 3/8';'I_real';'Gauss_Legendre';'I_Boole'};
        Tf = table(Variables_F,Vf);
        
        %------------------------------------------------------------------
        disp('----------------------------------------------------------------------------------------------------------------------')
        disp('Tabla del Metodo de Boole')
        disp(T1B)
        disp('----------------------------------------------------------------------------------------------------------------------')
        disp('Tabla de Errores Absolutos y Relativos de Boole')
        disp(T2B)
        disp('----------------------------------------------------------------------------------------------------------------------')
        disp('Tabla de Comparativa de los Valores Obtenidos de los Metodos vs el Real');
        disp(Tf);
        disp('------------------------------------------------------------------------------------');
    else
        Vf(6,1) = {'No se realiza Boole'};
        Variables_F = {'I_Trapecio';'I_Simpson 1/3';'I_Simpson 3/8';'I_real';'Gauss_Legendre';'I_Boole'};
        Tf = table(Variables_F,Vf);
        disp('Tabla de Comparativa de los Valores Obtenidos de los Metodos vs el Real');
        disp(Tf);
        disp('------------------------------------------------------------------------------------');
    end
    
    %METODOS CONJUGADOS
    if (ES1==1 && ES3==1 && n>4)           %Validacion del metodo Conjugado
        disp('Como no se cumplen los metodos de simpson 1/3 y 3/8, se procede a realizar el metodo conjugado')
        if rem(n,3)==2               %Primer metodo conjugado
            %SIMPSON 3/8 y 1/3 FINAL
            n3c=(n-2)/3;             %Intervalos a analizar
            x_0c = a;                %valores de cada uno de los intervalos equidistantes
            x_1c = a+h;              %valor del punto X1
            x_2c = a+2*h;            %Valor del punto X2
            x_3c = a+3*h;            %Valor del punto final
            sum_Isc=0;                %Sumatoria integral
            A_Isc = zeros(3,4);       %Inicializacion del vector A_I
            %------------------------------------------------------------------------------------------------------------------------------
            for i=0:1:n3c-1                                                 %For para llenado de tabla integracion
                Isc = (((3*h)/8)*(f(x_0c)+3*f(x_1c)+3*f(x_2c)+f(x_3c)));    %Valor de la integral en el intervalo
                sum_Isc=sum_Isc+Isc;                                        %sumatorio de la integral
                A_Isc(4+(3*i),4) = sum_Isc;                                 %Valor del sumatorio de la integral
                %--------------------------------------------------------------------------------------------------------------------------
                x_0c=x_3c;        %Reemplazo de las variables.
                x_1c=x_3c+h;
                x_2c=x_3c+2*h;
                x_3c=x_3c+3*h;
            end
            %-------------------------------------------------------------------------------------------------------------------------------
            %PARA EL ULTIMO INTERVALO SIMPSON 1/3
            Isc = ((h)*((f(x_0c)+4*f(x_1c)+f(x_2c))/3));        %Simpson 1/3 intervalo final
            sum_Isc=sum_Isc+Isc;                                %Sumatoria metodo conjugado final
            A_Isc(end+2,4)=sum_Isc;                             %Asignacion de la posicion final
            for i=0:1:n                                         %Inicio del ciclo para llenado de la tabla de integracion del Metodo de Simpson Conjugado
                A_Isc(i+1,1)=i;                                 %Posicion 1
                A_Isc(i+1,2)=a+(i*h);                           %Posicion 2
                A_Isc(i+1,3)=f(a+(i*h));                        %Posicion 3
            end                                                 %Fin del ciclo for
            Eac=abs(f_v-sum_Isc);                               %Errores Absolutos Metodo de Simpson Conjugado
            Erc=abs(f_v-sum_Isc)/f_v;                           %Errores Relativos Metodo de Simpson Conjugado
            %--------------------------------------------------------------------------------------------------------------------------------
            T_Ec(1,1)=Eac;                                      %Generaciones de Tablas
            T_Ec(1,2)=Erc;
            T1sc=array2table(A_Isc,'VariableNames',{'i','x_i','fx_i','Simpson_Conjugado'});
            T2sc=array2table(T_Ec,'VariableNames',{'Error_Absoluto','Error_Relativo'});
            T_C(1,1)=Vf(1,1);
            T_C(2,1)={sum_Isc};
            T_C(3,1)=Vf(4,1);
            T_C(4,1)=Vf(5,1);
            V_c={'I_trapecio';'I_Conjugado';'I_Real';'I_GaussL'};
            TC=table(V_c,T_C);
            
            %--------------------------------------------------------------------------------------------------------------------------------
            %Impresion Metodo de Simpson Conjugado
            disp('Tabla del Metodo Conjugado Simpson 3/8 y 1/3')
            disp(T1sc)
            disp('----------------------------------------------------------------------------------------------------------------------')
            disp('Tabla de Errores del Metodo Conjugado')
            disp(T2sc)
            disp('----------------------------------------------------------------------------------------------------------------------')
            disp('Tabla Comparativa Metodo del Trapecio vs Metodo Simpson Conjugado')
            disp(TC)
        else
            %METODO SIMPSON 1/3 y 3/8 final
            h=(b-a)/n;                  %Calculo de los intervalos segun el n asignado
            nc=n/2;                     %Calculo de los intervalos contados de 2 en 2
            x_0c = a;                    %Valor inicial para el metodo de Simpson 1/3
            x_1c = a+h;                  %Segundo valor para el metodo de Simpson 1/3
            x_2c = a+2*h;                %Tercer valor para el metodo de Simpson 1/3
            sum_Isc = 0;                %Inicializacion para la sumatoria del metodo de Simpson
            A_Isc = zeros(1,4);         %Inicializacion de la matriz
            for i = 1:1:nc-1                                 %Inicializacion del ciclo for para el calculo del Metodo de Simpson
                I_sc = ((h)*((f(x_0c)+4*f(x_1c)+f(x_2c))/3));       %Calculo del Metodo de Simpson segun el metodo asignado
                sum_Isc = sum_Isc +I_sc;                           %Sumatoria de la Integral segun el metodo asignado
                %-----------------------------------------------------------------------------------------------------------------------------
                A_Isc(1+(2*i),4) = sum_Isc; %Redireccionamiento de la posicion de la sumatoria
                %-----------------------------------------------------------------------------------------------------------------------------
                x_0c=x_2c;            %Cambio de posiciones para el nuevo ciclo
                x_1c=x_2c+h;          
                x_2c=x_2c+(2*h);
            end
            %Intervalo final Simpson 3/8 
            x_3c=x_2c+h;                                                %Ultima posicion simpson 3/8 
            I_sc = (((3*h)/8)*(f(x_0c)+3*f(x_1c)+3*f(x_2c)+f(x_3c)));   %Formula simpson 3/8 Intervalo Final Conjugado
            sum_Isc=sum_Isc+I_sc;                                       %Valor de la Integral Final metodo de Simpson
            A_Isc(end+3,4)=sum_Isc;                                     %Asignacion del valor de la integral final 
            %----------------------------------------------------------------------------------------------------------------------------------
            Eac=abs(f_v-sum_Isc);                                       %Error absoluto metodo conjugado
            Erc=abs(f_v-sum_Isc)/f_v;                                   %er
            %----------------------------------------------------------------------------------------------------------------------------------
            for i=0:1:n                          %Inicio del ciclo para llenado de la tabla de integracion del Metodo de Simpson
                A_Isc(i+1,1)=i;                  %Posicion 1
                A_Isc(i+1,2)=a+(i*h);            %Posicion 2
                A_Isc(i+1,3)=f(a+(i*h));         %Posicion 3
            end                                  %Fin del ciclo for
            T_Ec(1,1)=Eac;
            T_Ec(1,2)=Erc;
            T1sc=array2table(A_Isc,'VariableNames',{'i','x_i','fx_i','Simpson_Conjugado'});
            T2sc=array2table(T_Ec,'VariableNames',{'Error_Absoluto','Error_Relativo'});
            T_C(1,1)=Vf(1,1);
            T_C(2,1)={sum_Isc};
            T_C(3,1)=Vf(4,1);
            T_C(4,1)=Vf(5,1);
            V_c={'I_trapecio';'I_Conjugado';'I_Real';'I_GaussL'};
            TC=table(V_c,T_C);
            %--------------------------------------------------------------------------------------------------------------------------------
            disp('Tabla del Metodo Conjugado Simpson 1/3 y 3/8')
            disp(T1sc)
            disp('----------------------------------------------------------------------------------------------------------------------')
            disp('Tabla de Errores del Metodo Conjugado')
            disp(T2sc)
            disp('----------------------------------------------------------------------------------------------------------------------')
            disp('Tabla Comparativa Metodo del Trapecio vs Metodo Simpson Conjugado')
            disp(TC)
        end
        
    end
    subplot(2,1,1)
    fp = fplot(f,[a b]);
    title('Representacion de la Funcion a Integrar');
    xlabel('Eje X')
    ylabel('Eje Y')
    fp.LineStyle = ':';
    fp.Color = 'k';
    fp.Marker = 'x';
    fp.MarkerEdgeColor = 'b';
    hold on
    plot([a,b],[0,0],'k')
    subplot(2,1,2)
    area(linspace(a,b,500),f(linspace(a,b,500)))
    title('Area bajo la Curva a Calcular')
    xlabel('Eje X')
    ylabel('Eje Y')
    
    toc;
    disp('Tiempo de Convergencia es: ')
    disp(toc)
   
    
end

