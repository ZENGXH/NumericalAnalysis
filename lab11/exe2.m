A = [5, -2, -1, 0; -2, 5, -1, -1; -1, -1, 4, -1; 0, -1, -1, 5]
x0 = [1; 1; 1; 1]
tol = 10^(-6);
kmax = 100;
SHIFT = eye(4)
s = 6
A2 = A - s*SHIFT;
[ lambda, x, k ] = power_method(A2, x0, tol, kmax )
eig(A)
lambda + s