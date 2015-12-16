function [ lambda, x, k ] = power_method( A, x0, tol, kmax )
% POWER_METHOD power method for the computation of the largest eigenvalue
% (in modulus) of the matrix A (\lambda_1). We assume that A is square,
% |\lambda_1| > |lambda_i| for i=2,...n, and \lambda_1 non zero
% Stopping criterion based on the relative difference of successive 
% iterates of the eigenvalue.
%  [ lambda, x ] = power_method( A, x0, tol, kmax )
%  Inputs: A      = matrix (n x n)
%          x0     = initial vector (n x 1)
%          tol    = tolerance for the stopping criterion
%          kmax   = maximum number of iterations
%  Output: lambda = computed (largest) eigenvalue
%          x      = computed eigenvector correspoding to lambda
%          k      = number of iterations
%


y = x0 / norm(x0);
lambda = 0;
for k = 1:kmax
    lambda_old = lambda;
    x = A * y;
    y = x / norm(x);
    lambda = y' * A * y;
    if((abs(lambda - lambda_old)/abs(lambda) < tol)&&(k > 1))
        break;
    end
end




return