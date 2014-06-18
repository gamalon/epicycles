%geocentric1

%This is a heliocentric copernican model of the solar system,
%in which mars and earth orbit the sun. The sun is fixed and all
%orbits are perfectly circular.

function result = copernican1(decDecimal)

%rEarth=chimpRandn('rEarth',1,0.1);       %in AU
rEarth=1;
rMars=chimpRandn('rMars',1.5,0.5);      %in AU
dailyPrecEarth=chimpRandn('dPE',0.0172,0.0001);      %period is one year
dailyPrecMars=chimpRandn('dPM',0.00915,0.0001);      %period is just under two years
years=12;
days=365;

offset=365;         %to account for data starting mid-period
                    %skews left or right, min=1, units of days


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
    rDif(i,1)=-(coordsMars(i,1)-coordsEarth(i,1));
    rDif(i,2)=-(coordsMars(i,2)-coordsEarth(i,2));
end
rDifScale=chimpRandn('rDS',11,0.05);
rDif=rDif*rDifScale;       %scaling to declination
%addChimpCost(sum(abs((rDif(:,2)-decDecimal(1:size(rDif),1)))))
% addChimpCost(100*(max(coordsAll(:,2)-max(decDecimal))^2))
% addChimpCost(100*(min(coordsAll(:,2)-min(decDecimal))^2))
for i=1:size(rDif)
    addChimpCost(abs(rDif(i,2)-decDecimal(i,1)))
end

result=rDif(:,2);


end
