clc, clear;
% steepest descent

% install first: https://gnu-octave.github.io/packages/symbolic/
pkg load symbolic % install first

% DEFINE YOUR FUNCTION HERE
syms x y;
f = sin(x+y) + (x-y)^2 - 1.5*x + 2.5*y + 1
c0 = [-1;-2];

% calculate gradient matrix
% ref: https://octave.sourceforge.io/symbolic/function/@sym/gradient.html
gradient_mat = gradient(f)
df = function_handle(gradient_mat)

% calculate direction at first point
p0 = -df(c0(1),c0(2))
c1 = c0 + p0

% calculate direction at second point
p1 = -df(c1(1),c1(2))
c2 = c1 + p1
