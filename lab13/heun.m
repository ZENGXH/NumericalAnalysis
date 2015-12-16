function [ tv, uv ] = heun( fun, y0, t0, tf, Nh )
% FORWARD_EULER Forward Euler method for the scalar ODE in the form
% y'(t) = f(t,y(t)),  t \in (t0,tf)
% y(0) = y_0
%
%  [ tv, uv ] = forward_euler( fun, y0, t0, tf, Nh )
%  Inputs: fun    = function handle for f(t,y), fun = @(t,y) ...
%          y0     = initial value
%          t0     = initial time
%          tf     = final time
%          Nh     = number of time subintervals
%  Output: tv     = vector of time steps (1 x (Nh+1))
%          uv     = vector of approximate solution at times tv
%
I = tf - t0;
h = I / Nh;

tv = zeros(Nh,1);
uv = zeros(Nh,1);

uv(1) = y0;
tv(1) = t0;
for i = 1 : Nh
    tv(i + 1) = tv(i) + h;
    tmp = uv(i) + h * fun(tv(i), uv(i));
    uv(i + 1) = uv(i) + h/2 * ( fun(tv(i), uv(i)) + fun(tv(i+1), tmp)) ;
    
end
