function [r,ea,er,ep] = bisect(f,t,n)
syms x
g= inline(f);
k=1;
% GRAFICAMOS PRIMERO LA FUNCION PARA SABER LOS PUNTOS a&b
   
    h=ezplot(g,[-20:20])
    axis([-20 20 -300 300])
    xlabel('Eje x'), ylabel('Eje y')
    title('GRAFICA DEL METODO DE BISECCION')
    grid on
    box on
    set(h,'color','r','LineWidth',1,'LineStyle','-')
    
% VAMOS A PONER LOS VALORES RESPECTIVOS PARA a&b
 
  a=input('Ingrese el valor de a: ')
  b=input('Ingrese el valor de b: ')  
  
% CALCULAMOS EL NUMERO DE ITERACIONES NECESARIAS: 
%     n0= abs(log(t)/log10(2));
%     n1=floor(n0);
%     fprintf('Se necesitan por lo tanto,aproximaamente el siguiente número de iteraciones: \n %3.2f\n',n1)
%     n=input('Ingrese el número de iteraciones: ')

   if g(a)*g(b)<0
     for i=k:n
         c= (b+a)/2;  
         ea= abs(b-a)
         er= abs(b-a)*100
         fprintf('r%d = %4f\n',i,c)                                         % Forma de imprimir r6 = xxxx
         if abs(c-b)<t || abs(c-a)<t
             break
         end
         if g(a)*g(c)<0
             b = c;
         elseif g(b)*g(c)<0
             a=c;
         end
     end
 else 
     disp('No existe la raíz')
   end
 fprintf('La raíz aproximada es: \n')
 r=c
 ep= b-a/2^n;
 fprintf('El error propio del método nos da: \n %3.2f\n',ep)
 disp('PRESENTAMOS LOS DATOS EN UNA TABLA')
 metodobiseccion={n}
 raiz=[c];
 errorabsoluto=[ea];
 errorrelativo=[er];
 errormetodo=[ep];
 T= table(metodobiseccion,raiz,errorabsoluto,errorrelativo,errormetodo)
    
end
 
 







