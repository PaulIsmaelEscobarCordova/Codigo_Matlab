%% PROGRAMA EN EL CUAL REALIZA LAS OPERACIONES CON EL MULTIPLICADOR M

function B= Combinarfilas(A,i,j,m)
    B=A;
    B(j,:)= A(j,:)- m*A(i,:);
end
