clc, clear;
% newton method

% install first: https://gnu-octave.github.io/packages/symbolic/
pkg load symbolic % install first

% DEFINE YOUR FUNCTION HERE
syms x y;
f = sin(x+y) + (x-y)^2 - 1.5*x + 2.5*y + 1
c_init = [-1;-2];

% calculate gradient matrix
% ref: https://octave.sourceforge.io/symbolic/function/@sym/gradient.html
gradient_mat = gradient(f)
df = function_handle(gradient_mat)

% calculate hessian matrix
% ref: https://octave.sourceforge.io/symbolic/function/@sym/hessian.html
hessian_mat = hessian(f)
ddf = function_handle(hessian_mat)

max_iter = 20;
c_curr = c_init;
alpha = 0.1;

for i=1:max_iter

  p = -inv(ddf(c_curr(1),c_curr(2))) * df(c_curr(1),c_curr(2));
  c_next = c_curr + alpha*p;

  c_curr = c_next;

endfor

disp("Search stopped")
disp(c_curr)
