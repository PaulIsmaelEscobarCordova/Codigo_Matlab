%% PROGRAMA EN EL CUAL REALIZA INTERCAMBIO DE FILAS

function B= Intercambiofilas(A,i,j)
    A
    B=A;
    B(j,:)=A(i,:);
    B(i,:)=A(j,:);
end