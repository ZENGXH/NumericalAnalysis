function [ tv, uv ] = crank_euler_modelproblem( lambda, y0, t0, tf, Nh )
% BACKWARD_EULER_MODELPROBLEM Backward Euler method for the model problem 
% ODE in the form
% y'(t) = lambda y(t),  t \in (t0,tf)
% y(0) = y_0
%
%  [ tv, uv ] = backward_euler_modelproblem( lambda, y0, t0, tf, Nh )
%  Inputs: lambda = real parameter (negative)
%          y0     = initial value
%          t0     = initial time
%          tf     = final time
%          Nh     = number of time subintervals
%  Output: tv     = vector of time steps (1 x (Nh+1))
%          uv     = vector of approximate solution at times tv




tv = linspace(t0,tf,Nh+1);
h = (tf - t0) / Nh;

uv = zeros(1, Nh+1);
uv(1) = y0;

for i = 1:Nh
    % uv(i) = uv(i + 1) - h * lambda * uv(i + 1);
    uv(i + 1) = 1/(1 - 0.5 * lambda*h) * uv(i)*(1 + 0.5 * lambda*h) ;
end
return