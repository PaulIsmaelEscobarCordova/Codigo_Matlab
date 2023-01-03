function x=sistemaTi(A,B)
[n n]=size(A);
x(1)=B(1)/A(1,1);
for i=2:n;
    x(i)=(B(i)-A(i,1:i-1)*x(1:i-1)')/A(i,i);
end
disp('solucion del sistema es: ')
end