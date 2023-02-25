function [m,b]=splineLineal(X)
    n=length(X(1,:));
    for i=1:n-1;
    m(i)=(X(2,i+1)-X(2,i))/(X(1,i+1)-X(1,i)); 
    b(i)=X(2,i);
    x=X(1,i):X(1,i+1);
    y=m(i)*(x-X(1,i))+b(i);
    % GRAFICAMOS LA CURVA EN SPLINE LINEAL 
    hold on; 
    plot(x,y,'g','LineWidth',2);
    end
        for i=1:n;
        hold on; 
        grid;
        plot(X(1,i),X(2,i),'*','MarkerEdegeColor','r','LineWidth',1);
        title('Interpolación por spline de primer orden');
        end
end