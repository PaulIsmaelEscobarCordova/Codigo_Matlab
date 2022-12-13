%% PROGRAMA QUE CALCULA LA SUMA DE LOS IMPARES DE UNA COLUMNA
%NOMBRE: PAUL ESCOBAR 
%DOCENTE: Ing. Patricio Pugarìn.

%~~~~CODIGO~~~~~%

function suc= sumaimpc(D)
[m,n]=size(D);
suc=[];
 for j=1:n
     if(mod(j,2)~=0)
       suc=[suc sum(D(:,j))];
     end
 end 
end 
 

 