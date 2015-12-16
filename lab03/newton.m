function [xvect, resvect, nit] = newton( fun, dfun, x0, tol, nmax )
% NEWTON Find a zero of a nonlinear scalar function.
%   [XVECT] = NEWTON(FUN,DFUN,X0,TOL,NMAX) finds a zero of the differentiable 
%   function FUN using the Newton method and returns a vector XVECT containing 
%   the successive approximations of the zero (iterates). DFUN is the derivative of FUN.
%   FUN and DFUN accept real scalar input x and return a real scalar value; 
%   FUN and DFUN can also be inline objects. X0 is the initial guess.
%   TOL is the tolerance on error allowed and NMAX the maximum number of iterations.
%   The stopping criterion based on the difference of successive iterates is used.
%   If the search fails a warning message is displayed.
%   
%   [XVECT,RESVECT,NIT] = NEWTON(FUN,DFUN,X0,TOL,NMAX) also returns the vector
%   RESVECT of residual evaluations for each iterate, and NIT the number of iterations.
%   Note: the length of the vectors is equal to ( NIT + 1 ).
%

xvect = [];
resvect = [];
xvect(1) = x0;
resvect(1) = tol;
nit = 1;
err_estimate = tol;
% while  (nit < nmax && err_estimate >= tol)
  while (nit < nmax && abs(resvect(nit)) >= tol)
    if fun(xvect(nit)) == 0
        return;
    end

    xvect(nit + 1) = xvect(nit) - fun(xvect(nit))/dfun(xvect(nit)); 
    resvect(nit + 1) = fun(xvect(nit + 1));
    err_estimate = abs (xvect(nit + 1) - xvect(nit));
    nit = nit + 1;

end