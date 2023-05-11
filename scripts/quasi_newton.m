clc, clear;
% quasi newton method

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
B0 = [1 0; 0 1] % B0 is always assumed to be an identity matrix

p0 = -inv(B0) * df(c0(1),c0(2))
c1 = c0 + p0

% calculate B at second point, B1
s0 = c1(1) - c0(1)
y0 = df(c1(1),c1(2)) - df(c0(1),c0(2))
##B1 = B0 + ((y0 - B0*s0) * transpose(y0 - B0*s0)) / (transpose(y0 - B0*s0) * s0)
B1 = B0 + (y0 - B0*s0) / s0

% calculate direction at second point
p1 = -inv(B1) * df(c1(1),c1(2))
c2 = c1 + p1

