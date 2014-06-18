%geocentricHarness1 
%Harness for geocentric1, loads .mat file generated from 
%ephemerideExtract.m

%loads decDecimal
load('marsEphemerides12Years.mat');

burnin=1;
samples=100;
spacing=0;

results=chimplify(@copernican1,burnin,samples,spacing,{decDecimal});
plot(results{samples},'b')
hold on
plot(decDecimal,'m')
hold off