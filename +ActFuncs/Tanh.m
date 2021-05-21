function [g, gp] = Tanh(x)
%TANH Hyperbolic tangent
% g     - tanh(x)
% gp    - 1 - g^2
g = tanh(x);
gp = 1 - g.^2;

end

