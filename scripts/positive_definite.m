% positive definite

% eigenvalues positive
% for all m subset of [1,n] determinant of A(m) > 0

M_posdef = [7 -4 1; -4 5 0; 1 0 6]

isposdef = isdefinite(M_posdef)

