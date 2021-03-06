function [x, res, nit] = newtonsys( F, J, x0, tol, nmax )
% NEWTONSYS Find the zeros of a system of nonlinear equations.
%   [X] = NEWTONSYS(F,J,X0,TOL,NMAX) find the zero X of the
%   continuous and differentiable system of functions F nearest to X0 using the 
%   Newton method. J is a function which takes X and returns the Jacobian matrix.
%   X0 is a column vector; F returns a column vector and J a square matrix.
%   The stopping criterion is based on the difference (norm) of successive
%   iterates.
%   If the search fails a warning message is displayed.
%
%   [X,RES,NITER] = NEWTONSYS(F,J,X0,TOL,NMAX) returns the value of the
%   residual RES in X and the number of iterations NITER required for computing X.
%   Note: only the final iterate is stored in X; similarly for RES.
%

return