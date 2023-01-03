function LG=lagrange(x,k)
rr=1;
ss=1;
s=length(x);
    for j=1:s
        if j~=k
            rr=conv(rr,poly(x(j)));
            ss=ss*(x(k)-x(j));
        else
            poly(x(j))==1; 
        end
       LG=(1/ss)*rr;
    end
end