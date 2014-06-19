%This generates an exact orbit (to first order) of mars and earth,
%complete with declinations observed from a generic geocentric observer
%over twelve years. This will serve as ground truth for now due to
%uncertainties in time (retrograde not exactly truly periodic) and 
%observer location. Ideally we will want to be able to model that 
%uncertainty in the future. 

eEarth=0.0167;       %eccentricity
eMars=0.0933;
aEarth=1.0000;       %in AU
aMars=1.5237;        %in AU
dailyPrecEarth=0.0172;      %period is one year
dailyPrecMars=0.00915;      %period is just under two years
years=12;
days=365;
obliquity=0.440;        %radians
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

lonDif=atan(rDif(:,2)/rDif(:,1));       %Difference in ecliptic longitude

% for i=1:days*years-offset+1
%     lonDif(i)=atan(((coordsEarth(i,2)/coordsEarth(i,1))-(coordsMars(i,2)/coordsMars(i,1)))/(1+(coordsEarth(i,2)*coordsMars(i,2))/(coordsEarth(i,1)*coordsMars(i,1))));
% end

declination=(180/pi)*asin(sin(obliquity)*sin(lonDif));




subplot(1,2,1)
plot(coordsEarth(:,1),coordsEarth(:,2),coordsMars(:,1),coordsMars(:,2))
subplot(1,2,2)
%plot(declination)
plot(rDif(:,2))
%axis([0 4380 -40 40])
rDifTrue=rDif;
coordsEarthTrue=coordsEarth;
coordsMarsTrue=coordsMars;
save('gTMarsDec.mat','rDifTrue')
save('gTModel','coordsEarthTrue','coordsMarsTrue')



