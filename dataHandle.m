function [X,Fs]=dataHandle(inputType)
% extract sound source files into matrices using audioread
% sources of audio \ noisy mix data \ noiseless mix data
inputSize=3;
if inputType=='C'
    inputSize=7;
end

for i=1:inputSize
    if inputType==0
        filename=append(".\Data\source", num2str(i),".wav");
    elseif inputType=='A'
        filename=append(".\Data\mix", num2str(i),".wav");
    else
        filename=append(".\Data\noisy_mix", num2str(i),".wav");
    end
    [X(:,i),Fs]=audioread(filename);
end
end