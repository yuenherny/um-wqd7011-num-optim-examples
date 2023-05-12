clc, clear;
% quasi newton with step length

% install first: https://gnu-octave.github.io/packages/symbolic/
pkg load symbolic % install first
source("../src/hessian_approx.m")

% DEFINE YOUR FUNCTION HERE
syms x y;
f = x^4 + x*y + (1 + y)^2
c0 = [0;1];
alpha = 1;

% calculate gradient matrix
% ref: https://octave.sourceforge.io/symbolic/function/@sym/gradient.html
gradient_mat = gradient(f);
df = function_handle(gradient_mat)

% calculate hessian matrix
% ref: https://octave.sourceforge.io/symbolic/function/@sym/hessian.html
hessian_mat = hessian(f);
ddf = function_handle(hessian_mat)
##is_pos_def = isdefinite(ddf(c0(1),c0(2)))
is_pos_def = isdefinite(ddf(c0(1)))

% calculate direction at first point
B0 = [1 0; 0 1]; % B0 is always assumed to be an identity matrix

p0 = -inv(B0) * df(c0(1),c0(2));
c1 = c0 + alpha*p0

% calculate B at second point, B1 using SR1
##s0 = c1 - c0;
##y0 = df(c1(1),c1(2)) - df(c0(1),c0(2));
##B1 = B0 + ((y0 - B0*s0) * transpose(y0 - B0*s0)) / (transpose(y0 - B0*s0) * s0)
B1 = sr1_bivariate(B0, c1, c0, df)

% calculate direction at second point
p1 = -inv(B1) * df(c1(1),c1(2))
c2 = c1 + alpha*p1
