%% PROGRAMA DE LA INTEGRACION NUMERICA COMPUESTA DE SIMPSON 1/3 COMPUESTA
function int=metodo_Simpson(f,a,b)
% numero de subintervalos
% Al n hay que ponerle en la función 
n=4; % ESTABA 50
fx=inline(f);
h=(b-a)/n;
    for i=1:n+1
        x(i)=a+(i-1)*h;
    end
    R=fx(x(1))+fx(x(n+1));
    sum=0;
    for i=2:2:n
        sum=sum+4*fx(x(i));
    end
    sum1=0;
    for i=3:2:n-1
        sum1=sum1+2*fx(x(i));
    end
    int=(R+sum+sum1)*(h/3);
end