function x=sistemaTs(A,b)
 Ab=[A b];
    n=length(b);
    
%incógnitas
    x=zeros(n,1);
    x(n)=Ab(n,n+1)/Ab(n,n);
    for i=n-1:-1:1 
        x(i)=Ab(i,n+1)/Ab(i,i)-Ab(i,i+1:n)*x(i+1:n)/Ab(i,i); 
    end
end