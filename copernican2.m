%geocentric1

%This is a heliocentric copernican model of the solar system,
%in which mars and earth orbit the sun. The sun is fixed and all
%orbits are perfectly circular.

function result = copernican2(rDifTrue)

rEarth=chimpRandn('aEarth',1.0000,0.05);       %semimajor axis in AU
rMars=chimpRandn('aMars',1.5237,0.05);        
dailyPrecEarth=chimpRandn('dPE',0.0172,0.0001);      %period is one year
dailyPrecMars=chimpRandn('dPM',0.00915,0.0001);      %period is just under two years
years=12;
days=365;
offset=1;


%Earth
coordsEarth=zeros(days*years-offset+1,2);

for i=1:days*years-offset+1
    coordsEarth(i,1)=rEarth*sin(dailyPrecEarth*(i+offset-1));
    coordsEarth(i,2)=rEarth*cos(dailyPrecEarth*(i+offset-1));
end

%Mars
coordsMars=zeros(days*years-offset+1,2);

for i=1:days*years-offset+1
    coordsMars(i,1)=rMars*sin(dailyPrecMars*(i+offset-1));
    coordsMars(i,2)=rMars*cos(dailyPrecMars*(i+offset-1));
end
rDif=zeros(days*years-offset+1,2);
for i=1:days*years-offset+1
    rDif(i,1)=(coordsMars(i,1)-coordsEarth(i,1));
    rDif(i,2)=(coordsMars(i,2)-coordsEarth(i,2));
end

for i=1:size(rDif)
    addChimpCost(abs(rDif(i,2)-rDifTrue(i,2)))
end

result=[rDif,coordsEarth,coordsMars];


end
