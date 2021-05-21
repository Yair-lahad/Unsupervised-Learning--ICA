function [g, gp] = Sigmoid(x)
%SIGMOID Sigmoidal function
% g     - 1/(1+exp(-x))
% gp    - g*(1 - g)
g = 1./(1 + exp(-x));
gp = g.*(1 - g);

end

