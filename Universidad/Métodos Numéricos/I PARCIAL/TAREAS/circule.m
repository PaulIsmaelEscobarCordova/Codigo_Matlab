%% PROGRAMA QUE GRAFICA UN CIRCULO DE RADIO 0
% ESTUDIANTE: PAUL ESCOBAR
% DOCENTE: Ing. PATRICIO PUGARIN.
%%
function t = circule(r)
t = -0.05:0.01:0.05
x= r*cos(t); % ECUACIONES PARCIALES 
y= r*cos(t); % ECUACIONES PARCIALES

% PROCEDEMOS A GRAFICAR 
plot(x,y,'ro')
axis([-0.02 0.02 -0.02 0.02])
grid on
xlabel('Eje x'), ylabel('Eje y')
title('Figura que muestra una circunferencia')

end

