clc; 
clear all; 
a=21; 
b=5; 
m=2^(13);

f=@(x) mod((a*x)+b,m);
x(1)=1;

  for i=1:m
      x(i+1)=f(x(1));
      
  end
  x
  d=0;
  
    for i=1:m 
        if x(i+1)==x(1)
            d=i;
            break;
        end
    end    
    d
