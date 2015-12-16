clear
A1 = [3,-2,1;2,1.65,-1;0,1,4];
det1 = det(A1);
A2 = [5,-3,-2;-3,3,0;-2,0,4];
det2 = det(A2);

n = 100;


A3 = diag(4*ones([1,n])) + diag((-1)*ones([1,n-1]),-1) + diag((-1)*ones([1,n-1]),1);

A=A1;

x_true = ones([size(A,1),1]);
x0 = 0*ones([size(A,1),1]);
b = A*x_true;

tol = 10^(-6);
kmax = 1000;
[ x, k, res ] = jacobi( A, b, x0, tol, kmax );
k
res
e = norm(x-x_true)
[ x, k, res ] = preconditioned_gradient( A, b, x0, tol, kmax );