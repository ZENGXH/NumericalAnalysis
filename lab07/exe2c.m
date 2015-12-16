clear all;

fun = @(x) x.^d;
a = 0;
b = 1;
I = 2/7*(1-cos(7/2)) + exp(1) - 2;
k = 2:7;
for i = 1:length(k)
    M = 2.^k(i);
    I = I.*ones(1,length(k(i)));
I_mid = midpoint_composite_quadrature( fun, a, b, M );
I_tra = trapezoidal_composite_quadrature( fun, a, b, M );
I_miderror(i) = abs(I_mid - I);
I_traerror(i) = abs(I_tra - I);
end
H = (b-a)./(2.^k);
loglog(H, I_miderror,'r');hold on
loglog(H, I_traerror,'b');