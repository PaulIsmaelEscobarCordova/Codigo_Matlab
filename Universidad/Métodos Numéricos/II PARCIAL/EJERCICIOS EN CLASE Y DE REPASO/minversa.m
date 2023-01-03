function x=minversa(A)
[n n]=size(A);
I=eye(n);
Ab=[A';I]';
%n=n1;
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
   
    for k=n:-1:2
        for j=k-1:-1:1
            Ab=Combinarfilas(Ab,k,j,(Ab(j,k)/Ab(k,k)));
        end
    end
     for k=1:n
         if Ab(k,k)~=1
         Ab(k,:)=Ab(k,:)/Ab(k,k);
         end
     end
    x=Ab(:,n+1:2*n);
   end
  end
