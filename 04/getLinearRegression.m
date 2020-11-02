## Copyright (C) 2017 Ondřej Pražák


## Author: Ondřej Pražák <ondraprazak@ondraprazak-Inspiron-7548>
## Created: 2017-08-14

function [linReg] = getLinearRegression ()

  linReg.cost  = @linRegCost;
  linReg.opt = @gradientDescent;
  linReg.predict = @linRegPredict;
  linReg.options.alpha = 0.01;
  linReg.options.num_iters = 400;

end
