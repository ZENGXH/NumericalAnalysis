nnodes = 29;
KK = 1000;

A = bridge_stiffness_matrix( 29, KK );

plot_bridge( nnodes, A )
condest(A) % inf - A is singular


A2 = A(3:57, 3:57);
condest(A2)

fext_odd = [0, -1];
b = zeros(58-3,2);
size(b)
for i = 1:28
    b(2 * i - 1, :) = fext_odd;
end

% d = A2 \ b;
% plot_bridge(27, d)

[L, U, P] = lu( A2);
% x_ex = ones([size(A2,1),1],1);
% b = A * x_ex;
R=chol(A2);

RTX = forward_substitutions( R', b );
d = backward_substitutions( R, RTX );

plot_bridge( 27, d)
tol = 5 * 10^(-5);
d2 = gmres( A2, b, [], tol, 58-3 );
