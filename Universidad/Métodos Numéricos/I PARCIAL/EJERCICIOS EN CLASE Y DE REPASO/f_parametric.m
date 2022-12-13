% C�digo que muestra una figura param�trica

function f_parametric(R,r,a,b,n)
t= linspace(a,b,n); 
x=(R+r)*cos(t)-r*cos((R+r/r)*t);
y=(R+r)*sin(t)-r*sin((R+r/r)*t);
plot(x,y,'b-')
axis('equal')
xlabel('Eje x'), ylabel('Eje y')
title('Figura que Muestra una Gr�fica de una Circunferencia')
grid on 
end


