function circulo(r)
t=linspace(0,2*pi,100); 
x=r*cos(t); 
y=r*sin(t); 
plot(x,y)
axis('equal')
end 