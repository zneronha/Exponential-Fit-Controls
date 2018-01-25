function ControlExpFitJAN25
%run July 23 2017


%Control Exponential fit, current as of January 25 2018


clearvars
close all
clc

desiredwells = [22 70];
figure1 = figure;

cmap = cbrewer('qual','Set1',numel(desiredwells),'cubic');
colorcounter = 1;

for j = desiredwells
    filename = sprintf('w%d_data.mat',j);

    load(filename);
    overall;
    pop = overall(:,1);

    time = overall(:,2)./4;
    [z r] = fit(time,pop,'exp1')
    
    h = plot(z);
    set(get(get(h,'Annotation'),'LegendInformation'),'IconDisplayStyle','off');
    hold on

    plot(time,pop,'color',cmap(colorcounter,:),'linewidth',2)

    colorcounter = colorcounter + 1;

    hold on
% %     b = sprintf('.jpg');
% %     imagename = strcat(wellname,b)
% %     saveas(a,imagename)
    
end
ylim([0 1000]);
title('Exponential Growth?')
xlabel('Time (hours)')
ylabel('Number of Cells')
legend('GM Ctrl','GM OHT','EGF Starved','EGF Starved OHT','location','nw')
print(gcf,'ExponentialFitPlot2','-depsc','-r1000')

end