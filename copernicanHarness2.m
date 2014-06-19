%copernican harness


load('gTModel.mat');
load('gTMarsDec.mat');

burnin=1;
samples=100;
spacing=0;

results=chimplify(@copernican2,burnin,samples,spacing,{rDifTrue});
resultsCopernican=results;
subplot(1,2,1)
plot(results{samples}(:,1),'b')
hold on
plot(rDifTrue(:,2),'m')
hold off
subplot(1,2,2)
plot(results{samples}(:,3),results{samples}(:,4),'b',coordsEarthTrue(:,1),coordsEarthTrue(:,2),'m')
hold on
plot(results{samples}(:,5),results{samples}(:,6),'b',coordsMarsTrue(:,1),coordsMarsTrue(:,2),'m')
hold off

save('resultsCopernican1.mat','resultsCopernican')