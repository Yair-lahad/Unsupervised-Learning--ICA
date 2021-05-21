function W = sanger(data,eta)
% Sanger's rule function.
% finds the weights that represent the eigenvectors

% Parameters and initialization
[sampleSize,nChannels]=size(data);
nEpochs=6;
data=data-mean(data);
W=rand(nChannels); % initialize weights randomly
% Converge max eigenvector at a time
for c=1:nChannels
    randOrder=randperm(sampleSize); % Shuffle the sampels
    for ep=1:nEpochs
        for i= 1:sampleSize
            x=data(randOrder(i),:)';
            y=W*x; % Compute output
            dW = eta*y(c)*(x-W(1:c,:)'*y(1:c)); % Compute weights change
            W(c, :) = W(c, :) + dW'; % Update weights
        end
        eta=0.1/(1+1e-4*ep); % update learning rate
    end
end
W = W'; % return eigs as coloums

