
clear all;
a = 0;
b = 1;
% fun = @(x) sin((7/2)*x) + exp(x) - 1;
for d = 1 : 8
fun = @(x) x.^d;
I = 1 / (d + 1);
% I = 2/7 * (1 - cos(7/2)) + exp(1) - 2;


for n = 1:3
    Ih(n) = gauss_legendre_simple_quadrature( fun, a, b, n );
    diff(n) = I - Ih(n);


end
d
format short e
diff
format

% plot(abs(diff));
% 
% pause;
end