%geocentricHarness1 
%Harness for geocentric1, loads .mat file generated from 
%ephemerideExtract.m

%loads decDecimal
load('gTModel.mat');
load('gTMarsDec.mat');

burnin=1;
samples=100;
spacing=0;

results=chimplify(@keplerian1,burnin,samples,spacing,{rDifTrue});
% plot(results{samples},'b')
% hold on
% plot(decDecimal,'m')
% hold off
% 
% subplot(1,2,1)
% plot(coordsEarth(:,1),coordsEarth(:,2),coordsMars(:,1),coordsMars(:,2))
% subplot(1,2,2)
% %plot(declination)
% plot(rDif(:,2))