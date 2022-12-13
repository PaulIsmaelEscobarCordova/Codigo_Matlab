function [x] = congruencial2( a,b,c,n,m )
%El metodo congruencial mixto genera una secuencia de numeros aleatorios
%en la cual el proximo numero aleatorio es determinado a partir del numero
%generado.
%Se parte de una semilla a >0,b la constante multiplicativa,
% c la contstante aditiva y m el modulo.
%vector(1)=mod(b*a+c,m);
vector(1)=mod(b*a+c,m);;
for k=2:n
 vector(k)=mod(b*vector(k-1)+c,m) ; 
 x=vector;
end
end
