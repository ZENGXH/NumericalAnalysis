lambda = -0.525;
tf = 40;
t0 = 0;

fun = @(t, y) lambda * y;
y0 = 1;

Nh =10;

fun_exact = @(t) exp(lambda * t);

[ tv, uv ] = forward_euler( fun, y0, t0, tf, Nh )
hold on;plot(uv, 'r');

[ tv, uv ] = heun( fun, y0, t0, tf, Nh )
hold on;plot(uv, 'g');


[ tv, uv ] = runge_kutta_4( fun, y0, t0, tf, Nh )
hold on;plot(uv, 'b');


hold on; plot(fun_exact(tv), '-o')