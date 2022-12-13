%% PROGRAMA QUE UNA SUMATORIA 
%NOMBRE: PAUL ESCOBAR 
%DOCENTE: Ing. Patricio Pugarín.

%~~~~CODIGO~~~~~%
function storia(n)
sum=0;
for i=0 : n
 sum=sum+(i*(1/2)^i);
end
fprintf('la sumatoria es igual a %3.4f\n',sum)
end