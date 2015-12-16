alpha = 1.5;
beta = -0.2;
tf = 30;
t0 = 0;

fun = @(t, y) y * (cos(t)/(alpha + sin(t)) + beta);
y0 = alpha + sin(t0);

Nh = 30;
Nhlist = [30, 60, 120, 240, 480, 960];
for i = 1 : length(Nhlist)
    
    Nh = Nhlist(i);
fun_exact = @(t) (alpha + sin(t)).* exp(beta .* (t - t0));

[ tv, uv ] = forward_euler( fun, y0, t0, tf, Nh )
hold on;plot(uv, 'r');
error_fe(i) = uv(tv == 10);

[ tv, uv ] = heun( fun, y0, t0, tf, Nh )
hold on;plot(uv, 'g');
error_h(i) = uv(tv == 10);


[ tv, uv ] = runge_kutta_4( fun, y0, t0, tf, Nh )
hold on;plot(uv, 'b');
error_rk(i) = uv(tv == 10);

hold on; plot(fun_exact(tv), '-o')
end
figure;
plot(Nhlist,error_fe, 'r');
hold on;plot(Nhlist,error_h, 'g');
hold on;plot(Nhlist,error_rk, 'b');

