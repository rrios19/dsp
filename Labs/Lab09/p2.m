% Tecnologico de Costa Rica
% EL5805 Digital Signal Processing
% Author: Ronald Rios Pineda
% Octave 7.2.0 on macOS Ventura 13.0.1
% Lab 09
% Description: LTI system as frequency selective filter

% Dependencies for 'signal' using "pkg" from the Octave prompt
% pkg install -forge signal
pkg load signal

addpath(pwd)

function H = get_HW(num,den,omega)
     m = max(length(num),length(den));
     p = (m-1:-1:0)';
     e = exp(j*p*omega);
     num = num*e(end-length(num)+1:end,:);
     den = den*e(end-length(den)+1:end,:);
     H = (num)./(den);
end

num = { [0.1 0]
        [0.1 0] 
        [0.0957 0 -0.0957] 
        [0.0951 0 -0.0951] 
        [0.0950 0 -0.0950]};

den = { [1 -0.9]
        [1 +0.9] 
        [1 -1.8*cos(pi/8) 0.81]
        [1 -1.8*cos(pi/4) 0.81] 
        [1 -1.8*cos(pi/2) 0.81]};

w = [-pi:pi/100:pi]';

color = [0.4940 0.1840 0.5560];
fig = figure('name','LTI system as selective frequency filter');
clf;
for i = 1:5
    subplot(3,5,i)
    zplane(num{i},den{i})
    title(['H_' num2str(i) '(z)'])
    HW = get_HW(num{i},den{i},w');
    subplot(3,5,i+5)
    plot(w,abs(HW),'LineWidth',1.2,'Color',color)
    title(['|H_' num2str(i) "(w)|"])
    axis([-pi pi])
    grid on
    grid minor
    subplot(3,5,i+10)
    plot(w,rad2deg(angle(HW)),'LineWidth',1.2,'Color',color)
    title(['< H_' num2str(i) '(w)'])
    axis([w(1) w(end)])
    grid on
    grid minor
end

load("x.mat"); % Load 'x' and 'Fs'

% First filter
y1 = 0;
for i =2:length(x)
    y1(i) = 0.9*y1(i-1)+0.1*x(i);
end

% Second filter
y2 = 0;
for i =2:length(x)
    y2(i) = -0.9*y2(i-1)+0.1*x(i);
end

% Third filter
y3 = [0 0];
for i = 3:length(x)
    y3(i) = 1.8*cos(pi/8)*y3(i-1)-0.81*y3(i-2)+0.0957*x(i)-0.0957*x(i-2);
end

% Fourth filter
y4 = [0 0];
for i = 3:length(x)
    y4(i) = 1.8*cos(pi/4)*y4(i-1)-0.81*y4(i-2)+0.0951*x(i)-0.0951*x(i-2);
end

% Fifth filter
y5 = [0 0];
for i = 3:length(x)
    y5(i) = 1.8*cos(pi/2)*y5(i-1)-0.81*y5(i-2)+0.0950*x(i)-0.0950*x(i-2);
end

% Original sound:
% sound(x,Fs)
% Each filter y1, y2, y3, y4, y5 
% sound(y1,Fs)

% H1(w) : Low-pass filter
% H2(w) : High-pass filter
% H3(w) : Band-pass filter with w0 = pi/8
% H4(w) : Band-pass filter with w0 = pi/4
% H5(w) : Band-pass filter with w0 = pi/2

