function [ x, k, res ] = gauss_seidel( A, b, x0, tol, kmax )
% GAUSS_SEIDEL solve the linear system A x = b by means 
% of the Gauss-Seidel iterative method; diagonal elements of A 
% must be nonzero. Stopping criterion based on the residual.
%  [ x, k, res ] = gauss_seidel( A, b, x0, tol, kmax )
%  Inputs:  A    = matrix (square matrix)
%           b    = vector (right hand side of the linear system)
%           x0   = initial solution (colum vector)
%           tol  = tolerence for the stopping driterion based on residual
%           kmax = maximum number of iterations
%  Outputs: x    = solution vector (column vector)
%           k    = number of iterations at convergence
%           res  = value of the norm of the residual at convergence
%

x = x0;
E = -tril(A,-1);
F = -triu(A,1);
D = diag(diag(A));
PGS = D-E;

P = PGS;
sizeA = size(A,1);
for k= 1:kmax
    for i=1:size(A,1)
        aii = A(i,i);
        bi = b(i);
        x_old = x;
        aiJ = A(i,1:i);
        x = 1/aii*(bi - A(i,1:i-1)*x_old(1:i-1) -  A(i,i+1:sizeA)*x(i+1:sizeA));
    end
    res = norm(b - A * x);
    if res < tol
        break;
    end
end






return