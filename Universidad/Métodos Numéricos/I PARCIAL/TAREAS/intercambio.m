%% PROGRAMA QUE INTERCAMBIA LA DIAGONAL PRINCIPAL Y SECUNDARIA DE UNA MATRIZ
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
disp(M)
Dprin=[];
Dsec=[];
for i=1:n
 Dprin(i)=M(i,i);
end
aux=n;
for i=1:n
 Dsec(i)=M(i,aux-i+1);
end
for i=1:n
 M(i,i)=Dsec(i);
 M(i,aux-i+1)=Dprin(i);
end
disp('la matriz nueva intercambiada diagonales es :')
disp(M)


