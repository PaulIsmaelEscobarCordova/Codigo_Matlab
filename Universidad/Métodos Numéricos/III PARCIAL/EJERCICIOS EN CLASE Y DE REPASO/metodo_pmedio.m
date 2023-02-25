%% PROGRAMA DE LA INTEGRACION NUMERICA DEL PUNTO MEDIO
function int=metodo_pmedio(f,a,b)
% numero de subintervalos
n=250;
fx=inline(f);
h=(b-a)/n;
    for i=1:n
        x(i)=a+(2*i-1)*(h/2);
    end
    %R=fx(x(1))+fx(x(n+1));
    sum=0;
    for i=1:n
        sum=sum+fx(x(i));
    end
    int=(sum)*(h);
end