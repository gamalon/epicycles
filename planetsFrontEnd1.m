%planetsFrontEnd1

load('resultsCopernican1.mat')
load('resultsEpicycle1.mat')
load('resultsGeocentric1.mat')
load('resultsKeplerian1.mat')
load('gTMarsDec.mat')
load('gTModel.mat')

%geocentric
subplot(4,2,1)
plot(resultsGeocentric{size(resultsGeocentric,1)}(:,2),'b')
hold on
plot(rDifTrue(:,2),'m')
hold off
subplot(4,2,2)
plot(coordsEarthTrue(:,1),coordsEarthTrue(:,2),'m')
hold on
plot(resultsGeocentric{size(resultsGeocentric,1)}(:,1),resultsGeocentric{size(resultsGeocentric,1)}(:,2),'b',coordsMarsTrue(:,1),coordsMarsTrue(:,2),'m')
hold off

%epicycles
subplot(4,2,3)
plot(resultsEpicycle{size(resultsEpicycle,1)}(:,3),'b')
hold on
plot(rDifTrue(:,2),'m')
hold off
subplot(4,2,4)
plot(coordsEarthTrue(:,1),coordsEarthTrue(:,2),'m')
hold on
plot(resultsEpicycle{size(resultsEpicycle,1)}(:,2),resultsEpicycle{size(resultsEpicycle,1)}(:,3),'b',coordsMarsTrue(:,1),coordsMarsTrue(:,2),'m')
hold off

%copernican heliocentric
subplot(4,2,5)
plot(resultsCopernican{size(resultsCopernican,1)}(:,1),'b')
hold on
plot(rDifTrue(:,2),'m')
hold off
subplot(4,2,6)
plot(resultsCopernican{size(resultsCopernican,1)}(:,3),resultsCopernican{size(resultsCopernican,1)}(:,4),'b',coordsEarthTrue(:,1),coordsEarthTrue(:,2),'m')
hold on
plot(resultsCopernican{size(resultsCopernican,1)}(:,5),resultsCopernican{size(resultsCopernican,1)}(:,6),'b',coordsMarsTrue(:,1),coordsMarsTrue(:,2),'m')
hold off

%keplerian heliocentric
subplot(4,2,7)
plot(resultsKeplerian{size(resultsKeplerian,1)}(:,2),'b')
hold on
plot(rDifTrue(:,2),'m')
hold off
subplot(4,2,8)
plot(resultsKeplerian{size(resultsKeplerian,1)}(:,3),resultsKeplerian{size(resultsKeplerian,1)}(:,4),'b',coordsEarthTrue(:,1),coordsEarthTrue(:,2),'m')
hold on
plot(resultsKeplerian{size(resultsKeplerian,1)}(:,5),resultsKeplerian{size(resultsKeplerian,1)}(:,6),'b',coordsMarsTrue(:,1),coordsMarsTrue(:,2),'m')
hold off

