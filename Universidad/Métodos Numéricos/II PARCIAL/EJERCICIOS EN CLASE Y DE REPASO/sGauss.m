function x=sGauss(A,B)
Ab=[A';B]';
[n,n]=size(A);
    for k=1:n
        [bb ll]=max(abs(Ab(k:n,k)));
            if bb==0
                error('La matriz es singular. Tiene infinitas soluciones')
            end
            m=k+ll-1;
            Ab=Intercambiofilas(Ab,k,m);
            for j=k+1:n
            Ab=Combinarfilas(Ab,k,j,(Ab(j,k)/Ab(k,k)));
            end
    end
    x=sistemaTs(Ab(:,1:n),Ab(:,n+1));
end