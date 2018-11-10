function DibujaCurva2D_b(nletras)
% nletras es el número de caracteres que queremos dibujar 
 
% Interpolación de Newton (o spline cúbico) en cada una de las coordenadas
 
% Arranca la interface gráfica.
% Con el boton de la izda del ratón, añadimos puntos de control. 
% Cada punto añadido se dibuja en la pantalla (un circulo rojo).
% Con el boton de la drcha del ratón, añadimos el último punto.
% Calcula y dibuja el polinomio de Newton que interpola cada una de las coordenadas de los
% puntos de control (línea azul).
 
axis([0 10 0 10])
hold on
% Initially, the list of points is empty.
for k=1:nletras
xy = [];
n = 0;
% Loop, picking up the points.
disp('Left mouse button picks points.')
disp('Right mouse button picks last point.')
but = 1;
while but == 1
    [xi,yi,but] = ginput(1);
    plot(xi,yi,'ro')
    n = n+1;
    xy(:,n) = [xi;yi];
end
% Interpolate with a spline curve and finer spacing.
t = 1:n;
ts = 1: 0.1: n;
%Interpolate with a spline curve and finer spacing.
xs = spline3(t,xy(1,:),ts);   
ys = spline3(t,xy(2,:),ts);    
% Plot the interpolated curve.
plot(xs,ys,'b-');
end
hold off
return