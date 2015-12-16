function [ Ih ] = gauss_legendre_simple_quadrature( fun, a, b, n )
% GAUSS_LEGENDRE_SIMPLE_QUADRATURE approximate the integral of a function in
% the interval [a,b] by means of the simple Gauss-Legendre quadrature formula
%  [ Ih ] = gauss_legendre_simple_quadrature( fun, a, b, n )
%  Inputs: fun = function handle, 
%          a,b = extrema of the interval [a,b]
%          n + 1 = number of quadrature nodes and weights
%  Output: Ih = approximate value of the integral
%
switch n
    case 1
        y_ref = 0;
        a_ref = 2;
    case 2 
        y_ref =  [-1/(3)^(1/2) 1/(3)^(1/2)];
        a_ref = [1,1];
    case 3
        y_ref = [-((15)^(1/2))/5 , 0 , ((15)^(1/2))/5];
        a_ref = [5/9, 8/9, 5/9];
end


y_i = (a+b)/2 + y_ref.*(b-a)/2;
a_i = a_ref.*(b-a)/2;
Ih = a_i*(fun(y_i))';

return