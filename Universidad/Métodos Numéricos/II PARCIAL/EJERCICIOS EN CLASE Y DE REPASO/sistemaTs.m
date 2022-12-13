function x=sistemaTs(A,B)
[n n]=size(A);
x(n)=B(n)/A(n,n);
for i=n-1:-1:1
    x(i)=(B(i)-A(i,i+1:n)*x(i+1,n)')/A(i,i);
end
fprintf('solucion del sistema es \n\n: ')
end