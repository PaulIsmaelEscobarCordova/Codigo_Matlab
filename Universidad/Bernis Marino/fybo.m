function a=fybo(k)
% K ser� el valor de n-�simo que en este caso como en los anteriores, ser�
% k-�simo.
% Con vectores es el mismo procedimiento y definir� vectores.
u=zeros(2,2); % Creo un vector de ceros 1x3.
v=ones(2,2); % Creo una vector de unos 1x3. 
u
while v<k %Utilizamos el while dado que mientas v sea menor que k.
    v
    w=u+v; %w ser� el valor de la suma de los valores anteriores
    u=v; %El valor de u ser� reemplazado por el nuevo valor de v.
    v=w; % El valor de v se actualizar� al de w y as� sucesivamente. 
end