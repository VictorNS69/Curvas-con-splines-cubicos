function DibujaCurva1D
 
% Interpolación de Newton 1D
 
% Arranca la interface gráfica.
% Dibuja la gráfica de la función f(x)=1/(1+25x^2)
% Con el boton de la izda del ratón, añadimos puntos de control sobre la función. 
% Cada punto añadido se dibuja en la pantalla (un circulo rojo).
% Con el boton de la drcha del ratón, añadimos el último punto.
% Calcula y dibuja el polinomio de Newton que interpola esos puntos de control (línea azul). Utiliza la rutina polNewton.
 
hold on
% Initially, the list of points is empty.
xy = [];
%xx=-1:0.01:1;
xx=-0:0.01:7;
%fx=1./(1+25*xx.^2);
fx=xx.*(xx-2*pi).*exp(-xx);
plot(5+3*xx,3+5*fx,'g.');
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
%t = 1:n;
ts = min(xy(1,:)): 0.001: max(xy(1,:));
xys = polNewton(xy(1,:),xy(2,:),ts);
 % Plot the interpolated curve.
plot(ts,xys,'b-');
hold off
return 