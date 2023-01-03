function c=internewton(x,f)
m=length(x);
A=zeros(m,m);
A(:,1)=f';
    for j=2:m
        for k=j:m
            A(k,j)=(A(k,j-1)-A(k-1,j-1))/(x(k)-x(k-j+1));
        end
    end
    c=A(m,m);
    for k=m-1:-1:1
        c=conv(c,poly(x(k)));
        mm=length(c);
        c(mm)=c(mm)+A(k,k);
    end
        x1=x(1):0.1:x(m);
        y1=polyval(c,x1); %POLYVAL EVALUA UN POLINOMIO
        plot(x1,y1)
        grid on 
        hold on
        plot(x,f,'ro') %GRAFICA LOS PUNTOS DE ENTRADA
        hold off
end