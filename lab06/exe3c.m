%% exe2.c least square degree2 minimize err at perticular 3 points

clear;
f = @(x) 1./(1 + x);
a = 0;
b = 5;
x_plo = linspace(a,b,1001);
y_true = f(x_plo);
figure;
plot(x_plo,y_true,'g','LineWidth',4);

hold on;
e = [];
e_estimate = [];
x_nodes = [0,1/2,1];
y_nodes = f(x_nodes);
%% set poly=2 with 9 nodes : least square degree 2;
    p_leastsquare = polyfit(x_nodes,y_nodes,1);
    
    hold on
    plot(x_plo,polyval(p_leastsquare,x_plo),'-r');
    
    En =  f(x_plo) - polyval(p_leastsquare,x_plo) ;
    e_leastsquare = max(abs(En));
    % e_ls_esti = (1/(4*n(i)+1))*((b-a)/n(i))^(n(i)+1);
fprintf('err ls de2 %f \n',e_leastsquare);
% fprintf('ls predict at 2: %f',polyval(p_leastsquare,2));
