function [xr, T] = muller(f,xr,h,c,e)

fx=inline(f);
x2=xr+h;
x1=xr;
x0=xr-h;
k=0;
sigue=1;
T=[0 0 0 0]

    while (sigue)
        k=k+1;
        h0=x1-x0;
        h1=x2-x1;
        d0=(fx(x1)-fx(x0))/h0;
        d1=(fx(x2)-fx(x1))/h1;
        a= (d1-d0)/(h1+h0);
        b=a*h1+d1;
        c=fx(x2);
        r= sqrt(b*b-4*a*c);
            if abs(b+r)>abs(b-r)
                den=b+r;
            else 
                den=b-r;
            end
            dxr=-2*c/den;
            xr=x2+dxr;
            sigue=abs(dxr)/xr>e || k<c || abs(fx(xr))>e;
            
            x0= x1;
            x1=x2;
            x2=xr;
            
            T(k,:)=[x0 x1 x2 fx(xr)]; 
    end
    if k==c
        xr='No converge'
    end
end