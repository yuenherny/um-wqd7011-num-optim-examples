clc; clear;
% simplex

disp("Q1")
C = [4; -3; -2; -1];
A = [1 1 1 1; 0 2 -2 -1];
b = [20; -10];
lb = [0; 0; 0; 0];
ub = [];
cType = "UL";
varType = "CCCC";
sense = -1;

[q1_xmin, q1_fmin] = glpk(C, A, b, lb, ub, cType, varType, sense);
q1_xmin
q1_fmin

disp("Q2")
C = [2; 6; 10];
A = [1 1 -4; 4 -3 2; 3 -1 6];
b = [4; -1; 8];
lb = [0; 0; 0];
ub = [];
cType = "SLU";
varType = "CCC";
sense = 1;

[q2_xmin, q2_fmin] = glpk(C, A, b, lb, ub, cType, varType, sense);
q2_xmin
q2_fmin

disp("Q3")
C = [4; -6; -5; 3];
A = [-2 5 -3 1; 5 0 2 3];
b = [20; 10];
lb = [0; 0; 0; 0];
ub = [];
cType = "US";
varType = "CCCC";
sense = 1;

[q3_xmin, q3_fmin] = glpk(C, A, b, lb, ub, cType, varType, sense);
q3_xmin
q3_fmin

disp("Q4")
C = [4; 6; -3; 5];
A = [2 6 2 0; 0 -3 5 4];
b = [20; 72];
lb = [0; 0; 0; 0];
ub = [];
cType = "SU";
varType = "CCCC";
sense = 1;

[q4_xmin, q4_fmin] = glpk(C, A, b, lb, ub, cType, varType, sense);
q4_xmin
q4_fmin

disp("Q5")
C = [3; 2; -5];
A = [1 2 -3; -2 1 0; 2 0 3];
b = [0; 5; 18];
lb = [0; 0; 0];
ub = [];
cType = "SLU";
varType = "CCC";
sense = -1;

[q5_xmin, q5_fmin] = glpk(C, A, b, lb, ub, cType, varType, sense);
q5_xmin
q5_fmin
