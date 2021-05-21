function saveOutputs(s,inputType,nDim,Fs)

%saves output audio seprerated sources sorted into correct section

for i=1:nDim
    if inputType=='A'
        filename=append('./Results/noiseless_result_A',num2str(i),'.wav');
    elseif inputType=='B'
        filename=append('./Results/noisy_result_B',num2str(i),'.wav');
    else
        filename=append('./Results/sanger_noisy_result_C',num2str(i),'.wav');
    end
    audiowrite(filename,rescale(s(:,i),-1,1),Fs);
end
end