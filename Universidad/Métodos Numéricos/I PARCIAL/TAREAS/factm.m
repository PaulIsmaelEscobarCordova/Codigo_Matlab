%% PROGRAMA QUE CALCULA EL FACTORIAL DE UN NÚMERO CON WHILE 
%NOMBRE: PAUL ESCOBAR 
%DOCENTE: Ing. Patricio Pugarín.

%~~~~CODIGO~~~~~%

n= input('Intruzca el número para obtener el factorial: ')

    if n==0 || n == 1
        factorial = 0;
    else 
        a=n;
        factorial = 1;
        while n>1
            factorial=factorial*n;
            n = n -1;
        end 
    end
 fprintf('El factorial es %q\n') 
 factorial