function [L U P]=splu(A)
    [rows,columns]=size(A);
    P=eye(rows,columns); %P is permutation matrix
    tol = 1E-16; % I believe this is what matlab uses as a warning level
    if( rcond(A) <= tol) %% bad condition number
        error('Matrix is nearly singular')
    end
    U=A;
    L=eye(rows,columns);
    pivot=1;
    while(pivot<rows)
        max=abs(U(pivot,pivot));
        maxi=0;%%find maximum abs value in column pivot
        for i=pivot+1:rows
            if(abs(U(i,pivot))>max)
                max=abs(U(i,pivot));
                maxi=i;
            end
        end %%if needed then switch
        if(maxi~=0)
            temp=U(pivot,:);
            U(pivot,:)=U(maxi,:);
            U(maxi,:)=temp;
            temp=P(pivot,:);
            P(pivot,:)=P(maxi,:);
            P(maxi,:)=temp;

            % change elements in L-----
            if pivot >= 2
                temp=L(pivot,1:pivot-1);
                L(pivot,1:pivot-1)=L(maxi,1:pivot-1);
                L(maxi,1:pivot-1)=temp;
            end
        end %%Grade the column pivot using gauss elimination
        for i=pivot+1:rows
            num=U(i,pivot)/U(pivot,pivot);
            U(i,:)=U(i,:)-num*U(pivot,:);
            L(i,pivot)=num;
        end
        pivot=pivot+1;
    end
    disp('L=');
    disp(L);
    disp('U=');
    disp(U);
    disp('P=');
    disp(P);
end

