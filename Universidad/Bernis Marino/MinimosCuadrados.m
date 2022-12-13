% CODIGO PARA MINIMOS CUADRADOS. AJUSTE LINEAL - DETERMINACION DE LA GRAVEDAD - FISICA. 

x=(3:3:27)/100;
y=[3.363 2.416 2.023 1.811 1.686 1.609 1.546 1.538 1.52].^2/(4*pi^2);
hold on
%representa los datos experimentales
plot(x,y,'bo','markersize',6,'markerfacecolor','b')
%modelo de función
f_ajuste =@(a,x) a(1)./x+a(2)*x;
a0=[0.075 4.02]; %valor inicial de los parámetros
af=nlinfit(x,y,f_ajuste,a0)
%representa la función
x=linspace(0.03,0.27,100);
y=f_ajuste(af,x);
plot(x,y,'r')
title('Análisis por Mínimos Cuadrados')
xlabel('x (m)')
ylabel('P^2/(4·\pi^2)')
hold off