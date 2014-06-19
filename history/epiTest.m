function epiTest(R,r,W,w,period)
times=0:2*period*pi/365:2*period*pi;
subplot(3,1,1)
plot((real(R*exp(1i*W*times)+r*exp(1i*w*times))),(imag(R*exp(1i*W*times)+r*exp(1i*w*times))))
subplot(3,1,2)
plot(cos(real(R*exp(1i*W*times)+r*exp(1i*w*times))))
subplot(3,1,3)
plot(cos(imag(R*exp(1i*W*times)+r*exp(1i*w*times))))
end
