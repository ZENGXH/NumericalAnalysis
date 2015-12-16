clear
A1 = [3,-2,1;2,1.65,-1;0,1,4]
det1 = det(A1)
A2 = [5,-3,-2;-3,3,0;-2,0,4]
det2 = det(A2)

n = 100;

A3 = diag(4*ones([1,n])) + diag((-1)*ones([1,n-1]),-1) + diag((-1)*ones([1,n-1]),1);

A = A1
D= tril(A) +  triu(A) - A;
PJ = D;
BJ = eye(size(A,1)) - inv(PJ)*A;
pBJ = max(abs(eig(BJ)))

PGS = tril(A);
BGS = eye(size(A,1)) -inv(PGS)*A;
pBGS = max(abs(eig(BGS)))