% exe 1.d
clear all;
fun = @(x) x.*log(x) - (sin(x)).^2;
f = fun;
df = @(x) 1 +log(x) - 2*sin(x).*cos(x);
a = 3/2;
b = 5/2;
dfh = [];
N = 8;
h = (b-a)/N;
xnodes = linspace(a,b,N+1);
xnodes_internal = xnodes(2:end-1);
dfh_internal = center_finite_difference( fun, xnodes_internal, h);
dfh_a = -(3*f(a) - 4 * f(a+h) + f(a+2*h))/(2*h);
dfh_b = -(-3*f(b) + 4 * f(b-h) - f(b-2*h))/(2*h);

dfh_nodes = [dfh_a, dfh_internal, dfh_b];
plot(xnodes, dfh_nodes,'rx');
xvalues = linspace(a,b,100*(N+1));
true_der = df(xvalues);
hold on
plot(xvalues,true_der,'-');

% 
% for n = 1:N+1
%     
%     if(n==1)
%         
%     elseif(n == 9)
%        
%     else
%     dfh(n) = center_finite_difference( fun, xnodes(n), h(n));
% 
%     end
%     e_center(n) = abs (df(xnodes(n)) - dfh(n));
% end
% subplot 211
% loglog(h,e_center,'r');hold on
% %loglog(h(n),e_center,'r')
    