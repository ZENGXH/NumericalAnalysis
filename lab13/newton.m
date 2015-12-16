function [x, res, niter] = newton( f, df, x0, tol, nmax )
% NEWTON Find the zeros of a system of non-linear equations.
%   [X] = NEWTON(F,DF,X0,TOL,NMAX) tries to find the zero X of the 
%   continuous and differentiable function F nearest to X0 using 
%   the Newton method. DF is a function which take X and return the derivative of F.
%   If the search fails an error message is displayed.
%   
%   [X,RES,NITER] = NEWTON(F,DF,X0,TOL,NMAX) returns the value of the 
%   residual RES in X and the number of iterations NITER required for computing X.

n      = 0; 
x(:, n+1) = x0; 
res(:,n+1) = f(x0);

while ( n == 0 || ( norm(x(:, n+1) - x0) > tol && n <= nmax ) )
    x(:, n+2) = x(:, n+1) - df(x(:, n+1))\ f(x(:, n+1)) ;    
    res(:, n+2) = f(x(:, n+2));
    x0 = x(:, n+1);
    n = n + 1;     
end


niter = n;

if n > nmax
    fprintf(['Newton stopped without converging to the desired tolerance '...
             'because the maximum number of iterations was reached\n']);
end

return

