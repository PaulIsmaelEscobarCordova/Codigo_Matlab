function cont=interLagrange(x,fx)
    s1=length(x);
    s2=length(fx);
    cont=0;
        for k=1:s1
            cont=cont+fx(k)*lagrange(x,k);
        end
        x1=x(1):0.1:x(s1);
        y1=polyval(cont,x1); %POLYVAL EVALUA UN POLINOMIO
        plot(x1,y1)
        
        hold on
        plot(x,fx,'ro') %GRAFICA LOS PUNTOS DE ENTRADA
        hold off
end