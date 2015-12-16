function [ Ih ] = trapezoidal_composite_quadrature( fun, a, b, M )
% MIDPOINT_COMPOSITE_QUADRATURE approximate the integral of a function in
% the interval [a,b] by means of the composite midpoint quadrature formula
%  [ Ih ] = midpoint_composite_quadrature( fun, a, b, M )
%  Inputs: fun = function handle, 
%          a,b = extrema of the interval [a,b]
%          M = number of subintervals of [a,b] of the same size, M>=1 
%              (the case M=1 corresponds to the simple formula)
%  Output: Ih = approximate value of the integral
%

xnodes = linspace(a,b,M+1);
H = (b-a)/M;


Ih = H/2 * (fun(a)+fun(b)) + H*sum(fun(xnodes(2:end-1)));