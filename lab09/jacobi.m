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
x = x0;


sizeA = size(A,1);
for k = 1 : kmax

    x_old = x;
        
    for i = 1 : sizeA
        aii = A( i, i );
        bi = b( i );
        i_v_old = [ 1 : i-1, i + 1 : sizeA ];
        x( i ) = 1 / aii * ( bi - A( i, i_v_old ) * x_old( i_v_old ) );
    end
    
    res = norm(b - A* x);
    if res < tol
        break;
    end
end

return