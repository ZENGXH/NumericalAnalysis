function [ x, k, res ] = jacobi( A, b, x0, tol, kmax )
% JACOBI solve the linear system A x = b by means of the
% Jacobi iterative method; diagonal elements of A must be nonzero.
% Stopping criterion based on the residual.
%  [ x, k, res ] = jacobi( A, b, x0, tol, kmax )
%  Inputs:  A    = matrix (square matrix)
%           b    = vector (right hand side of the linear system)
%           x0   = initial solution (colum vector)
%           tol  = tolerence for the stopping driterion based on residual
%           kmax = maximum number of iterations
%  Outputs: x    = solution vector (column vector)
%           k    = number of iterations at convergence
%           res  = value of the norm of the residual at convergence
%

n = size( A, 1 );

k = 0;
x = x0; 
res = norm( A * x - b );

x_old = x0;

while( k < kmax && res > tol )    
    for i = 1 : n        
        j_v_old = [ 1 : i - 1, i + 1 : n ];
        x( i ) = 1 / A( i, i ) * ( b( i ) ...
                                   - A( i, j_v_old ) * x_old( j_v_old ) );
    end    
    res = norm( A * x - b );
    k = k + 1;    
    x_old = x;
end

return