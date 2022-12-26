% Tecnologico de Costa Rica
% EL5805 Digital Signal Processing
% Author: Ronald Rios Pineda
% Octave 7.2.0 on macOS Ventura 13.0.1
% Lab 05
% Description: Convolution using circshift 

addpath(pwd)

function [n,y] = my_conv(x,h)
    n = 0:length(x)+length(h)-2;
    y = zeros(1,length(n));
    xs = [zeros(1,length(h)-1),x];
    hs = [flip(h),zeros(1,length(x)-1)];
    for i=0:length(y)-1
        y(i+1) = circshift(hs,i) * xs'; 
    end
end

function my_plot(n,x,i,s)
    subplot(2,3,i)
    stem(n,x)
    title(['y_',num2str(i),'[n]'])
    xlim([0, s])
    grid on
end

x = [1 4 2 3 5 3 3 4 5 7 6 9];
n = 0:length(x)-1;

h1 = [1 1];
h2 = [1 2 1];
h3 = [1/2 1/2];
h4 = [1/4 1/2 1/4];
h5 = [1/4 -1/2 1/4];
h6 = [1/2 -1/2];

fig1 = figure('name','Convolution');
clf;

[n1,y1] = my_conv(x,h1);
my_plot(n1,y1,1,n1(end)) % h[n] = 1 1 

[n2,y2] = my_conv(x,h2);
my_plot(n2,y2,2,n2(end)) % h[n] = 1 2 1

[n3,y3] = my_conv(x,h3);
my_plot(n3,y3,3,n3(end)) % h[n] = 1/2 1/2

[n4,y4] = my_conv(x,h4);
my_plot(n4,y4,4,n4(end)) % h[n] = 1/4 1/2 1/4

[n5,y5] = my_conv(x,h5);
my_plot(n5,y5,5,n5(end)) % h[n] = 1/4 -1/2 1/4

[n6,y6] = my_conv(x,h6);
my_plot(n6,y6,6,n6(end)) % h[n] = 1/2 -1/2

fig2 = figure('name','Convolution');
clf;
subplot(3,1,1)
stem(n,x)
title(['x[n]'])
subplot(3,1,2)
stem(n2,y2)
title(['y_2[n]'])
subplot(3,1,3)
stem(n6,y6)
title(['y_6[n]'])

% a)
% The systems h1 and h2 have a soft output, like a low-pass filter, but 
% h2 makes a softer output than h1. The systems h3 and h4 have a soft 
% output too, like h1 and h2, but h3 is equal to h1 with a scale factor 
% of 1/2 and h4 is equal to h2 with a scale factor of 1/4.

% b)
% The impulse response of h4 is the same of h2 with a scale factor of 
% 1/4, like a LTI system. The soft effect doesn't change with a scale, 
% it only changes with the relationship between the coefficients of the 
% impulse response.

% c)
% The output y5 is different from the other four systems. The output y5
% is like an oscillanting wave, it looks like frequency components near 
% to 1/2, like the highest frequencies in discrete time. This behavior 
% is like a high-pass filter.
  
% d)
% The system h2 is the same system h1 with a scale factor, so the system
% h6 is the same system h5 with a scale factor, so the system h6 has the 
% same high-pass filter behavior. 

