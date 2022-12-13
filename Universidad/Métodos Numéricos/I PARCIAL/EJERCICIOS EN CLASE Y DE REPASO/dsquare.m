% METODO DE MINIMOS CUADRADOS -- PARA CUALQUIER FUNCION
                                                                            
function dsquare(x,y) 

x=input('Introduza los valores de x: ')
y=input('Introduza los valores de y: ')

% PARAMETROS 
w1=size(x); 
w2=size(y); 

%Ajuste Lineal
O1= ones(w1(1,2),1);
F1=transpose(x); 
V1=[O1 F1];
V1t=transpose(V1);
D1=transpose(y); 
S1=V1t*V1; 
S2=V1t*D1; 
X1=S1/S2; 

%ERROR POR AJUSTE LINEAL. 
SE1=0;
  for i=1:W1(1,2)
      fx(i)=X1(1,1)+X1(2,1)*x(i); 
      e(i)=(y(i)-fx(i))^2;
      SE1=SE1+e(i);
  end

  E=SE1; 
  
  %GRAFICAS DEL METODO DE AJUSTE LINEAL
  
  G1=figure('Name','Ajuste Lineal','NumberTitle','off');
  xr=linspace(x(1,1),x(1,W1(1,2)));
  a0r=X1(1,1);
  a1r=X1(2,1);
  recta=a0r+a1r*xr;
  scatter(x,y,'filled');
  hold on 
  plot(xr,recta,'r--'); 
  hold on
  title('DATOS VS AJUSTE LINEAL')
  xlabel('x(i)'); 
  ylabel('y(i)'); 
  txt=['Ajuste lineal(Error ajuste; '  num2str(E) ')']; 
  legend('Datos originales',txt,'location','southeast'); 
  legend('boxoff'); 
  
  
  
  

