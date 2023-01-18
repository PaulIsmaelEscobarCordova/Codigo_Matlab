%% Gauss Seidel Method
%% Solution of x in Ax=b using Gauss Seidel Method
% * _*Initailize 'A' 'b' & intial guess 'x'*_
%%
A=[5 -1 2 1;-2 4 1 -2;1 1 1 1;2 -3 -1 4]
b=[-1 1 4 7]'
x=[0 0 0 0]'
n=size(x,1);
normVal=Inf; 
%% 
% * _*Tolerence for method*_
tol=1e-5; itr=0;
%% Algorithm: Gauss Seidel Method
%%
while normVal>tol
    x_old=x;
    
    for i=1:n
        
        sigma=0;
        
        for j=1:i-1
                sigma=sigma+A(i,j)*x(j);
        end
        
        for j=i+1:n
                sigma=sigma+A(i,j)*x_old(j);
        end
        
        x(i)=(1/A(i,i))*(b(i)-sigma);
    end
    
    itr=itr+1;
    normVal=norm(x_old-x);
end
%%
fprintf('La solución del sistema es : \n%f\n%f\n%f\n%f in %d iterationes',x,itr);