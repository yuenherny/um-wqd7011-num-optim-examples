clc, clear;
% steepest descent

% install first: https://gnu-octave.github.io/packages/symbolic/
pkg load symbolic % install first

% DEFINE YOUR FUNCTION HERE
syms x y;
f = 2*x^3*y - 3*x*y^2 + x*sin(y);
x0 = 1; y0 = 2;

% calculate gradient matrix
% ref: https://octave.sourceforge.io/symbolic/function/@sym/gradient.html
gradient_mat = gradient(f)
df = function_handle(gradient_mat)

% calculate direction at first point
p = -df(x0,y0)
new_point = [x0;y0] + p

