% exe 1.c
fun = @(x) x*log(x) - (sin(x)).^2;
df = @(x) 1 +log(x) - 2*sin(x).*cos(x);
xnodes = 1.9;
k = 2:7;
h = [];
e_for = [];
e_back = [];
e_center = [];

for i = 1: length(k)
    h(i) = 2^(-k(i));
    e_for(i) = abs (df(xnodes) - forward_finite_difference(fun, xnodes, h(i) ));
    e_back(i) = abs (df(xnodes) - backward_finite_difference(fun, xnodes, h(i) ));
    e_center(i) = abs (df(xnodes) - center_finite_difference(fun, xnodes, h(i) ));
end
mean(e_for)
mean(e_back)
mean(e_center)
loglog(h,e_for);

plot(log(h),log(e_for),'r');
hold on 
plot(log(h),log(e_back),'g');
hold on 
plot(log(h),log(e_center));hold on
plot(log(h),log(h.^2));hold on
plot(log(h),log(h))