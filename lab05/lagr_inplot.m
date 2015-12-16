a = 0;
b = 2;
xp= linspace(a,b,1001);

x0 = 0;
x1 = 1;
x2 = 2;

phi0 = @(x) (x-x1).*(x-x2)/((x0-x1)*(x0-x2)); 
phi1 = @(x) (x-x0).*(x-x2)/((x1-x0)*(x1-x2)); 
phi2 = @(x) (x-x0).*(x-x1)/((x2-x0)*(x2-x1)); 

f = @(x) - x.^3 + 3*x.^2 - 2;
fe = @(x) f(x0)*phi0(x) + f(x1)*phi1(x) + f(x2)*phi2(x);

plot(xp,f(xp));
hold on;
plot(xp,fe(xp));