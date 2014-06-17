%geocentricHarness1 
%Harness for geocentric1, loads .mat file generated from 
%ephemerideExtract.m

%loads decDecimal
load('marsEphemerides12Years.mat');

burnin=0;
samples=1000;
spacing=0;

results=chimplify(@geocentric1,burnin,samples,spacing,{decDecimal});
plot(results{samples},'b')
hold on
plot(decDecimal,'m')
hold off