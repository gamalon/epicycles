%geocentricHarness1 
load('gTModel.mat');
load('gTMarsDec.mat');

burnin=1;
samples=500;
spacing=0;

[results,cost]=chimplify(@geocentric2,burnin,samples,spacing,{rDifTrue});
resultsGeocentric=results;
subplot(1,2,1)
plot(results{samples}(:,2),'b')
hold on
plot(rDifTrue(:,2),'m')
hold off
subplot(1,2,2)
plot(coordsEarthTrue(:,1),coordsEarthTrue(:,2),'m')
hold on
plot(results{samples}(:,1),results{samples}(:,2),'b',coordsMarsTrue(:,1),coordsMarsTrue(:,2),'m')
hold off
%plot(cost)
save('resultsGeocentric1.mat','resultsGeocentric')