%% PRIMER PROGRAMA
v= input('Ingrese el vector: ');
s=0;
c=0;
n=length(v);
for h=1:n
  if v(h)<90
    s= s+v(h);
  else
    c = c+1; %Cuenta los elementos de un vector
  end
end 
 
disp('Esta es la suma de los elementos menores a 90: ')
disp(s)
disp('Estos son el número de elementos del vector que son mayores o iguales: ')
disp(c) 

%% SEGUNDO PROGRAMA
a= 1;
b=11;
  while a<b 
      disp('CHAO')
      a= a+1; 
  end
  disp('ESTAN 10 REPETICIONES DE CHAO')
  
  %% TERCER PROGRAMA
  n=input('Ingrese el numero de iteraciones: ')
  for i= 1:n
      disp('CHAO')
  end
  
%% CUARTO PROGRAMA MATRICES DE M,N O N,N 
fprintf('Ingresar una Matriz A \n\n')

m=input('Ingrese el número de filas de la matriz \n');
n= input('Ingrese el número de columnas de la matriz \n');

    for i=1:m
        for j=1:n 
          disp(['El elemento (',num2str(i),',',num2str(j),')'])
          A(i,j)= input('');
        end
    end
    disp('La matriz es:')
    
    A
    
    %% EJERCICIOS DE REPASO DE »LOOPS«
point = [76 85 91 65 87];
for n = 1:length(point)
    if point(n) >= 80, 
        pf(n,:) = 'pass';
    elseif point(n) >= 0, 
        pf(n,:) = 'fail';
    elseif point(n)< 0
    pf(n,:) = '????';
    fprintf('\n\a Something wrong with the data??\n');
  break;
    end
end
pf

%% Programa que calcula el logartimo natural de n ingresos 
n=0;
while n<10 
    a=input('Ingrese un número positivo: ');
        if a<=0 
            disp('El número ingresado no es positivo: ')
            disp('Este programa terminará')
           break
        end
        disp('El ln del número ingresado es: ')
        disp(log(a))
 n=n+1;
end
    disp('Chao')
    
%% Programa que calcula el logaritmo natural de n ingresos 'CONTINUE'
n=0;
while n<10 
    n=n+1;
    a=input('Ingrese un número positivo: ');
        if a<=0 
            disp('El número ingresado no es positivo: ')
            disp('Escriba el número a calcular nuevamente: ')
            
           continue
        end
        disp('El ln del número ingresado es: ')
        disp(log(a))
 
end
    disp('Usted ha ingresado 10 números ha sido un placer servirle.')
    
%% MATRIZ ALEATORIA
i=0; 
while i<3
    disp(1+5*i:5+5*i)
  i=i+1;  
end

%% PROGRAMA QUE CALCULA SUMA DE NUMEROS PARES Y SUMA DE IMPARES

sum1=0;
i=0;
s='Sí';
   
while i==n
    n= input('\n Suma de pares: 1\n, \nSuma de impares: 2\n, \nPara salir presione: S\n'); 
    
      switch n
        case 1
            for i=2:2:500; 
                sum1=sum1+i;
            end
            disp('La suma de los pares es: ')
            disp(sum1)
        case 2
            for i=1:2:499;
                sum1=sum1+i;
            end
            disp('La suma de los impares es: ')
            disp(sum1)
        case 's'
              disp('Usted ha elegido salir del programa.')
                 
        otherwise 
            disp('Este caso no existe')
      end
        break
    end  
        

    
% %% CIRCULO CON ECUACIONES PARAMETRICAS DEL CIRCULO 
% function circulo(r)
% 
% t=linspace(0,2*pi,100); 
% x=r*cos(t); 
% y=r*sin(t); 
% plot(x,y)
% 
% end 

%% FUNCIONES MATEMATICAS
fx= @(x) (exp(x).*cos(x));
fxy=@(x,y) (x.^2 + y.^2);

R1=fx(pi)-fx(2*pi);
R2=fxy(3,5)-3*fxy(2,7);

%% FUNCIONES MATEMÁTICAS
function [R1 R2]= function_1_2_var(f,w);

fx=inline(f);
fxy=inline(w,'x','y');

R1=fx(pi)-fx(2*pi);
R2=fxy(3,5)-3*fxy(2,7);

disp('Los valores de RI y R2 son: ')

end

%% PROGRAMA CON WHILE - TRUE
% El while true me permite hacer un menú cuando necesito hacer repeticiones sin 
% la necesidad de hacer una condición, de la misma manera el do-while. 
sum1=0;

while true 
    n= input('\n Suma de pares: 1,\n \n Suma de impares: 2,\n \n Para salir presione: S.\n'); 
    
      switch n
        case 1
            
            for i=2:2:500; 
                sum1=sum1+i;
            end
            disp('La suma de los pares es: ')
            disp(sum1)
        case 2
            
            for i=1:2:499;
                sum1=sum1+i;
            end
            disp('La suma de los impares es: ')
            disp(sum1)
        case 's'
            
              disp('Usted ha elegido salir del programa.')
        break
        otherwise 
            disp('Este caso no existe')
            fprintf('Debe escoger: 1 o 2 o bien s para salir. \nCualquier otro número es erróneo.')
        
      end
     
end

%%function x1 = msecante(f,x0,x1)

fx= inline(f);

x2=x1-fx(x1)*(x0-x1)/fx(x0)-fx(x1);

while abs(x2-x1)>0.00001
    x3= x2-fx(x2)*(x2-x1)/fx(x2)-fx(x1);
    
    x1=x2;
    x2=x3;

end
disp('El cero de la funcion es: ')
end


