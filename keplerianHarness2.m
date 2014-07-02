%geocentricHarness1 
%Harness for geocentric1, loads .mat file generated from 
%ephemerideExtract.m

%loads ground truth
load('gTModel.mat');
load('gTMarsDec.mat');

burnin=1;
samples=500;
spacing=0;

[results,cost]=chimplify(@keplerian2,burnin,samples,spacing,{rDifTrue});
resultsKeplerian=results;
costKeplerian=cost;
subplot(1,2,1)
plot(results{samples}(:,2),'b')
hold on
plot(rDifTrue(:,2),'m')
hold off
subplot(1,2,2)
plot(results{samples}(:,3),results{samples}(:,4),'b',coordsEarthTrue(:,1),coordsEarthTrue(:,2),'m')
hold on
plot(results{samples}(:,5),results{samples}(:,6),'b',coordsMarsTrue(:,1),coordsMarsTrue(:,2),'m')
hold off

save('resultsKeplerian1.mat','resultsKeplerian')