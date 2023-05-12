clc, clear;
% check if matrix is positive definite

A = [3]
B = [3 0; 7 2]
C = [3 0 -5; 7 2 0; -4 -2 1]

% 1 is symmetric positive definite
% 0 is symmetric positive semidefinite
% -1 is not both
C_isposdef = isdefinite(C)

detA = det(A)
detB = det(B)
detC = det(C)
