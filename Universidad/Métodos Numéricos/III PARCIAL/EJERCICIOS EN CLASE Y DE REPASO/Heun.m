function H=Heun(f,a,b,ya,M)
% f es la funcion entre comillas simples y en mayuscula en T e Y
% a y b es el intervalo. 
% ya = es el valor de "y" en la condición inicial.
% M --> es el número de subintervalos para h no el numero de puntos. 
fx=inline(f,'T','Y');
h=(b-a)/M;
T=zeros(1,M+1);
Y=zeros(1,M+1);
T=a:h:b;
Y(1)=ya;
    for j=1:M
        k1=fx(T(j),Y(j));
        k2=fx(T(j+1),Y(j)+h*k1);
        Y(j+1)=Y(j)+(h/2)*(k1+k2);
    end
    H=[T' Y'];
    plot(T,Y)
end