%% exe3 runge function
clear;
f = @(x) 1./(1 + x.^2);
a = -5;
b = 5;
inter = b - a;
x_plo = linspace(a,b,1001);
y_true = f(x_plo);
plot(x_plo,y_true,'b');
hold on;
e = [];
e_estimate = [];
n = [1,2,4,8,12];
for i = 1 : length(n)
    
    x_nodes = linspace(a, b, n(i)+1 );
    fprintf('n is %d',n(i)); disp(x_nodes);
    y_nodes = f(x_nodes);
    p = polyfit(x_nodes,y_nodes,n(i));
    
    hold on
    plot(x_plo,polyval(p,x_plo),'-b');
    
    En =  f(x_plo) - polyval(p,x_plo) ;
    e(i) = max(abs(En));
    e_estimate(i) = (1/(4*n(i)+1))*((b-a)/n(i))^(n(i)+1);
end

hold off
figure;
plot(n,e);hold on;
plot(n,e_estimate,'color','red');
title('error');
xlabel('n');
ylabel('error');