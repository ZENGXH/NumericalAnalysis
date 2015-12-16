function [ x, k, res ] = preconditioned_gradient( A, b, P, x0, tol, kmax )
% PRECONDITIONED_GRADIENT solve the linear system A x = b by means 
% of the Preconditioned Gadrient method; the preconditioning matrix must be 
% non singular. Stopping criterion based on the residual.
%  [ x, k, res ] = preconditioned_gradient( A, b, P, x0, tol, kmax )
%  Inputs:  A    = matrix (square matrix)
%           b    = vector (right hand side of the linear system)
%           P    = preconditioning matrix (non singular, same size of A)
%           x0   = initial solution (colum vector)
%           tol  = tolerence for the stopping criterion based on residual
%           kmax = maximum number of iterations
%  Outputs: x    = solution vector (column vector)
%           k    = number of iterations at convergence
%           res  = value of the norm of the residual at convergence
%
r2 = b - A * x0;
x2 = x0;

for k = 0 : kmax
    x1 = x2;
    r1 = r2;
    
    
    z1 = P \ r1;  
    ak = (z1' * r1) / (z1' * A * z1);
    x2 = x1 + ak * z1;
    r2 = r1 - ak * A * z1;
    
    res = norm(x2 - x1);
    err = norm(b - A * x2);
    if(err < tol)
        break;
    end
end
x = x2;

return