%geocentric1

%This is a heliocentric copernican model of the solar system,
%in which mars and earth orbit the sun. The sun is fixed and all
%orbits are perfectly circular.

function result = copernican1(decDecimal)

rEarth=18;       %in AU
rMars=chimpRandn('rMars',28,0.1);      %in AU
dailyPrecEarth=0.0172;      %period is one year
dailyPrecMars=0.00915;      %period is just under two years
years=12;
days=365;

%Earth
coordsEarth=zeros(days,2);
coordsAllEarth=zeros(days*years,2);

for i=1:days
    coordsEarth(i,1)=rEarth*sin(dailyPrecEarth*i);
    coordsEarth(i,2)=rEarth*cos(dailyPrecEarth*i);
end

for i=1:years
    coordsAllEarth((days*(i-1)+1):(days*i),1)=coordsEarth(:,1);
    coordsAllEarth((days*(i-1)+1):(days*i),2)=coordsEarth(:,2);
end

%Mars
coordsAllMars=zeros(days*years,2);

for i=1:days
    coordsAllMars(i,1)=rMars*sin(dailyPrecMars*i);
    coordsAllMars(i,2)=rMars*cos(dailyPrecMars*i);
end



% addChimpCost(sum(abs((coordsAll(:,2)-decDecimal(1:4380,1)))))
% addChimpCost(100*(max(coordsAll(:,2)-max(decDecimal))^2))
% addChimpCost(100*(min(coordsAll(:,2)-min(decDecimal))^2))
addChimpCost(1)
result=coordsAllMars(:,2);


end
