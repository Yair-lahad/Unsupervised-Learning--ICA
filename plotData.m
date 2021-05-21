function plotData(source, seperated)
% Plot source and seperated data after the ICA algorithem
% source - Source data.
%seperated - Data after the ICA algorithem.

channel_N = size(source, 2);
% Compute correlation with the source and seperated data
corelation_mat = corr(seperated, source);
sep_cor = abs(diag(corelation_mat));

% Plot
figure('units','normalized', 'position', [0.25 ,0.3, 0.4, 0.6]);
sgtitle('Corrolation between source and seperated data')
for i = 1 : channel_N
    subplot(2, channel_N, i);
    plot(source(:,i));
    title(['Source ',num2str(i)]);
    subplot(2,channel_N ,i + channel_N);
    plot(seperated(:,i));
    title(['Seperated' ,num2str(i), newline,'Cor - ' num2str(sep_cor(i))]);
    
end
