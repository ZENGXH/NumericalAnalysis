%% exe1 a)implement the stopping criterion based on the err_estimate
% fun = @(x) sin(2*x) + x;
% dfun = @(x) 2 * cos(2 * x) + 1;
% a = -10;
% b = 10;
% 
% x0 = 0.7;
% tol = 10 ^(-5);
% nmax = 50;
% [xvect, resvect, nit] = newton( fun, dfun, x0, tol, nmax );
% 
% xv = linspace(a,b,1001);
% subplot(2,2,1);
% plot( xv, fun(xv) ); grid on;
% 
% 
% nvect = 1: nit;
% subplot(2,2,2);
% semilogy( nvect, abs(xvect), '-ko' ); grid on;
% 
% % exe1 d)implement the stopping criterion based on the residual, i.e.
% % abs(r(n)) = abs(fun(x(n))) < tol.
% 
% % beta = 10^(-3) 1 10^(3)
% beta = 10;
% fun = @(x) exp(beta *x) -1;
% dfun = @(x) beta * exp(beta *x);
% 
% 
% x0 = 0.1;
% tol = 10 ^(-7);
% nmax = 150;
% [xvect, resvect, nit] = newton( fun, dfun, x0, tol, nmax );
% 
% xv = linspace(3,-3,1000);
% subplot(2,2,1);
% plot( xv, fun(xv) ); grid on;
% 
% 
% nvect = 1: nit;
% subplot(2,2,2);
% % semilogy( nvect, log(resvect), '-ko' ); grid on;
% plot(nvect, log(resvect));grid on;

%% exer2 a)
% m = 1,2,3
m = 3;
fun = @(x) (sin(x)).^m;
% ? interval of x: (-pi/2,pi/2),
tol = 10 ^(-8);
nmax = 50;
x0 = pi/6;

[xvect, resvect, nit] = newton( fun, dfun, x0, tol, nmax );

xv = linspace(3,-3,1000);
subplot(2,2,1);
plot( xv, fun(xv) ); grid on;


nvect = 1: nit;
subplot(2,2,2);
% semilogy( nvect, log(resvect), '-ko' ); grid on;
plot(nvect, log(resvect));grid on;