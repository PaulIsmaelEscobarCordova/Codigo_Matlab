function A = mtriz(m,n)
%Definimos variables importantes para el código a realizar.
z=0;
p=0;
s=0;
fprintf('m: Es el número de filas que desea para el ejercicio\n');
fprintf('n: Es el número de columnas que desea para el ejercicio\n\n');

%Codigo a Continuación: 

 for i=1:m
    for j=1:n
        disp(['El elemento (',num2str(i),',',num2str(j),')'])
        A(i,j)= input('');
    end
end
disp('La matriz es:')
A
h=length(A);
  while z<=n;
      fprintf('Sacamos las columnas de la matriz.\n')
      fprintf('Por lo tanto aquellas son: \n\n')
       for i=1:n
           n=i;
           c=A(:,n);
           z=n+1;
           d=z;
           d=A(:,n);
          
          c
           
       end
  if c./2==0
      disp('Es otro tipo de operación');
  elseif c./2~=0
      s= s+c;
      s
  end
 end

