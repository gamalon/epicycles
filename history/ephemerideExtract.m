%Planets Demo v1: Ephemeride extraction

%This program takes .txt outputs from the JPL Solar System Dynamics 
%ephemeris project and converts them into a single array of 
%declinations for a given observer target

%Output from import tool: 12 years of mars declinations
decDMS=zeros(size(horizonsresults7));
for i=1:size(horizonsresults7,1)
    decDMS(i,:)=horizonsresults7(i,:);
end

%Converting from degrees/minutes/seconds to decminal declinations:
decDecimal=zeros(size(decDMS,1),1);
for i=1:size(decDecimal)
    if decDMS(i,1) < 0
        decDecimal(i)=-(abs(decDMS(i,1))+ decDMS(i,2)/60 + decDMS(i,3)/3600);
    else
        decDecimal(i)=(decDMS(i,1)+ decDMS(i,2)/60 + decDMS(i,3)/3600);
    end
end

years=12;
days=365;

decDecimalMod=zeros(size(decDecimal,1),1);        %modified for daytime
for i=1:size(decDecimal)
    decDecimalMod(i)=decDecimal(i);
end
for i=1:years
    decDecimalMod((130+(i-1)*days+1):days*i)=NaN;
end

xpoints=[1:days*years];
scatter(xpoints,decDecimalMod(1:4380,1),'r+')


save('marsEphemerides12Years.mat','decDecimal')
save('marsEphemerides12YearsReal.mat','decDecimalMod')
