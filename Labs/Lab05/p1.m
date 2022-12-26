% Tecnologico de Costa Rica
% EL5805 Digital Signal Processing
% Author: Ronald Rios Pineda
% Octave 7.2.0 on macOS Ventura 13.0.1
% Lab 05
% Description: Convolution

addpath(pwd)

function [n,h] = get_signal(a,k)
    % h(n) = (a)^n * u(u) * u(-n+k)
    n = 0:k;
    h = (a.^n).*ones(1,length(n));
end

function [n,y] = my_conv(x,h)
    n = 0:length(x)+length(h)-2;
    y = zeros(1,length(n));
    xs = [zeros(1,length(h)-1),x];
    hs = [flip(h),zeros(1,length(x)-1)];
    for i=0:length(y)-1
        y(i+1) = circshift(hs,i) * xs'; 
    end
end

function my_plot(x,i,s,text)
    subplot(2,2,i)
    stem(x(1,:),x(2,:))
    title([text])
    xlim([0, s])
end

h = zeros(2,7 ); % h(n) = (a)^n * u(n) * u(-n+k),   a=1/3,  k=6
[h(1,:),h(2,:)] = get_signal(1/3,6); 

x = zeros(2,21); % x(n) = (a)^n * u(n) * u(-n+k),   a=-1/2, k=20
[x(1,:),x(2,:)] = get_signal(-1/2,20);

y = zeros(2,length(x)+length(h)-1);

fig = figure('name','Convolution');
clf;

my_plot(x,1,20,'x[n]')
my_plot(h,3,6 ,'h[n]')

[y(1,:),y(2,:)] = my_conv(x(2,:),h(2,:));
my_plot(y,4,26,'my\_conv(x[n],h[n])')

y(2,:) = conv(x(2,:),h(2,:));
my_plot(y,2,26,'conv(x[n],h[n]')

