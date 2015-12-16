% exe1
fun = @(t, y) 1 - y.^2; 
t0 = 0;
tf = 5;
y0 = (exp(1) - 1)/(exp(1) + 1);

Nh = 10;
% [ tv, uv ] = heun( fun, y0, t0, tf, Nh );
% plot(uv);

% tv = linspace(1,10);
y = @(t) (exp(2*t + 1) - 1)./(exp(2*t + 1) + 1);
% hold on; plot(y(tv), 'r');


tf = 15;
y0 = 1;
t0 = 0;
fun = @(t,y) -0.5 * y;
Nh = 240;
lambda = -0.5;


h = (tf - t0) / Nh;
t_bar = 10 ;
n = (t_bar - t0) / h;
y_n = exp(-1/2 * n);


figure()
[ tv, uv ] = backward_euler_modelproblem( lambda, y0, t0, tf, Nh );
e_eu = abs(uv(n) - y_n)
hold on;plot(uv);
[ tv, uv ] = crank_euler_modelproblem( lambda, y0, t0, tf, Nh );
hold on;plot(uv, 'g');e_eu = abs(uv(n) - y_n)
[ tv, uv ] = heun( fun, y0, t0, tf, Nh );
hold on;plot(uv, 'g');e_eu = abs(uv(n) - y_n)
[ tv, uv ] = forward_euler( fun, y0, t0, tf, Nh );
hold on;plot(uv);e_eu = abs(uv(n) - y_n)






