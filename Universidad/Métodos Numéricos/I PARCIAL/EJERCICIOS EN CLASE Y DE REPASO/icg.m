function [ x ] = icg( q,a,c,seed ) 
% Una funcion for generation of Random Numbers
% Using the Inversive Congruential Generator
% Algorithm..
x(1)=seed;
for k=2:10  
    if x(k-1)~= 0
        x(k)=mod(a/x(k-1)+c,q);
    else 
        x(k)=c;
    end;
end
disp(x);
end
% end of icg.m
