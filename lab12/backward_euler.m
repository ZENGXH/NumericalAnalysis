function [ tv, uv ] = backward_euler( fun, dfun_y, y0, t0, tf, Nh )
% BACKWARD_EULER Backward Euler method for the scalar ODE in the form
% y'(t) = f(t,y(t)),  t \in (t0,tf)
% y(0) = y_0
%
% The Newton method is used to solve the nonlinear equation at each time
% step. The function newton.m is used.
% 
%  [ tv, uv ] = backward_euler( fun, y0, t0, tf, Nh )
%  Inputs: fun    = function handle for f(t,y), fun = @(t,y) ...
%          dfun_y = derivative of f(t,y) w.r.t. y, dfun_y = @(t,y) ...
%          y0     = initial value
%          t0     = initial time
%          tf     = final time
%          Nh     = number of time subintervals
%  Output: tv     = vector of time steps (1 x (Nh+1))
%          uv     = vector of approximate solution at times tv
%

tv = linspace(t0,tf,Nh+1);
h = (tf - t0) / Nh;

uv = zeros(1, Nh+1);
uv(1) = y0;
tol = 10^(-10);
nmax = 20;

for i = 1:Nh
    % uv(i) = uv(i + 1) - h * lambda * uv(i + 1);
    f = @(y) fun(tv(i+1), y);
    df = @(y) dfun_y(tv(i+1), y);
    x0 = uv(i);
    [x, res, niter] = newton( f, df, x0, tol, nmax );
    
    uv(i + 1) = x(end);
end




return