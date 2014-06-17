%geocentric1

%This is a geocentric generative model of the solar system, 
%where the sun and mars orbit earth.

function result = geocentric1(decDecimal)

%We begin by considering the terrestrial reference frame. Of course,
%that's the only frame we're interested in since earth is stationary in
%this model

years=12;
days=365;
dailyPrec=0.0172;   %rads/day mars orbiting earth
coords=zeros(days,2);
coordsAll=zeros(days*years,2);

r = chimpRandn('r',28,0.1);     %hand-tuned mean, var for now

for i=1:days
    coords(i,1)=r*sin(dailyPrec*i);
    coords(i,2)=r*cos(dailyPrec*i);
end

for i=1:years
    coordsAll((days*(i-1)+1):(days*i),1)=coords(:,1);
    coordsAll((days*(i-1)+1):(days*i),2)=coords(:,2);
end

addChimpCost(sum((coordsAll(:,2)-decDecimal(1:4380,1)).^2))
    
result=coordsAll(:,2);


end
