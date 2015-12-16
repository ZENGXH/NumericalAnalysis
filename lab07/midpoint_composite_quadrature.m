function [ Ih ] = midpoint_composite_quadrature( fun, a, b, M )
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

x_bar_k = (xnodes(1: end-1)+xnodes(2:end))./2;

H = (b-a)./M;
Ih = fun(x_bar_k).* H;
Ih = sum(Ih);
