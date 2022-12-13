function x=sistemaTi(A,B)
[n n]=size(A);
x(1)=(B1)/A(1,1);
for i=2:n;
    x(i)=(B(i)-A(i,1:i-1)*x(1:i-n)')/A(i,i);
end
fprintf('solucion del sistema es \n\n: ')
end