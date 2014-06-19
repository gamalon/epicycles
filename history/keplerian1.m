%The final model fits keplerian orbits (heliocentric ellipticals)
function [rDif,coordsEarth,coordsMars] = keplerian1(rDifTrue)

eEarth=chimRandn('eEarth',0.0167,0.1);       %eccentricity
eMars=chimpRandn('eMars',0.0933,0.1);
aEarth=chimpRandn('aEarth',1.0000,1);       %semimajor axis in AU
aMars=chimpRandn('aMars',1.5237,1);        
dailyPrecEarth=chimpRandn('dPE',0.0172,0.1);      %daily precession in radians
dailyPrecMars=chimpRandn('dPM',0.00915,0.1);      
years=12;
days=365;
obliquity=0.440;        %radians, not used yet
offset=1;


%Earth
coordsEarth=zeros(days*years-offset+1,2);

for i=1:days*years
    coordsEarth(i,1)=((aEarth*(1-eEarth^2))/(1+eEarth*cos(dailyPrecEarth*(i+offset-1))))*cos(dailyPrecEarth*(i+offset-1));
    coordsEarth(i,2)=((aEarth*(1-eEarth^2))/(1+eEarth*cos(dailyPrecEarth*(i+offset-1))))*sin(dailyPrecEarth*(i+offset-1));
end

%Mars
coordsMars=zeros(days*years-offset+1,2);

for i=1:days*years-offset+1
    coordsMars(i,1)=((aMars*(1-eMars^2))/(1+eMars*cos(dailyPrecMars*(i+offset-1))))*cos(dailyPrecMars*(i+offset-1));
    coordsMars(i,2)=((aMars*(1-eMars^2))/(1+eMars*cos(dailyPrecMars*(i+offset-1))))*sin(dailyPrecMars*(i+offset-1));
end

rDif=zeros(days*years-offset+1,2);
for i=1:days*years-offset+1
    rDif(i,1)=(coordsMars(i,1)-coordsEarth(i,1));
    rDif(i,2)=(coordsMars(i,2)-coordsEarth(i,2));
end

%lonDif=atan(rDif(:,2)/rDif(:,1));       %Difference in ecliptic longitude, not used yet

% for i=1:days*years-offset+1
%     lonDif(i)=atan(((coordsEarth(i,2)/coordsEarth(i,1))-(coordsMars(i,2)/coordsMars(i,1)))/(1+(coordsEarth(i,2)*coordsMars(i,2))/(coordsEarth(i,1)*coordsMars(i,1))));
% end

%declination=(180/pi)*asin(sin(obliquity)*sin(lonDif));

addChimpCost(abs(rDif(:,2)-rDifTrue(:,2)))


end




