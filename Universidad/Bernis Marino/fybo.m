function a=fybo(k)
% K será el valor de n-ésimo que en este caso como en los anteriores, será
% k-ésimo.
% Con vectores es el mismo procedimiento y definiré vectores.
u=zeros(2,2); % Creo un vector de ceros 1x3.
v=ones(2,2); % Creo una vector de unos 1x3. 
u
while v<k %Utilizamos el while dado que mientas v sea menor que k.
    v
    w=u+v; %w será el valor de la suma de los valores anteriores
    u=v; %El valor de u será reemplazado por el nuevo valor de v.
    v=w; % El valor de v se actualizará al de w y así sucesivamente. 
end