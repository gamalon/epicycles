rEarth=1;       %in AU
rMars=1.5;      %in AU
dailyPrecEarth=0.0172;      %period is one year
dailyPrecMars=0.00915;      %period is just under two years
years=12;
days=365;

%Earth
coordsEarth=zeros(days*years,2);

for i=1:days*years
    coordsEarth(i,1)=rEarth*sin(dailyPrecEarth*i);
    coordsEarth(i,2)=rEarth*cos(dailyPrecEarth*i);
end

%Mars
coordsMars=zeros(days*years,2);

for i=1:days*years
    coordsMars(i,1)=rMars*sin(dailyPrecMars*i);
    coordsMars(i,2)=rMars*cos(dailyPrecMars*i);
end
rDif=zeros(days*years,2);
for i=1:days*years
    rDif(i,1)=coordsMars(i,1)-coordsEarth(i,1);
    rDif(i,2)=coordsMars(i,2)-coordsEarth(i,2);
end

%plot(coordsEarth(:,1),coordsEarth(:,2),coordsMars(:,1),coordsMars(:,2))
%plot((rDif(:,1)),(rDif(:,2)))
plot(rDif(:,2))



