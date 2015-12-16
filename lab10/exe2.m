%exe2
clear;
n = 15;
% A = hilb(n);
beta = 5 * 10^(-5);
A = diag(4 * beta * ones(n,1)) + diag(-2 * ones(n-1,1), -1) + diag(-2 * ones(n-1,1), 1);
PGS = tril(A);
B = eye(n) - inv(PGS) * A;


[a,lamba] = eig(A);
lambda = diag(lamba);
pB = max(abs(lambda));



kA = max(lambda)/min(lambda)
x_true = ones(n,1);
x0 = 0 * ones(n,1);

kmax = 10000;

tol = 10^(-5);
b = A * x_true;

%[ x, k, res ] = gauss_seidel( A, b, x0, tol, kmax )
[ x, k, diff ] = gauss_seidel_difference_iterates( A, b,  x0, tol, kmax )
rel_err = norm((x_true - x)/x_true)