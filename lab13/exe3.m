A = -[3, 1; 1,1];
g = @(t) 0;
y0 = [1 ; 0.6];

t0 = 0;
tf = 5;

Nh = 10;

[ tv, uv ] = backward_euler_system_nhcc( A, g, y0, t0, tf, Nh )
plot(tv,uv(1,:), 'r')
hold on;plot(tv,uv(2,:), 'r')

fun = @(t,y) A * y + g(t)*y

[ tv, uv ] = forward_euler_system( fun, y0, t0, tf, Nh )
hold on;plot(tv,uv(1,:))
hold on;plot(tv,uv(2,:))