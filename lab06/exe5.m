x0 = 0;
x1 = 2*pi/3;
x2 = 4*pi/3;
x3 = 2*pi;
x_nodes = [x0,x1,x2,x3];
y_nodes = [0,2/3,2/3,0];
phi0= @(x) (x-x1).*(x-x2).*(x-x3)/((x0-x1)*(x0-x2)*(x0-x3));
phi1= @(x) (2/3)*(x-x0).*(x-x2).*(x-x3)/((x1-x0)*(x1-x2)*(x1-x3));
phi2= @(x) (2/3)*(x-x0).*(x-x1).*(x-x3)/((x2-x1)*(x2-x0)*(x2-x3));
phi3= @(x) (x-x1).*(x-x2).*(x-x0)/((x3-x1)*(x3-x2)*(x3-x0));

x_plo = linspace(0,2*pi,100);
y = phi1(x_plo) + phi2(x_plo);
plot(x_plo,y,'g'); hold on;
f1 = @(x) 1/pi * x;
f2 = @(x) 2 - 1/pi * x;
 plot(x_plo,f1(x_plo)); hold on;
 plot(x_plo,f2(x_plo)); hold on;

    p_leastsquare = polyfit(x_nodes,y_nodes,1);
    
    
     plot(x_plo,polyval(p_leastsquare,x_plo),'-r'); hold on;
    
    En1 =  f1(x_plo) - polyval(p_leastsquare,x_plo) ;
    En2 =  f2(x_plo) - polyval(p_leastsquare,x_plo) ;
    %e_leastsquare = max(abs(En));
x_nodes = [x0,1/6 * pi,1/3 * pi,1/2*pi,x1,5/6*pi,pi,7/6*pi,x2,9/6*pi,5/3 *pi,11/6*pi,x3];
y_nodes = [0,1/6,1/3,3/6,2/3,5/6,1,5/6,2/3,3/6,1/3,1/6,0];
a = 0;
b = 2*pi;
T = b-a;
t = x_nodes; V = y_nodes;
N = length(V);m = 1500;
M = N*m;

ti = linspace(a,b,M);
Vi = interpft(V,M);
plot(t,V,'O','color','r');
hold on;
plot(ti,Vi,'-','color','r');
legend('Original data','Interpolated data')
Ef2 = (max(Vi) - min(Vi))/max(Vi);
display(Ef2);


    