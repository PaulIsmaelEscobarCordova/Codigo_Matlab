%% PROGRAMA DE LA INTEGRACION NUMERICA COMPUESTA DEL TRAPECIO
function int=metodo_trapecio(f,a,b,n)
% numero de subintervalos
%n=250;
fx=inline(f);
h=(b-a)/n;
    for i=1:n+1
        x(i)=a+(i-1)*h;
    end
    R=fx(x(1))+fx(x(n+1));
    sum=0;
    for i=2:n
        sum=sum+2*fx(x(i));
    end
    int=(R+sum)*(h/2);
end