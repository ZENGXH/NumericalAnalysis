function [ tv, uv ] = backward_euler_system_nhcc( A, g, y0, t0, tf, Nh )
% BACKWARD_EULER_SYSTEM_NHCC Backward Euler method for solving a system of 
% ODEs in the nonhomogeneous with constant coefficients form:
% y'(t) = A y(t) + g(t),  t \in (t0,tf)
% y(0) = y_0
%
% y, y_0 are vectors of size (m x 1)
%
%  [ tv, uv ] = backward_euler_system_nhcc( A, g, y0, t0, tf, Nh )
%  Inputs: A      = square matrix of size (m x m)
%          g      = function handle for g(t), g = @(t) ...
%                   a vector of size (m x 1) must be returned by g
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
uv(:,1) = y0;
tol = 10^(-10) ;
nmax = 20;
fun = @(y, t) A*y + g(t);
df = @(y) A ;

for i = 1:Nh
    % uv(i) = uv(i + 1) - h * lambda * uv(i + 1);
    
    f = @(y) fun(y, tv(i+1));
    x0 = uv(:, i);
    [x, res, niter] = newton( f, df, x0, tol, nmax );
    
    uv(:, i + 1) = x(end);
end

return