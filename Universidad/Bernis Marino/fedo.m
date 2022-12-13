function fedo(t0,y0,tf)
delta=(tf-t0)/10;%delta para pasos
syms y;%variable simbolica
%manerda de generar la EDO
F=@(x,y)(cos(x^2)+sin(y^2));%funcion para ode 45
[x2,y2]=ode45(F,t0:delta:tf,y0);%solucion de edo
y(1)=y0;
x(1)=t0;
f(1)=sin(x(1)^2)+cos(y(1)^2);
%iteraciones para generar Y aproximada por metodo Euler
for i=2:1:11
    y(i)=y(i-1)+delta*(f(i-1));
    x(i)=x(i-1)+delta;
    f(i)=sin(x(i)^2)+cos(y(i)^2);
end
%calculo de errores
for i=1:1:11
    errorA(i)=(y2(i)-y(i));
    errorR(i)=errorA(i)/y2(i);
    iter(i)=i;
end
errorR(1)=0;
iteracion=iter';
X=x2;
Y=y2;
Yaprox=double(y');
eAbsoluto=double(errorA');
eRelativo=double(errorR');
%generacion de la tabla
Data=table(iteracion,X,Y,Yaprox,eAbsoluto,eRelativo)
x=t0:0.05:tf;%x para plot
%Graficas
plot(x,y)
hold on
plot(x2,y2)
legend('EDO Diferencias','EDO Exacta')
xlabel('x')
ylabel('y')
grid on
end