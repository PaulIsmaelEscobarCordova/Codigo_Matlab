% PROGRAMA DE LA BISECCION
function c= met_biseccion(f,a,b)

fx=inline(f)
 
    while abs(b-a)>0.00001
        if f(a)*f(b)<0
            c=(a+b)/2
            if f(a)*f(c)<0
                b=c
            else
                a=c
            end
        else 
            disp('no existe un 0 en f')
            return
        
        end
    disp('El 0 de la f es')
    
    end