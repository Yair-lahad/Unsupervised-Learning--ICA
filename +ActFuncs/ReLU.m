function [g, gp] = ReLU(x)
%ReLU Linear activation function
% g:    - 0   x<0
%       - x   x>0
% gp:   - 0   x<=0
%       - 1   x>=0
g = zeros(size(x));
gp = zeros(size(x));
g(x>0) = x(x>0);
g(x<=0) = 0;
gp(x>0) = 1;
gp(x<=0) = 0;

end