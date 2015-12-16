function [xvect, nit,err] = fixed_point_iterations( phi, x0, tol, nmax )
% FIXED_POINT_ITERATIONS Finds a fixed point of a scalar function.
%   [XVECT] = FIXED_POINT_ITERATIONS(PHI,X0,TOL,NMAX) finds a fixed point of the 
%   `iteration function PHI` using the fixed point iterations method and returns a 
%   `vector XVECT` containing the successive approximations of the fixed point (iterates). 
%   PHI accepts a real scalar input x and return a real scalar value; 
%   PHI can also be an inline object. X0 is the initial guess.
%   TOL is the tolerance on error allowed and NMAX the maximum number of iterations.
%   The stopping criterion based on the difference of successive iterates is used.
%   If the search fails a warning message is displayed.
%   
%   [XVECT,NIT] = FIXED_POINT_ITERATIONS(PHI,X0,TOL,NMAX) also returns the 
%   number of iterations  NIT.
%   Note: the length of the vectors is equal to ( NIT + 1 ).
%
xvect = [];
xvect(1) = x0;
nit = 1;
err=[];
err(1) = tol + 1;

while(err(nit)>tol && nit < nmax)
    xvect(nit + 1) = phi(xvect(nit));
    err(nit + 1) = abs (xvect(nit + 1) - xvect(nit));
    nit = nit + 1;
end
fprintf('run fixed point ier , get sulu %f with ite %d',xvect(nit),nit);
end