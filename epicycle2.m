%This is the epicycle model of the solar system. This consists of a single
%epicycle with a single deferent. 

function result = epicycle2(rDifTrue)

years=12;
days=365;      
dailyPrec=chimpRandn('dP',0.00915,0.00005);   %rads/day mars orbiting earth

R = chimpRandn('R',0.5,0.5);     %deferent radius
r = chimpRandn('r',0.2,0.5);     %epicycle radius
w1 = chimpRandn('w1',1,0.1);    %deferent angular frequency
w2 = chimpRandn('w2',2,0.5);    %epicycle angular frequency

coordsMars=zeros(size(rDifTrue,1),2);

%orbit is two element complex Fourier series:
for i=1:days*years
    coordsMars(i,1)=real(R*exp(1j*w1*i*dailyPrec)+r*exp(1j*w2*i*dailyPrec));
    coordsMars(i,2)=imag(R*exp(1j*w1*i*dailyPrec)+r*exp(1j*w2*i*dailyPrec));
end

%declination is real component with complex radius (basically)
rDif=zeros(size(rDifTrue,1),1);
for i=1:days
    rDif(i,1)=2*(R*sin(w1*i*dailyPrec)/pi - r*sin(w2*i*dailyPrec)/pi);
end

addChimpCost(sum(abs(rDif(:,1)-rDifTrue(:,2))))

result=[rDif,coordsMars];


end
