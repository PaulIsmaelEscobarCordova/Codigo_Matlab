function fdiff(fx, n, xi,h,t) 
syms x;%Creo variable simbolica de x
der = diff(fx); %defino mi derivada
flag = true; %creo una variable verdadera

if der == 0
    disp('funcion incorrecta'); %Restricciones de la funcion
    flag = false; %declaracion de banderas
end

if n < 0 
    disp('Los valores de n debe ser mayor a 0')%Restricciones de la funcion
    flag = false; %declaracion de banderas
end

if h < 0 || h > 1
    disp('Valor de h muy grande')%Restricciones de la funcion
    flag = false; %declaracion de banderas
end

if xi == Inf 
    disp('x0 no esta dentro del dominio de la funcion')%Restricciones de la funcion
    flag = false; %declaracion de banderas
end

if flag == true
    %j es el caso
    for i=1:3
    for j=1:n
        if(i==1)
            Dif_Adelante(j,1)=diferenciacion(fx,j,h,xi,i); %formula de diferenciacion hacia adelante
            Raa(j,1)=abs(subs(diff(fx,n),xi)-Dif_Adelante(j,1)); %Error Abosluto
            Rra(j,1)=abs((subs(diff(fx,n),xi)-Dif_Adelante(j,1))/Dif_Adelante(j,1)); %Error relativo
            Roa(j,1)=abs(subs(diff(fx,n),xi)-Dif_Adelante(j,1))*100;   %Error de truncamiento           
        elseif(i==2)
            Dif_Atras(j,1)=diferenciacion(fx,j,h,xi,i); %formula de diferenciacion hacia atras
            Rar(j,1)=abs(subs(diff(fx,n),xi)-Dif_Atras(j,1)); %Error Abosluto
            Rrr(j,1)=abs((subs(diff(fx,n),xi)-Dif_Atras(j,1))/Dif_Adelante(j,1)); %Error relativo
            Ror(j,1)=abs(subs(diff(fx,n),xi)-Dif_Atras(j,1))*100 ;%Error de truncamiento               
        else
            Dif_Centrada(j,1)=diferenciacion(fx,j,h,xi,i);%formula de diferenciacion hacia atras
            Rac(j,1)=abs(subs(diff(fx,n),xi)-Dif_Centrada(j,1));%Error Abosluto
            Rrc(j,1)=abs((subs(diff(fx,n),xi)-Dif_Centrada(j,1))/Dif_Adelante(j,1));%Error relativo
            Roc(j,1)=abs(subs(diff(fx,n),xi)-Dif_Centrada(j,1))*100;  %Error de truncamiento
            X=[xi-5:0.1:xi+5];              
        end
    end
    end
    Error_Abs_Adelan=double(Raa);   %Convierto a una variable double mi expresion de error abs adelante                                                               
    Error_Abs_Atras=double(Rar);    %Convierto a una variable double mi expresion de error abs atras
    Error_Abs_central=double(Rac);  %Convierto a una variable double mi expresion de error abs centrada
    
    Error_rel_Adelan=double(Rra);   %Convierto a una variable double mi expresion  de error rel adelante                                                           
    Error_rel_Atras=double(Rrr);    %Convierto a una variable double mi expresion de error rel atras
    Error_rel_central=double(Rrc);  %Convierto a una variable double mi expresion error rel centrada
    
    Error_trunc_Adelan=double(Roa); %Convierto a una variable double mi expresion  de error trunc adelante                                         
    Error_trunc_Atras=double(Ror);  %Convierto a una variable double mi expresion de error trunc atras    
    Error_trunc_Centr=double(Roc);	%Convierto a una variable double mi expresion error trunc centrada
    
    RoPro=double(Roa);   %Almacenar variable Roa como punto flotante
    switch t
        case 0 
    e_nesima = (1:n).';
    T1=table(e_nesima,Dif_Adelante); %Tabla de diferenciacion
    T2=table(Error_Abs_Adelan); %Tabla de error absoluto
    T3=table(Error_rel_Adelan);%Tabla de error relativo
    T4=table(Error_trunc_Adelan);%Tabla de error trunc
    disp(T1); %se imprime la tabla de diferenciacion
    disp(T2); %se imprime la tabla de error absoluto
    disp(T3); %se imprime la tabla de error relativo
    disp(T4); %se imprime la tabla de error trunc
    
    hold on
    fplot(fx); %traza la curva definida por la función
    m_fx = subs(diff(fx,n,x),x,xi); %funcion de pendiente
    y_fx = subs(fx,x,xi); %punto en la grafica
    y = m_fx *(x-xi)+ y_fx; %recta pendiente
    fplot(y); %grafica
    m_fx = Dif_Adelante(n,1); %funcion de la pendiente hacia adelante
    y_fx = subs(fx,x,xi); %punto en la grafica 
    y = m_fx *(x-xi)+ y_fx; %recta pendiente
    plot(xi,y_fx,'o'); %graficar el punto a evaluar
    fplot(y); %grafica la recta
    hold off 
    legend('Función', 'Adelante','Pendiente'); %Para etiquetar la gráfica.
    
        case 1
    e_nesima = (1:n).';
    T1=table(e_nesima,Dif_Atras); %Tabla de diferenciacion
    T2=table(Error_Abs_Atras); %Tabla de error absoluto
    T3=table(Error_rel_Atras); %Tabla de error relativo
    T4=table(Error_trunc_Atras); %Tabla de error trunc
    disp(T1); %se imprime la tabla de diferenciacion
    disp(T2); %se imprime la tabla de error absoluto
    disp(T3); %se imprime la tabla de error relativo
    disp(T4); %se imprime la tabla de error trunc
          
    title('Diferenciacion para adelante');     %Para poner titulo a la gráfica.
    hold on
    fplot(fx); %grafica la funcion
    m_fx = subs(diff(fx,n,x),x,xi); %funcion de pendiente
    y_fx = subs(fx,x,xi);%punto en la grafica
    y = m_fx *(x-xi)+ y_fx; %recta pendiente
    fplot(y); %grafica la recta
    m_fx = Dif_Atras(n,1); %funcion de la pendiente hacia atras
    y_fx = subs(fx,x,xi); %punto en la grafica 
    y = m_fx *(x-xi)+ y_fx; %recta pendiente
    plot(xi,y_fx,'o'); %graficar el punto a evaluar
    fplot(y); %grafica la recta
    hold off
    legend('Función', 'Atras','Pendiente'); %Para etiquetar la gráfica.
    title('Diferenciacion para atras'); %Para poner titulo a la gráfica.
        case 2
    e_nesima = (1:n).';
    T1=table(e_nesima,Dif_Centrada); %Tabla de diferenciacion
    T2=table(Error_Abs_Atras); %Tabla de error absoluto
    T3=table(Error_rel_central); %Tabla de error relativo
    T4=table(Error_trunc_Centr); %Tabla de error trunc
    disp(T1); %se imprime la tabla de diferenciacion
    disp(T2); %se imprime la tabla de error absoluto
    disp(T3); %se imprime la tabla de error relativo
    disp(T4); %se imprime la tabla de error trunc
     
    hold on
    fplot(fx); %grafica la funcion
    m_fx = subs(diff(fx,n,x),x,xi); %funcion de pendiente
    y_fx = subs(fx,x,xi);%punto en la grafica
    y = m_fx *(x-xi)+ y_fx;%recta pendiente
    fplot(y);%grafica la recta
    m_fx = Dif_Centrada(n,1);%funcion de la pendiente centrada
    y_fx = subs(fx,x,xi);%punto en la grafica 
    y = m_fx *(x-xi)+ y_fx;%recta pendiente
    plot(xi,y_fx,'o'); %graficar el punto a evaluar
    fplot(y);%grafica la recta
    hold off
    legend('Función', 'Centrada','Pendiente'); %Para etiquetar la gráfica.
    title('Diferenciacion centrada'); %Para poner titulo a la gráfica.
        case 3
    e_nesima = (1:n).';
    T1=table(e_nesima,Dif_Adelante,Dif_Atras,Dif_Centrada); %Tabla de diferenciacion
    T2=table(Error_Abs_Adelan,Error_Abs_Atras,Error_Abs_central); %Tabla de error absoluto
    T3=table(Error_rel_Adelan,Error_rel_Atras,Error_rel_central); %Tabla de error relativo
    T4=table(Error_trunc_Adelan,Error_trunc_Atras,Error_trunc_Centr); %Tabla de error trunc
    disp(T1); %se imprime la tabla de diferenciacion
    disp(T2); %se imprime la tabla de error absoluto
    disp(T3); %se imprime la tabla de error relativo
    disp(T4); %se imprime la tabla de error trunc
            
    figure;subplot(1,3,1);
    hold on
    fplot(fx);%grafica la funcion
    m_fx = subs(diff(fx,n,x),x,xi);%funcion de pendiente
    y_fx = subs(fx,x,xi);%punto en la grafica
    y = m_fx *(x-xi)+ y_fx;%recta pendiente
    fplot(y);%grafica la recta
    m_fx = Dif_Adelante(n,1);%funcion de la pendiente hacia adelante
    y_fx = subs(fx,x,xi);%punto en la grafica 
    y = m_fx *(x-xi)+ y_fx;%recta pendiente
    plot(xi,y_fx,'o');%graficar el punto a evaluar
    fplot(y);%grafica la recta
    hold off
    legend('Función', 'Adelante','Pendiente'); %Para etiquetar la gráfica.
        
    title('Diferenciacion para adelante');     %Para poner titulo a la gráfica.
    subplot(1,3,2);
    hold on
    fplot(fx);%grafica la funcion
    m_fx = subs(diff(fx,n,x),x,xi);%funcion de pendiente
    y_fx = subs(fx,x,xi);%punto en la grafica
    y = m_fx *(x-xi)+ y_fx;%recta pendiente
    fplot(y);%grafica la recta
    m_fx = Dif_Atras(n,1);%funcion de la pendiente hacia atras
    y_fx = subs(fx,x,xi);%punto en la grafica 
    y = m_fx *(x-xi)+ y_fx;%recta pendiente
    plot(xi,y_fx,'o');%grafica la recta
    fplot(y);%grafica la recta
    hold off
    legend('Función', 'Atras','Pendiente'); %titulo de la grafica
    title('Diferenciacion para atras'); %titulo del metodo
        
    subplot(1,3,3); %Ubica la grafica en la posición 3
    hold on 
    fplot(fx); %gráfica la función
    m_fx = subs(diff(fx,n,x),x,xi); %funcion de pendiente
    y_fx = subs(fx,x,xi); %punto en la grafica
    y = m_fx *(x-xi)+ y_fx; %recta pendiente
    fplot(y); %gráfica la recta
    m_fx = Dif_Centrada(n,1); %funcion de la pendiente centrada
    y_fx = subs(fx,x,xi); %punto en la grafica
    y = m_fx *(x-xi)+ y_fx; %recta pendiente
    plot(xi,y_fx,'o'); %grafica la recta
    fplot(y); %grafica la recta
    hold off
    legend('Función', 'Centrada','Pendiente'); %titulo de la grafica
    title('Diferenciacion centrada'); %titulo del método
    end
end
end

function [T] = diferenciacion(fx,n,h,xi,caso)
syms x; %Creo variable simbolica de x
if(caso==1) %condicional para operar por el metodo de diferenciacion hacia adelante
    %METODO DE DIFERENCIACION HACIA ADELANTE
    d=0; %inicialización de variable
    suma_dd=0; %inicialización de variable
    for i=0:n %ciclo for
    d=(-1)^i * (factorial(n)/(factorial(i)*factorial(n-i))) * subs(fx,x,(xi+(n-i)*h)); %derivadas de la función de taylor 
    suma_dd = suma_dd + d; %suma las iteraciones
    end
      T = double(suma_dd/h^n);  %resultado en la tabla
elseif(caso==2)%condicional para operar por el metodo de diferenciacion hacia atras
    %METODO DE DIFERENCIACION HACIA ATRAS
    d=0; %inicialización de variable
    suma_da=0; %inicialización de variable
    for i=0:n %ciclo for
        d=(-1)^i * (factorial(n)/(factorial(i)*factorial(n-i))) * subs(fx,x,(xi-i*h)); %derivadas de la función de taylor 
        suma_da = suma_da + d; %suma las iteraciones
    end
    T = double(suma_da/h^n); %resultado en la tabla
    
else %condicional para operar por el metodo de diferenciacion centrada
    %METODO DE DIFERENCIACION CENTRADA
    d=0; %inicialización de variable
    suma_dc=0; %inicialización de variable
    for i=0:n %ciclo for
        d=(-1)^i * (factorial(n)/(factorial(i)*factorial(n-i))) * subs(fx,x,(xi+(n-2*i)*h));  %derivadas de la función de taylor 
        suma_dc = suma_dc + d; %suma las iteraciones
    end
    T = double(suma_dc/(2^n*h^n)); %resultado en la tabla
end
end