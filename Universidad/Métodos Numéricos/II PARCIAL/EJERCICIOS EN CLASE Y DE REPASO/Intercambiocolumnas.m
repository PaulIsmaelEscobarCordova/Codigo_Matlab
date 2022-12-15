%% PROGRAMA EN EL CUAL REALIZA INTERCAMBIO DE COLUMNAS

function B= Intercambiocolumnas(A,i,j)
    A
    B=A;
    B(:,j)=A(:,i);
    B(:,i)=A(:,j);
end