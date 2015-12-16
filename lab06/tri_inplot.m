% exe
% trigonometric interpolataion
t =[0,0.07,0.14,0.21,0.28,0.35,0.42,0.49,0.56,0.63,0.70];
V =[194,184,177,156,142,160,168,166,170,178,187];
a = 0;
b = 0.77;
T = b-a;

N = length(V);m = 500;
M = N*m;

ti = linspace(a,b,M);
Vi = interpft(V,M);
plot(t,V,'O');
hold on;
plot(ti,Vi,'.');
legend('Original data','Interpolated data')
Ef1 = (max(Vi) - min(Vi))/max(Vi);
display(Ef1);

%% evaluate point 7;
t =[0,0.07,0.14,0.21,0.28,0.35,0.42,0.49,0.56,0.63,0.70];
V =[194,184,177,156,142,160,168,166,170,178,187];
a = 0;
b = 0.77;
T = b-a;
V(8) = 0.5 *(V(7)+V(9));
N = length(V);m = 500;
M = N*m;

ti = linspace(a,b,M);
Vi = interpft(V,M);
plot(t,V,'O','color','r');
hold on;
plot(ti,Vi,'-','color','r');
legend('Original data','Interpolated data')
Ef2 = (max(Vi) - min(Vi))/max(Vi);
display(Ef2);

