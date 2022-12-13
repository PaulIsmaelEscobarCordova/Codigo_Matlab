function fdiffin(t0,y0,tf)
delta=(tf-t0)/10;%delta para pasos
syms y;%variable simbolica
%manerda de generar la EDO
F=@(x,y)(sin(x^2)+cos(y^2));%funcion para ode 45
[x2,y2]=ode45(F,t0:delta:tf,y0);%solucion de edo
syms ya yb yc yd ye yf yg yh yi;%variables sibolicas para sistema de ecuaciones
%edo por diferencias finitas
%Sistema de Ecuacion No lineales
ecu1=yb-y0-2*delta*cos(ya^2)==2*delta*sin(0.05^2);
ecu2=yc-ya-2*delta*cos(yb^2)==2*delta*sin(0.1^2);
ecu3=yd-yb-2*delta*cos(yc^2)==2*delta*sin(0.15^2);
ecu4=ye-yc-2*delta*cos(yd^2)==2*delta*sin(0.20^2);
ecu5=yf-yd-2*delta*cos(ye^2)==2*delta*sin(0.25^2);
ecu6=yg-ye-2*delta*cos(yf^2)==2*delta*sin(0.3^2);
ecu7=yh-yf-2*delta*cos(yg^2)==2*delta*sin(0.35^2);
ecu8=yi-yg-2*delta*cos(yh^2)==2*delta*sin(0.40^2);
ecu9=y2(11)-yh-2*delta*cos(yi^2)==2*delta*sin(0.45^2);
%solucion al sistema de ecuaciones  no lineales
[r1 r2 r3 r4 r5 r6 r7 r8 r9]=solve(ecu1,ecu2,ecu3,ecu4,ecu5,ecu6,ecu7,ecu8,ecu9);
r=[y0 r1 r2 r3 r4 r5 r6 r7 r8 r9 y2(11)];%aumento de vector con putos inicial y final
%calculo de errores
for i=1:1:11
    errorA(i)=(y2(i)-r(i));
    errorR(i)=errorA(i)/y2(i);
    iter(i)=i;
end
errorR(1)=0;
iteracion=iter';
X=x2;
Y=y2;
Yaprox=double(r');
eAbsoluto=double(errorA');
eRelativo=double(errorR');
%generacion de la tabla
Data=table(iteracion,X,Y,Yaprox,eAbsoluto,eRelativo)
x=t0:0.05:tf;%x para plot
%Graficas
plot(x,r)
hold on
plot(x2,y2)
legend('EDO Diferencias','EDO Exacta')
xlabel('x')
ylabel('y')
grid on
end
