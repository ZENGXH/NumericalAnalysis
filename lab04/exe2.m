% function x [0.02,0.2] exp(x) + 3 * sqrt(x) - 2;
f = @(x) log(2 - 3 *sqrt(x));
% another choice
%  f = @(x) (1/9) * (2 - exp(x)).^2;


%% give some intuition
x = 0.02:0.001:0.2;
subplot(222);


g = @(x) x;
plot(x,g(x));grid on;hold on;

plot(x,f(x),'color','red');
title('show the fixed point of phi');
% alpha  -1.047197598567 2.246005589297 
xlabel('x');
ylabel('phi(x) and y = x');


%% strat find fixed point: 
nmax = 1600;
tol = 10^(-8);
x0 = 0.08;
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