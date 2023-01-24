% Tecnologico de Costa Rica
% EL5805 Digital Signal Processing
% Author: Ronald Rios Pineda
% Octave 7.2.0 on macOS Ventura 13.0.1
% Lab 07
% Description: Frequency analysis

load ("xn.mat")
%N = seqperiod(x4)
N = 30;
n = 0:N-1;     % 1x30
k = (0:N-1)';  % 30x1
E = exp(-j*2*pi*k*n/N); % Each row ck

x4 = x4(1:N);
ck = E*x4';  % 30x30 * 30x1 = 30x1

f1 = 6/N;
f2 = 10/N;
f3 = 15/N;
xn = (cos(2*pi*f1*n)+cos(2*pi*f2*n)+cos(2*pi*f3*n))';

yp = [x4;ck';xn'];
tp = ['      x(n)      ';
      '       ck       ';
      'Synthesized x(n)';
      '      Both      '];

fig = figure('name','Frequency analysis');
clf;
for i=1:3
    subplot(4,1,i)
    stem(n,yp(i,:))
    title(tp(i,:))
end
subplot(4,1,4)
stem(n,yp(1,:))
hold on
stem(n,yp(3,:))
title(tp(4,:))

