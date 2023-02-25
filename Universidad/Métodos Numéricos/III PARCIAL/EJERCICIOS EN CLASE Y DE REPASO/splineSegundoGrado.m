function sp=splineSegundoGrado(X,Y)
[n,p]=size(X);
[o,q]=size(Y);
    if p~=q
        error('Datos mal ingresados, verifique el tamaño de los vectores')
    end
    ni=q-1;
    a=1;
    b=1;
    c=1;
    d=2;
    s=[a b c];
    t=[d b 0];
    B=zeros(2*q-2,1);
    A=Y';
        for i=1:q
            a=(X(i))^2;
            b=X(i);
            H(1,:)=[a b c];
                for i=1:ni-1;
                    J(i,:)=[d*X(i+1) 1 0 -d*X(i+1) -1];
                    Z=zeros(i,1);
                end
        end
        M=zeros(3*ni);
        for i=1:ni
            M(2*i-1:2*i,3*i-2:3*i)=H(i:i+1,:);
        end
        M(1,1)=0;
        for i=1:ni
            B(2*i-1:2*i,:)=A(i:i+1,:);
        end
        for i=1:q-2
            M(2*q-2+i,((5*i-4)-(2*i-2)):((5*i)-(2*i-2)))=J(i,:);
        end
        M(2*q-1,1)=0;
        SOLUCION=M(1:{(2*q-2)+(q-1)}-1,2:((2*q-2)+(q-1)));
        sp=inv(SOLUCION)*k;
        
        plot(X,Y,'g','LineWidth',1);
        x1=[min(X):0.1:max(X)];
        Int1=interp1(X,Y,x1,'spline');
        Spl1=spline(X,Y',x1);
        plot(X,Y,x1,Int1,X,Y,'*','MarkerEdgeColor','r','LineWidth',2)
        title('Interpolacion por splines cuadrátios');
        hold on;
        grid on;
end