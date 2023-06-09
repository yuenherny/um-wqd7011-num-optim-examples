clc, clear;
% compute gradient and hessian matrix

% install first: https://gnu-octave.github.io/packages/symbolic/
pkg load symbolic % install first

% DEFINE YOUR FUNCTION HERE
##func = @(x,y) 2*x^3*y - 3*x*y^2 + x*sin(y);
##syms x y;
##f = func(x,y);

func = @(x,y) sin(x+y) + (x-y)^2 - 1.5*x + 2.5*y + 1
syms x y;
f = func(x,y);

% calculate gradient matrix
% ref: https://octave.sourceforge.io/symbolic/function/@sym/gradient.html
gradient_mat = gradient(f)

% calculate hessian matrix
% ref: https://octave.sourceforge.io/symbolic/function/@sym/hessian.html
hessian_mat = hessian(f)

% compute the gradient and hessian at a point
X = -1;
Y = -2;

df = function_handle(gradient_mat)
df(X,Y)

ddf = function_handle(hessian_mat)
ddf(X,Y)
