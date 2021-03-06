%% exe2.b
% piece wise linear interplo poltnormial
clear;
f = @(x) exp(-(x.^2)/2);
a = -5;
b = 5;

x_plo = linspace(a,b,1001);
y_true = f(x_plo);
figure;
plot(x_plo,y_true,'g','LineWidth',4);

hold on;
e = [];
e_estimate = [];



 %n = [2,7,12,22,27,32];
n = 2:32;
% n = [29];

for i = 1 : length(n) % degree
    H = (b-a)/n(i); 
    x_nodes = linspace(a, b, n(i)+1);
    % equally space nodes
    % fprintf('n is %d',n(i)); disp(x_nodes);
    y_nodes = f(x_nodes);
    % p = polyfit(x_nodes,y_nodes,n(i));
%     yi = interp1(x,Y,xi) interpolates to find yi, the values of the 
%     underlying function Y at the points in the vector or array xi.
    y_predict = interp1(x_nodes,y_nodes,x_plo);

hold on
    plot(x_plo,y_predict,'-b');
    
    En =  f(x_plo) - y_predict ;
    e(n(i)) = max(abs(En));
    f2 = @(x) f(x).*(x.^2 - 1);
    e_estimate(n(i)) = (1/8)*H^2*max(abs(f2(x_plo))) ;
end

% ho

%% exe2.b
% piecewise polynomial form of the 
% cubic spline interpolant

% n = 7;
% x_nodes = linspace(a, b, n+1);
% y_nodes = f(x_nodes);
% y_predict = spline(x_nodes,y_nodes,x_plo);
% hold on
%     plot(x_plo,y_predict,'-r');
    
for i = 1 : length(n) % degree
    H = (b-a)/n(i); 
    x_nodes = linspace(a, b, n(i)+1);
    % equally space nodes
    % fprintf('n is %d',n(i)); disp(x_nodes);
    y_nodes = f(x_nodes);
    % p = polyfit(x_nodes,y_nodes,n(i));
%     yi = interp1(x,Y,xi) interpolates to find yi, the values of the 
%     underlying function Y at the points in the vector or array xi.
    y_predict = spline(x_nodes,y_nodes,x_plo);

hold on
    plot(x_plo,y_predict,'-r');
    
    En_s3 =  f(x_plo) - y_predict ;
    e_s3(n(i))= max(abs(En_s3));

    % e_estimate(n(i)) = (1/8)*H^2*max(abs(f2(x_plo))) ;
end    
    
    
    
    
hold off;
figure;
 semilogy(n,e(2:n(i)));hold on;
 semilogy(n,e_s3(2:n(i)),'r');hold on;
 semilogy(n,e_estimate(2:n(i)),'color','red');
 
title('error');
xlabel('n');
ylabel('error');    