%Planets Demo v1: Ephemeride extraction

%This program takes .txt outputs from the JPL Solar System Dynamics 
%ephemeris project and converts them into a single array of 
%declinations for a given observer target

%Output from import tool: 12 years of mars declinations
decDMS=zeros(size(horizonsresults3));
for i=1:size(horizonsresults3,1)
    decDMS(i,:)=horizonsresults3(i,:);
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
plot(decDecimal)
save('marsEphemerides12Years.mat','decDecimal')
