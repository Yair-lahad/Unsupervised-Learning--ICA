function s = handleSepOutputs(s,sources,inputType)

% compute corrlation between original sources to s= learned seperated output sources
corrMat=abs(corr(sources,s));
% save corrolation matrice according to Type of data
outputName=append('./Results/Corrolation_Section_',inputType,'.mat');
save(outputName,'corrMat');
% Rearrange s according to original sources order
Ind = matchpairs(corrMat, 0, 'max');
Ind = Ind(:, 1);
s = s(:,Ind);

end