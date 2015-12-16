%f = @(x) sin(x) + x/2 - pi/6 + sqrt(3)/3 ;
f = @(x) exp(x) + 3 * sqrt(x) - 2;
x = 0:.1:10;
subplot(222);
plot(x,f(x));hold on;
title('show the fixed point of phi');
% alpha  -1.047197598567 2.246005589297 
xlabel('x');
ylabel('phi(x) and y = x');
g = @(x) x;
plot(x,g(x));grid on;



nmax = 1600;
tol = 10^(-8);
x0 = -10.0;
[xvect, nit,err ] = fixed_point_iterations( f, x0, tol, nmax );
solu_get = xvect(nit);
ite = 1 : nit;
subplot(221);
semilogy(ite,abs(xvect(ite) - solu_get),'-*');hold on;
title('/xk - alpha/ vs iteration');
xlabel('iter');
ylabel('log(/xk - alpha/) base 10 ');grid on;

semilogy(ite,err(ite),'-o'),
%plot(log(err));
% plot in semi{logarithmic scale the error e(k) = jx(k)􀀀2j
%vs. the number of iterations k; more over, plot the ratio a(k) :=


subplot(212);
phi_ratio = @(ite2) abs(xvect(ite2 + 1) - solu_get)/abs(xvect(ite2) - solu_get);
ra = [];
for ite2 = 1 : nit - 1
    ra(ite2) = phi_ratio(ite2);
end
ite2 = 1 : nit - 1;
plot(ite2,ra,'-o');
title('ratio (x_k+1 - alpha)/(x_k - alpha)');
% alpha  -1.047197598567 2.246005589297 
xlabel('x');
ylabel('ratio');