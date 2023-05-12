clc, clear;
% compute gradient and hessian matrix

% install first: https://gnu-octave.github.io/packages/symbolic/
pkg load symbolic % install first

% DEFINE YOUR FUNCTION HERE
##func = @(x,y) 2*x^3*y - 3*x*y^2 + x*sin(y);
##syms x y;
##f = func(x,y);

func = @(x) cos(2*x^3) - 6*x^2
syms x;
f = func(x);

% calculate gradient matrix
% ref: https://octave.sourceforge.io/symbolic/function/@sym/gradient.html
gradient_mat = gradient(f)

% calculate hessian matrix
% ref: https://octave.sourceforge.io/symbolic/function/@sym/hessian.html
hessian_mat = hessian(f)
