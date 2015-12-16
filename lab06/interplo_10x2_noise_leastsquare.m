g = @(x) 10*x.^2;
% add noise
f = @(x) g(x) + 2 * rand(size(x))-1;
a = 0;
b = 1;
inter = b - a; % in (0,1)
x_plo = linspace(a,b,1001);
y_true = f(x_plo);
plot(x_plo,y_true,'b');
hold on;

e = [];
e_estimate = [];
n = [9];
for i = 1 : length(n) % degree
    
    x_nodes = linspace(a, b, n(i)+1 );
    % equally space nodes
    fprintf('n is %d',n(i)); disp(x_nodes);
    y_nodes = f(x_nodes);
    p = polyfit(x_nodes,y_nodes,n(i));
    
    hold on
    plot(x_plo,polyval(p,x_plo),'-b');
    
    En =  f(x_plo) - polyval(p,x_plo) ;
    e(n(i)) = max(abs(En));
    e_estimate(n(i)) = (1/(4*n(i)+1))*((b-a)/n(i))^(n(i)+1);
end
fprintf('err ls linear interpl %f and %f \n',e(n(i)),e_estimate(n(i)));
fprintf('poly predict at 2: %f \n',polyval(p,2));

%% set poly=2 with 9 nodes : least square degree 2;
    p_leastsquare = polyfit(x_nodes,y_nodes,2);
    
    hold on;
    plot(x_plo,polyval(p_leastsquare,x_plo),'-r');
    
    En =  f(x_plo) - polyval(p_leastsquare,x_plo) ;
    e_leastsquare = max(abs(En));
    e_ls_esti = (1/(4*n(i)+1))*((b-a)/n(i))^(n(i)+1);
fprintf('err ls de2 %f and %f \n',e_leastsquare,e_ls_esti);
fprintf('ls predict at 2: %f \n',polyval(p_leastsquare,2));
%% set poly=2 with 9 nodes : least square degree 3;
    p_leastsquare = polyfit(x_nodes,y_nodes,3);
    
    hold on;
    plot(x_plo,polyval(p_leastsquare,x_plo),'-y');
    hold off;
    En =  f(x_plo) - polyval(p_leastsquare,x_plo) ;
    e_leastsquare = max(abs(En));
    e_ls_esti = (1/(4*n(i)+1))*((b-a)/n(i))^(n(i)+1);    
fprintf('err ls de3 %f and %f\n',e_leastsquare,e_ls_esti);



% hold off
% figure;
% plot(1:length(n),e);hold on;
% plot(1:length(n),e_estimate);
% title('error');
% xlabel('n');
% ylabel('error');


%% least square approximate;

% x_nodes = linspace(a, b, n(i)+1 );
% y_nodes = f(x_nodes);

% tX = [ones(length(x_nodes),1),(x_nodes)',(x_nodes.^2)' ];
