%geocentric1

%This is a geocentric generative model of the solar system, 
%where the sun and mars orbit earth.

function [result,cost] = geocentric2(rDifTrue)

%We begin by considering the terrestrial reference frame. Of course,
%that's the only frame we're interested in since earth is stationary in
%this model

years=12;
days=365;       
dailyPrec=chimpRandn('dP',0.0091,0.001);
r = chimpRandn('r',0.5,0.2);    
coordsMars=zeros(days*years,2);   

for i=1:days*years
    coordsMars(i,1)=r*sin(dailyPrec*i);
    coordsMars(i,2)=r*cos(dailyPrec*i);
end

addChimpCost(sum(abs((coordsMars(:,2)-rDifTrue(:,1)))))
    
result=coordsMars;
cost=sum(abs((coordsMars(:,2)-rDifTrue(:,1))));


end
