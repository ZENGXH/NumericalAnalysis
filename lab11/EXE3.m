nnodes = 29;
KK = 400;

A = bridge_stiffness_matrix( 29, KK );

plot_bridge( nnodes, A )
condest(A) % inf - A is singular


A2 = A(3:57, 3:57);
condest(A2)

fext_odd = [0, -1];
b = zeros(58-3,2);

M = eye(58);
eigs(sparse(A),sparse(M), 6)