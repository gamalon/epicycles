%Harness for running epicycle model



load('gTModel.mat');
load('gTMarsDec.mat');

burnin=1;
samples=500;
spacing=0;

[results,cost]=chimplify(@epicycle2,burnin,samples,spacing,{rDifTrue});
resultsEpicycle=results;
costEpicycle=cost;
subplot(1,2,1)
plot(results{samples}(:,3),'b')
hold on
plot(rDifTrue(:,2),'m')
hold off
subplot(1,2,2)
plot(coordsEarthTrue(:,1),coordsEarthTrue(:,2),'m')
hold on
plot(results{samples}(:,2),results{samples}(:,3),'b',coordsMarsTrue(:,1),coordsMarsTrue(:,2),'m')
hold off

save('resultsEpicycle1.mat','resultsEpicycle')
