%geocentricHarness1 
%Harness for geocentric1, loads .mat file generated from 
%ephemerideExtract.m

%loads decDecimal
load('marsEphemerides12Years.mat');

burnin=100;
samples=1000;
spacing=0;
offset=1;       %hand tune to account for data offset

results=chimplify(@epicycle1,burnin,samples,spacing,{decDecimal});
plot(results{samples}(offset:size(decDecimal)-4,1),'b')
hold on
plot(decDecimal,'m')
hold off