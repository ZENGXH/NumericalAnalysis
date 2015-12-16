function [xvect, nit] = fixed_point_iterations_system( phi, x0, tol, nmax )
% FIXED_POINT_ITERATIONS_SYSTEM Finds a fixed point of a system of functions.
%   [XVECT] = FIXED_POINT_ITERATIONS_SYSTEM(PHI,X0,TOL,NMAX) finds a fixed point of the 
%   vector of iteration functions in PHI using the fixed point iterations method and 
%   returns a matrix XVECT containing the successive approximations of the fixed point 
%   (iterates). PHI accepts a real vectorial input x and return a column vector of real 
%   values; PHI can also be an inline object. 
%   X0 is the initial guess (a column vector of length D).
%   TOL is the tolerance on error allowed and NMAX the maximum number of iterations.
%   The stopping criterion based on the difference of successive iterates is used.
%   If the search fails a warning message is displayed.
%   
%   [XVECT,NIT] = FIXED_POINT_ITERATIONS_SYSTEM(PHI,X0,TOL,NMAX) also returns the 
%   number of iterations  NIT.
%   Note: the matrix XVECT is of size D x ( NIT + 1 ).
%

return