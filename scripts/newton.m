clc, clear;
% newton method

% install first: https://gnu-octave.github.io/packages/symbolic/
pkg load symbolic % install first

% DEFINE YOUR FUNCTION HERE
syms x y;
f = 2*x^3*y - 3*x*y^2 + x*sin(y);
c0 = [1;2];

% calculate gradient matrix
% ref: https://octave.sourceforge.io/symbolic/function/@sym/gradient.html
gradient_mat = gradient(f)
df = function_handle(gradient_mat)

% calculate hessian matrix
% ref: https://octave.sourceforge.io/symbolic/function/@sym/hessian.html
hessian_mat = hessian(f)
ddf = function_handle(hessian_mat)
is_pos_def = isdefinite(ddf(c0(1),c0(2)))

% calculate direction at first point
p = -inv(ddf(c0(1),c0(2))) * df(c0(1),c0(2))
c1 = c0 + p
