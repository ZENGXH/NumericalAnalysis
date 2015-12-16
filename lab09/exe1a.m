n=9;
A1 = diag(3*ones([1,n])) + diag((-1)*ones([1,n-1]),-1) + diag((-2)*ones([1,n-1]),1);
A2 = hilb(n);
x_true = ones([n,1]);

[V1,D1] = eig(A1)
[V2,D2] = eig(A2)

for i = 1:n
    det1 = det(A1(1:i,1:i))
end

for i = 1:n
    det2 = det(A1(1:i,1:i))
end

b1=A1*x_true;
b2=A2*x_true;

[L1,U1,P1] = lu(A1)

y1  = forward_substitutions( L1, P1 * b1 );
x1  = backward_substitutions( U1, y1 );

[L2,U2,P2] = lu(A2)

y2  = forward_substitutions( L2, P2 * b2 );
x2  = backward_substitutions( U2, y2 );

e1 = norm(x1-x_true)/norm(x1)
e2 = norm(x2-x_true)/norm(x2)

r1 = norm(b1 -A1*x1)/norm(b1)
r2 = norm(b2 -A2*x2)/norm(b2)

cp1_1 = cond(A1,1)
cp1_2 = cond(A2,1)
cp2_1 = cond(A1,2)
cp2_2 = cond(A2,2)
