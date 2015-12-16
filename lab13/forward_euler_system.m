function [ tv, uv ] = forward_euler_system( fun, y0, t0, tf, Nh )
% FORWARD_EULER_SYSTEM Forward Euler method for solving a system of ODEs 
% in the form:
% y'(t) = F(t,y(t)),  t \in (t0,tf)
% y(0) = y_0
%
% y, y_0 are vectors of size (m x 1)
%
%  [ tv, uv ] = forward_euler_system( fun, y0, t0, tf, Nh )
%  Inputs: fun    = function handle for F(t,y), fun = @(t,y) ...
%                   a vector of size (m x 1) must be returned by fun
%          y0     = initial vector of size (m x 1)
%          t0     = initial time
%          tf     = final time
%          Nh     = number of time subintervals
%  Output: tv     = vector of time steps (1 x (Nh+1))
%          uv     = matrix of the approximate solution at times tv
%                   size (m x (Nh+1))
tv = linspace(t0,tf,Nh+1);
h = (tf - t0) / Nh;

uv = zeros(2, Nh+1);

uv(:, 1) = y0;

tol = 10^(-10);
nmax = 20;

for i = 1 : Nh
    
    uv(:, i + 1) = uv(:, i) + h * fun(tv(i) , uv(:, i)) ;
    tv(i + 1) = tv(i) + h;
end
return