function f = fybo(n)
% PROGRAMA QUE CALCULA LA SERIE DE FIBONACI
% ESTUDIANTE: PAUL ESCOBAR
% CONJUNTA PRIMER PARCOIAL - METODOS NUMERICOS 

    f=zeros(1,n);
    q=zeros(1,n);
    f(1)=1; f(2)=1;
    q(1)=1; q(2)=1;
    
        for i=3:n
            f(i)= f(i-1)+f(i-2);
            q(i)= f(i)/f(i-1);
        end 
        disp('La sucesión de Fibonacci es: ')
        disp(f)
        disp('La serie de razones es: ')
        disp(q)
        disp('El error cometido es: ')
        disp(abs((1+sqrt(5))/2-q(n)))
end

