function graf_param(a,b,n)
t= linspace(a,b,n);
x=5*cos(t/5)+cos(2*t); 
y=5*sin(t/5)+sin(3*t);
plot(x,y)
end 