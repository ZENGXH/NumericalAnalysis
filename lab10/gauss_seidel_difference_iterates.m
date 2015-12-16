function [ x, k, diff ] = gauss_seidel_difference_iterates( A, b,  x0, tol, kmax )
% GAUSS_SEIDEL solve the linear system A x = b by means 
% of the Gauss-Seidel iterative method; diagonal elements of A 
% must be nonzero. Stopping criterion based on the difference of successive
% iterates
%  [ x, k, diff ] = gauss_seidel( A, b, x0, tol, kmax )
%  Inputs:  A    = matrix (square matrix)
%           b    = vector (right hand side of the linear system)
%           x0   = initial solution (colum vector)
%           tol  = tolerance for the stopping criterion based on difference
%                  of successive iterates
%           kmax = maximum number of iterations
%  Outputs: x    = solution vector (column vector)
%           k    = number of iterations at convergence
%           diff = difference (in norm) between successive iterates
%
n = size( A, 1 );

k = 0;
x = x0; 
    % change to rel res
    diff = tol + 1;

x_old = x0;

while( k < kmax && diff > tol )    
    for i = 1 : n        
        j_v = 1 : i - 1;
        j_v_old = i + 1 : n;
        x( i ) = 1 / A( i, i ) * ( b( i ) ...
                                   - A( i, j_v ) * x( j_v ) ...
                                   - A( i, j_v_old ) * x_old( j_v_old ) );
    end
    % change to rel res
    if k > 1
        diff = norm(x - x_old)
    end
    k = k + 1;    
    x_old = x;
end

    
return