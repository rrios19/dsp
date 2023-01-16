% Tecnologico de Costa Rica
% EL5805 Digital Signal Processing
% Author: Ronald Rios Pineda
% Octave 7.2.0 on macOS Ventura 13.0.1
% Lab 12
% Description: Filter using DFT and overlap-save algorithm

% Dependencies for "downsample" using "pkg" from the Octave prompt
% pkg install -forge signal
%pkg load signal

%addpath(pwd)

F1 = 1000;  % Analog F = 1kHz 
F2 = 2000;  % Analog F = 2kHz
F3 = 3000;  % Analog F = 3kHz
Fs = 44100; % Sampling rate

n = 0:10*Fs-1;
N = 1024;

w1 = 2*pi*F1/Fs;
w2 = 2*pi*F2/Fs;
w3 = 2*pi*F3/Fs;

xn = 2*sin(w1*n) + sin(w2*n) + 2*sin(w3*n);

% Filter: FIR 43
load("FIR.mat")

% Overlap-save
M = length(Num);
L = N - (M - 1);
mx = round(length(xn)/L)-1;
Hk = fft(Num,N);    % Filter
m_1 = zeros(1,M-1); % Initial condition
yn = [];            % Output filter
for i = 1:mx
    x_b = xn((i-1)*L+1:i*L);
    buffer = [m_1,x_b];
    y_b = ifft(fft(buffer, N).*Hk, N);
    m_1 = y_b(1:M-1);
    yn = [yn,y_b(M:end)];
end

% Testbench
y_exp = sin(w2*n);
yc = conv(xn,Num);
n0 = 200000;
n1 = n0 + 100;
% Figure
fig = figure('name','Filter using fft');
clf;
t = ['             x(n)             ';
     'FIR using overlap-save and fft';
     '    FIR using convolution     ';
     '    FIR vs ideal filtering    '];
pr = [xn(1:length(yn));yn;yc(1:length(yn))];
for i=1:3
    subplot(4,1,i)
    stem(pr(i,n0:n1))
    title(t(i,:))
    xlim([0 100])
end
subplot(4,1,4)
stem(yn(n0:n1))
hold on
stem(yc(n0:n1))
hold off
title(' Overlap-save vs convolution  ')
xlim([0 100])

printf("Playing x(n)\n")
sound(xn,Fs)
printf("Playing y(n) using fft\n")
sound(yn,Fs)
printf("Playing y(n) using conv\n")
sound(yc,Fs)

% Filtro FIR 43
% As we saw in the figure 1, the first subplot shows x(n), it had the 
% three frequencies, the second subplot shows the FIR filter output 
% using overlap-save and fft, the next subplot shows the FIR filter
% output using convolution, and the final subplot shows both outputs, 
% fft vs convolution. 
% Both outputs look very equal, in the sound test I noticed a small
% difference between both outputs, the output using overlap-save and fft
% has a strange backgrond sound.
% To improve the output we should have a filter larger, but it means
% that Hk have to be larger too, so L have to be smaller and it makes
% the overlap-save algorithm inefficient. With a larger N we probably 
% have latency problems or more use of computer resources.

