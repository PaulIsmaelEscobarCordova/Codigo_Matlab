%% MATRIZ DE LA CONCIDION DE HILBERT
function c = matrixh(A)

c = cond(A);                                                                %El comando 'con(A)' permite encontrar
                                                                            %la condicion de una matriz en SEL   
    if c>1
        disp('La matriz está mal condicionada: ')
    elseif c<1 
        disp('La matriz está bien condicionada: ')
    end
end

%% CORRECCION DEL PROGRAMA -- MATRIZ DE HILBERT MAL CONDICIONADA
% function A= M_Hilbert(m,n)
% 
%     for i=1:n
%         for j=1:n
%             A(i,j)=1/(i+j-1);
%         end    
%     end
%     disp('La matriz resultado es: ')
%     
% end   
