function A = mtriz(m,n)
%Definimos variables importantes para el c�digo a realizar.
z=0;
p=0;
s=0;
fprintf('m: Es el n�mero de filas que desea para el ejercicio\n');
fprintf('n: Es el n�mero de columnas que desea para el ejercicio\n\n');

%Codigo a Continuaci�n: 

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
      disp('Es otro tipo de operaci�n');
  elseif c./2~=0
      s= s+c;
      s
  end
 end

