%% exe2
f = @(x) sin(x);
a = 0;
b = 3 * pi;
inter = b - a;
x_plo = linspace(a,b,1001);
y_true = f(x_plo);
plot(x_plo,y_true,'b');
hold on;
e = [];
e_estimate = [];

for n = 1 : 7
    
    x_nodes = linspace(a, b, n+1 );
    % equally space nodes
    fprintf('n is %d',n); disp(x_nodes);
    y_nodes = f(x_nodes);
    p = polyfit(x_nodes,y_nodes,n);
    
    hold on
    plot(x_plo,polyval(p,x_plo),'-b');
    
    En =  f(x_plo) - polyval(p,x_plo) ;
    e(n) = max(abs(En));
    e_estimate(n) = (1/(4*n+1))*((b-a)/n)^(n+1);
end

hold off
figure;
plot(1:7,e);hold on;
plot(1:7,e_estimate);
title('error');
xlabel('n');
ylabel('error');