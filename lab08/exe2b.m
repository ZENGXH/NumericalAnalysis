% A = [4, -2, -1;-1,3,-1;-1,-3,5];
% A = [5,1,1;1,10,1;1,1,4];
% A = diag(A,20);
% n = 1000;
% A1 = diag((-4)*ones(n,1));
% A2 = diag((-2)*ones(n-1,1),-1);
% A3 = diag((-1)*ones(n-2,1),-2);
% A4 = diag((-1)*ones(n-1,1),1);
% As = sparse(1:n,1:n, 4*ones(n,1),n,n) + ...
%     sparse(2:n,1:n-1, (-2)*ones(n-1,1),n,n) +...
%     sparse(3:n,1:n-2, (-1)*ones(n-2,1),n,n)  + ...
%     sparse(1:n-1,2:n, (-1)*ones(n-1,1),n,n)  + ...
%     sparse(1,n, -1 ,n,n) + sparse(n,1, 1 ,n,n);
% 
% A = A1+A2+A3+A4;
% A(n,1) = -1;
% A(1,n) = 1;

[L, U, P] = lu( A);
x_ex = ones([size(A,1),1],1);
b = A * x_ex;
R=chol(A);

RTX = forward_substitutions( R', b );
x = backward_substitutions( R, RTX );
% y  = forward_substitutions( L, P * b );
% x  = backward_substitutions( U, y );


 e = norm(x-x_ex) 
 

  