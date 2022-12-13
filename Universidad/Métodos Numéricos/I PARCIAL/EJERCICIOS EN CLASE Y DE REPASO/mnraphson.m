function x1 = mnraphson(f,g,x0)

fx= inline(f);
gx=inline(g);
x1=x0-(fx(x0)/gx(x0));

while abs(x1-x0)>0.00001
    x2=x1-fx(x1)/gx(x1);
    
    x0=x1;
    x1=x2;

end
disp('El cero de la funcion es: ')
end