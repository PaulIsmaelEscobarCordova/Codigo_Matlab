function P=metodoMuller(fun,x,N)
 l=0
 f=0;
  c=fun(x(3))
   b=(((((x(1)-x(3))^2)*(fun(x(2))-fun(x(3))))-((x(2)-x(3))^2)*(fun(x(1))-fun(x(3)))))/((x(1)-x(3))*(x(2)-x(3))*(x(1)-x(2)))
    a=(((((x(2)-x(3)))*(fun(x(1))-fun(x(3))))-((x(1)-x(3)))*(fun(x(2))-fun(x(3)))))/((x(1)-x(3))*(x(2)-x(3))*(x(1)-x(2)))
    x4=(x(3)-((2*c)/((b)+((b/abs(b))*sqrt((b^2)-(4*a*c))))))
%Scienceprocedures.blogspot.mx
    x0=min(x)-1:0.09:max(x)+1
    hold on
    grid on
    plot (x(1),fun(x(1)),'Ok')
    hold on
    plot (x(2),fun(x(2)),'Ok')
    hold on
    plot (x(3),fun(x(3)),'Ok')
    hold on
    plot(x0,fun(x0),'b')
    hold on
    for i=1:1:N
    if i==N
         plot (x0,R(x0),'+r')
    hold on
    end
    c=fun(x(3))
   b=(((((x(1)-x(3))^2)*(fun(x(2))-fun(x(3))))-((x(2)-x(3))^2)*(fun(x(1))-fun(x(3)))))/((x(1)-x(3))*(x(2)-x(3))*(x(1)-x(2)))
    a=(((((x(2)-x(3)))*(fun(x(1))-fun(x(3))))-((x(1)-x(3)))*(fun(x(2))-fun(x(3)))))/((x(1)-x(3))*(x(2)-x(3))*(x(1)-x(2)))
    x4=(x(3)-((2*c)/((b)+((b/abs(b))*sqrt((b^2)-(4*a*c))))))
    x(1)=x(2)
    x(2)=x(3)
    x(3)=x4;
          x0=min(x)-1:0.09:max(x)+1
    R=@(x0)((a*((x0-x(3)).^2))+(b*(x0-x(3)))+c)
    C=['k','b','y','g','r','m','k','b','y','g','r','m','k','b','y','g','r','m','k','b','y','g','r','m','k','b','y','g','r','m','k','b','y','g','r','m','k','b','y','g','r','m','k','b','y','g','r','m','k','b','y','g','r','m','k','b','y','g','r','m',]
    plot (x0,R(x0),C(i))
    hold on
end
P=x(3)
plot (P,R(P),'*r')
end