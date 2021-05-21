function [g, gp] = ActCos(x)
%LINEAR Linear activation function
% g     - x
% gp    - 1
g = cos(x);
gp = -sin(x);

end