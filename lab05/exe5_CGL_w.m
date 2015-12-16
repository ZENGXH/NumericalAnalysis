
%% exe2
clear;
f = @(x) sin(x./3);
a = 0;
b = 1;
inter = b - a;
x_plo = linspace(a,b,1001);
y_true = f(x_plo);
plot(x_plo,y_true,'b');

hold on;
e = [];
e_estimate = [];
n = 3;
j = 0:3;
x_hat= -cos(pi*j./n);
x_nodes = (a+b)/2 + (b-a)*x_hat./2;

w = @(x) (x - x_nodes(1)).*(x - x_nodes(2)).*(x - x_nodes(3));

for i = 1 : length(n)
    
    
    
 
    fprintf('n is %d',n(i)); disp(x_nodes);
    y_nodes = f(x_nodes);
    % p = polyfit(x_nodes,y_nodes,n(i));
    
    hold on
   
    plot(x_plo,w(x_plo),'-b','color','red');
    
    En =  f(x_plo) - w(x_plo);
    e(i) = max(abs(En));
    
    if e(i) < 10^(-4)
        fprintf('find %d',i);
    end
    e_estimate(i) = (1/(4*n(i)+1))*((b-a)/n(i))^(n(i)+1);
end

hold off
figure;
plot(n,e);hold on;
plot(n,e_estimate,'color','red');
title('error');
xlabel('n');
ylabel('error');