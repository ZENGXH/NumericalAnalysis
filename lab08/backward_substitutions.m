function [ x ] = backward_substitutions( U, y )
% BACKWARD_SUBSTITUTIONS solve the linear system U x = y by means of the
% backward subsitutions algorithm; U must be an upper triangular matrix
%  [ x ] = backward_substitutions( U, y )
%  Inputs: U = upper triangular matrix (square matrix)
%          y = vector (right hand side of the linear system)
%  Output: x = solution vector (column vector)
%

m = length(y);
x = zeros (1,m);
x(m) = y(m) / U(m,m);


for i = m - 1 : -1 : 1
        sumA = sum( U(i, i+1:m) .* x(i+1:m) );
    x(i) = 1 / U(i,i) * (y(i) - sumA);
end
x = x';
return