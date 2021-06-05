%% Exercise 5- Independent component analysis (ICA)

% yair lahad
clear; close all; clc;
% This code uses infomax ICA algorighm in order to seperate mixed sounds
% into their sources, also include PCA and sanger rule methods

% input: audio data - sources, noisy or noiseless mix of sources
% output: seperation audio and corrolation matrices Per Section - saved in Results folder

%% Parameters and initialization
nDim=3;
nEpochs=10;
actFunc=@ActFuncs.Sigmoid;
W=rand(nDim);   %weights matrix
eta=0.1;        %learning rate

% Handle the Data
[sources,Fs]=dataHandle(0); %get Sources
% change files according to input type 
inputType='A';   % A = noiseless mix ,  B= noisy mix ,  C= sanger noisy mix
X=dataHandle(inputType); % get input matrice of mixed data (noisy \ noiseless)
sampleSize=size(X,1);


%% Learning and Analysis
if inputType=='C'
    % In this section (C) we have 7 input audio mixes and use sanger rule
    % to reduce dimensions to 3 in order to calculate the output sources
    
    sangW = sanger(X,eta); % Compute eigenvectors using sanger's rule
    pcaW = pca(X); % Compute eigenvectors using matlab's PCA function
    % Compare eigenvectors computed by both methods
    dist=sqrt(sum((sangW-pcaW).^2));
    % Reduce the data dimensions using sanger computed weights
    X = X*sangW(:,1:nDim);
end
% Perform ICA
for ep=1:nEpochs
    randOrder = randperm(sampleSize);
    for i=1:sampleSize
        xi=X(randOrder(i),:)';
        g=actFunc(W*xi);
        y=1-2*g;
        dw=eta*(inv(W')+y*xi'); %learning rule of weights
        W=W+dw; %update weights
    end
    eta=0.1/(1+1e-4*ep); %update eta each epoch
end
% Output Seperated Sources
s=(W*X')';
% compute and save correlations. also reorgenize output in original sources order
s = handleSepOutputs(s,sources,inputType);
%% plotting 
plotData(sources,s);
%save files
saveOutputs(s,inputType,nDim,Fs);



