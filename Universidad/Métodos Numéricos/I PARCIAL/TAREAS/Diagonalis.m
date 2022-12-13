%% PROGRAMA QUE CALCULA SI EXISTEN O NO CEROS EN LA  DIAGONAL DE UNA MATRIZ
%NOMBRE: PAUL ESCOBAR 
%DOCENTE: Ing. Patricio Pugarìn.

%~~~~CODIGO~~~~~%

n=input('Ingrese la dimension de la matriz :');
for i=1:n 
 for j=1:n 
 disp(['El elemento (',num2str(i),',',num2str(j),')']) 
 M(i,j)=input(''); 
 end
end
disp('la matriz ingresada es :')
di=diag(M); 
disp('El vector de la diagonal:') 
disp(di) 
l=length(di); 
sum=0; 
for j=1:l 
 if di(j)==0 
 sum=sum+1; 
 end
end
if sum>0
 disp(['Existen ', num2str(sum) , ' ceros en la diagonal ']); 
else
 disp('No hay ceros en la diagonal'); 
end
 
