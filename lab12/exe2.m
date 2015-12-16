% exe2
clear
beta = pi/3;
alpha = pi/2;
fun = @(t, y) alpha * y * (1 - y/beta);
y0 = 0.4;
t0 = 0;
tf = 20;
Nh = 20;

dfun_y = @(t, y) alpha - 2 * (alpha/beta) * y;
h = (tf - t0) / Nh;
t_bar = 10 ;
n = (t_bar - t0) / h;
% y_n = exp(-1/2 * n);


figure()
[ tv, uv ] = forward_euler( fun, y0, t0, tf, Nh );
hold on;plot(uv);
[ tv, uv ] = backward_euler( fun, dfun_y, y0, t0, tf, Nh );
hold on;plot(uv);
% e_eu = abs(uv(n) - y_n)
