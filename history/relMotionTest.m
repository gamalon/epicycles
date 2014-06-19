eEarth=0.0167;
eMars=0.0933;
aEarth=1.0000;       %in AU
aMars=1.5237;      %in AU
dailyPrecEarth=0.0172;      %period is one year
dailyPrecMars=0.00915;      %period is just under two years
years=12;
days=365;
offset=0;
obliquity=0.440;        %radians
load('marsEphemerides12YearsReal.mat')

%Earth
coordsEarth=zeros(days*years-offset+1,2);

for i=1:days*years
    coordsEarth(i,1)=((aEarth*(1-eEarth^2))/(1+eEarth*cos(dailyPrecEarth*(i+offset-1))))*sin(dailyPrecEarth*(i+offset-1));
    coordsEarth(i,2)=((aEarth*(1-eEarth^2))/(1+eEarth*cos(dailyPrecEarth*(i+offset-1))))*cos(dailyPrecEarth*(i+offset-1));
end

%Mars
coordsMars=zeros(days*years-offset+1,2);

for i=1:days*years-offset+1
    coordsMars(i,1)=((aMars*(1-eMars^2))/(1+eMars*cos(dailyPrecMars*(i+offset-1))))*sin(dailyPrecMars*(i+offset-1));
    coordsMars(i,2)=((aMars*(1-eMars^2))/(1+eMars*cos(dailyPrecMars*(i+offset-1))))*cos(dailyPrecMars*(i+offset-1));
end
rDif=zeros(days*years-offset+1,2);
for i=1:days*years-offset+1
    rDif(i,1)=-(coordsMars(i,1)-coordsEarth(i,1));
    rDif(i,2)=-(coordsMars(i,2)-coordsEarth(i,2));
end
radiusDif=zeros(days*years-offset+1,1);
for i=1:days*years-offset+1
    radiusDif(i,1)=((aMars*(1-eMars^2))/(1+eMars*cos(dailyPrecMars*(i+offset-1))))...
        -((aEarth*(1-eEarth^2))/(1+eEarth*cos(dailyPrecEarth*(i+offset-1))));
end
declination=zeros(days*years-offset+1,1);
for i=1:days*years-offset+1
    declination(i)=asin(sin(obliquity)*rDif(i,2)/radiusDif(i,1));
end


%plot(coordsEarth(:,1),coordsEarth(:,2),coordsMars(:,1),coordsMars(:,2))
%plot((rDif(:,1)),(rDif(:,2)))
%plot(11*rDif(:,2))

% plot(declination)
% hold on
% plot(decDecimalMod,'r')
% plot(decDecimal,'g')
% hold off
lonDif=atan(rDif(:,2)/rDif(:,1));
declination=asin(sin(obliquity)*sin(lonDif));
plot(declination)

% subplot(2,3,1)
% plot(decDecimal,'r')
% subplot(2,3,2)
% plot(rDif(1:10000,2))
% subplot(2,3,3)
% plot(rDif(10000:15000,2))
% subplot(2,3,4)
% plot(rDif(15000:20000,2))
% subplot(2,3,5)
% plot(rDif(20000:25000,2))
% subplot(2,3,6)
% plot(rDif(25000:30000,2))
% 
