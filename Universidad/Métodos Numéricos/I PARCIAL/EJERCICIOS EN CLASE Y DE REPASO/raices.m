%% PROGRAMA QUE CALCULA LA RAIZ DE UN POLINOMIO DE PRIMER GRADO U ORDEN. 
n= fprintf('Ingrese los coeficientes de un polinomio ax+b=0 para calcular su raíz. \n');

a= input('Ingrese el coeficiente de x: ')
b= input('Ingrese el segundo coeficiente: ')

f= [a b];

r=roots(f); 

fprintf('Esta es la raíz del polinomio: \n')
disp(r)

%% PROGRAMA QUE CALCULA EL FACTORIAL DE UN NUMERO 

 valor= input('Ingrese el número que desea obtener el factorial: ')
 n=valor;
 f=n;
 
   while n>1
       n=n-1;
       f=f*n;
   end
   
   disp(['n! = ' num2str(f)])
   
 
