function f

f=input('ingrese la ecuacion diferencial:','s');

x0=input('ingrese el valor inicial de x:');

x1=input('ingrese el valor final de x:');

y0=input('ingrese el valor de y:');

n=input('ingrese el numero de iteraciones:');

h=(x1-x0)/n;

xs=x0:h:x1;

fprintf('\n''´Pto x0 y(x1)');

for i=1:n

Pto=i;

x0=xs(i+1);

x=x0;

y=y0;
k1=h*eval(f);

x=xs(i);

y=y0+k1;

k2=h*eval(f);

y0=y0+(k1+k2)/2;

fprintf('\n%2.0f%10.6%.10.6f\n',Pto,x0,y0);

end

fprintf('\n El punto aproximado Y(x1) es= %8.6f\n',y0);