x_nodes = [0: 0.25: 1];
y_nodes = [3.38 3.86 3.85 3.59 3.49];
p = polyfit(x_nodes,y_nodes,4);
fprintf('get p ')
fprintf('%f ',p);
% for function use y_nodes as f(xnodes)