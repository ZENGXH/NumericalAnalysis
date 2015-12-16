% exe 1.b
fun = @(x) x*log(x) - (sin(x)).^2;
xnodes = 1.9;
h = 1/16;
dback = backward_finite_difference(fun, xnodes, h);
dfor =forward_finite_difference(fun, xnodes, h);
dmid = center_finite_difference(fun, xnodes, h);