%geocentric1

%This is a geocentric generative model of the solar system, 
%where the sun and mars orbit earth.

function result = epicycle1(decDecimal)

%We begin by considering the terrestrial reference frame. Of course,
%that's the only frame we're interested in since earth is stationary in
%this model

years=12;
days=730;       %roughly two year period
%0.0172
%0.00915 actual
dailyPrec=chimpRandn('dP',0.00915,0.00005);   %rads/day mars orbiting earth
coords=zeros(days,1);
coordsAll=zeros(days*years/2,1);

R = chimpRandn('R',28,0.2);     %deferent radius
r = chimpRandn('r',14,0.2);     %epicycle radius
w1 = chimpRandn('w1',1,0.1);    %deferent angular frequency
w2 = chimpRandn('w2',2,0.5);    %epicycle angular frequency



%real part of Fourier series of two epicycles:
for i=1:days
    coords(i,1)=2*(R*sin(w1*i*dailyPrec)/pi - r*sin(w2*i*dailyPrec)/pi);
end

for i=1:years/2
    coordsAll((days*(i-1)+1):(days*i),1)=coords(:,1);
end

addChimpCost(10*sum((coordsAll(:,1)-decDecimal(1:4380,1)).^2))
addChimpCost(1000*(max(coordsAll(:,1)-max(decDecimal))^2))
addChimpCost(1000*(min(coordsAll(:,1)-min(decDecimal))^2))

result=coordsAll(:,1);


end
