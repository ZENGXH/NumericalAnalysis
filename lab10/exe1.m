% exe1
clear all;
n = 4;
A = [5,1,1,0;1,5,1,1;1,1,5,1;0,1,1,5];

x_true = ones(n,1,1);

b = A * x_true;

P1 = eye(4);

P2 = diag(diag(A)) + diag(diag(A,1),1) + diag(diag(A,-1),-1);

kmax = 100;

tol = 10^(-6);

x0 = 0 * ones(n,1,1);

P = P1;
[ x, k, res ] = preconditioned_gradient( A, b, P, x0, tol, kmax )
err = norm(x_true - x)

k_vect = 1: 50;
res1 = [];
res2 = [];
res3 = [];
for kmax = k_vect
    [ x, k, res ] = preconditioned_gradient( A, b, P, x0, tol, kmax );
    res1 = [res1, res];
    
    [ x, k, res ] = gauss_seidel( A, b, x0, tol, kmax );
    res2 = [res2, res];
    
     [ x, k, res ] = jacobi( A, b, x0, tol, kmax );
     res3 = [res3, res];
end

semilogy(res1,'r');hold on ;
semilogy(res2,'b'); hold on;
semilogy(res3,'y'); axis([1 50 1e-13 10]);