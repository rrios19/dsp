% Tecnologico de Costa Rica
% EL5805 Digital Signal Processing
% Author: Ronald Rios Pineda
% Octave 7.2.0 on macOS Ventura 13.0.1
% Lab 10
% Description: LTI system as frequency selective filter

load("x.mat")

% Analog:
F1 = 200;
F2 = 2000;
% Digital:
w1 = 2*pi*(F1/Fs);
w2 = 2*pi*(F2/Fs);
printf("w_1 = %d and w_2 = %d\n",w1,w2)

n = 1:length(x);
x1 = x' + cos(w1*n);
x2 = x1 + cos(w2*n);

%          b0(1 - 2*cos(w1)*z^-1 + z^-2)
% H(z) = ---------------------------------
%        (1 - 2*r*cos(w1)*z^-1 + r^2*z^-2)

y1 = [0 0];
r = 0.98;
b0 = (1-2*cos(w1)+1)/(1-2*r*cos(w1)+r^2);

for i = 3:length(x2)
    y1(i) = 2*r*cos(w1)*y1(i-1) - (r^2)*y1(i-2) + b0*x2(i) - b0*2*cos(w1)*x2(i-1) + b0*x2(i-2);
end

%          b0(1 - 2*cos(w2)*z^-1 + z^-2)
% H(z) = ---------------------------------
%        (1 - 2*r*cos(w2)*z^-1 + r^2*z^-2)

y2 = [0 0];
r = 0.98;
b0 = (1-2*cos(w2)+1)/(1-2*r*cos(w2)+r^2);

for i = 3:length(y1)
    y2(i) = 2*r*cos(w2)*y2(i-1) - (r^2)*y2(i-2) + b0*y1(i) - b0*2*cos(w2)*y1(i-1) + b0*y1(i-2);
end

% Run p2
% sound(x,Fs)  Input x(n)
% sound(x1,Fs) x(n) + cos(w1*n)
% sound(x2,Fs) x(n) + cos(w1*n) + cos(w2*n)
% sound(y1,Fs) Rejects w1
% sound(y2,Fs) Rejects w2, equal to input x(n)

% Punto 2.h
% I think this lab is so important to understand how digital filters work.
% First of all, the input x(n) sounds amazing without noise, of course. 
% Then with w1 I can hear the input very disturbed and the tone w1 very 
% disturbed too, so that's because both gains were added and the final 
% gain is higher than 100% volume, well the same thing happened when w2
% was added, I think it got worst. After the filters the output is almost
% the same input x(n) but with less volume.
  
