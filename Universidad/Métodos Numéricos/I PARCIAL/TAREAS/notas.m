%% PROGRAMA QUE LAS NOTAS DE UN ESTUDIANTE 
%NOMBRE: PAUL ESCOBAR 
%DOCENTE: Ing. Patricio Pugarín.

%~~~~CODIGO~~~~~%

function notas(a1,a2,a3)
  n= a1+a2+a3/3;    
      
    if n>=7.5
          disp('EL ESTUDIANTE HA APROBADO LA MATERIA')
      elseif n<7.5
          disp('EL ESTUDIANTE HA REPROBADO LA MATERIA')
      else 
          disp('Error, escoja un valor.')
           
      end
    
end


