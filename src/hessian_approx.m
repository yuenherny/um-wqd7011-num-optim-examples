function B_new = sr1_bivariate(B_old, c_new, c_old, df)

  % calculate B at second point, B1 using BFGS
  s_old = c_new - c_old;
  y_old = df(c_new(1),c_new(2)) - df(c_old(1),c_old(2));
  B_new = B_old + ((y_old - B_old*s_old) * transpose(y_old - B_old*s_old)) / (transpose(y_old - B_old*s_old) * s_old);

endfunction

function B_new = bfgs_bivariate(B_old, c_new, c_old, df)

  % calculate B at second point, B1 using BFGS
  s_old = c_new - c_old;
  y_old = df(c_new(1),c_new(2)) - df(c_old(1),c_old(2));
  B_new = B_old - (B_old*s_old*transpose(s_old)*B_old / (transpose(s_old)*B_old*s_old)) + (y_old*transpose(y_old) / (transpose(y_old)*s_old));

 endfunction
