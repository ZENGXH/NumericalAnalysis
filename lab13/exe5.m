

y0 = [35 ; 40];

t0 = 0;
tf =111100;

Nh = 5000;

b1 = 0.002;
b2 = 0;
d1 = 0.021;
d2 = 0.0325
c1 = 0.15;
c2 = 0.075;
A = [-b1*c1, -d2*c1; d1*c2, b2*c2];
fun = @(t,y) A * y + [c1;c2];
[ tv, uv ] = forward_euler_system( fun, y0, t0, tf, Nh )
plot(tv,uv(1,:))
hold on;plot(tv,uv(2,:));figure;

plot(uv(1,:), uv(2,:))