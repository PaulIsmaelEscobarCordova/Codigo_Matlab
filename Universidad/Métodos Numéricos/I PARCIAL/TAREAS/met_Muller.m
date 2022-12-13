function x3 = met_Muller(f,x0,x1,x2,n)

x3= x2+1;
fx=inline(f);
cont=0;
    while abs((x2-x1)/x2)>0.00001 
        for i=1:n
        f0=fx(x0);
        f1=fx(x1);
        f2=fx(x2);
        % REALIZAMOS LAS APROXIMAXIONES
        h0=x1-x0;
        h1=x2-x1;
        d0=(f1-f0)/(x1-x0);
        d1=(f2-f1)/(x2-x1);
        % CALCULAMOS LOS COEFICIENTES
        a=(d1-d0)/(h1+h0);
        b=a*h1+d1;
        c=f2;
        % CALCULAMOS EL DISCRIMINANTE
        disc=sqrt(b^2-4*a*c);
            if abs(b+disc)>abs(b-disc)
                disc=disc;
            else 
                disc=-disc;
            end
            x3= x2+(-2*c)/(b+disc)
            x0=x1;
            x1=x2;
            cont=cont+1;
        end
    end
    disp(cont)
    format long
end