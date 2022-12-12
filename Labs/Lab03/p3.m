% Tecnologico de Costa Rica
% EL5805 Digital Signal Processing
% Author: Ronald Rios Pineda
% Octave 7.2.0 on macOS Ventura 13.0.1
% Lab 03
% Description: Harmonics

addpath(pwd)

function y = harmonic(F)
    Fs = 44100;
    t = 1;  % Time
    n = 0:1:Fs*t-1;
    nl = length(n);
    hl = floor(22000/F);
    y = zeros(1,nl*hl);
    
    for i=1:hl
        f = (F*i)/Fs;
        y((i-1)*nl+1 : i*nl) = sin(2*pi*f*n);
    end
    
    fprintf('Harmonics: %0d, for F = %0dHz, expected time: %0ds\n',i,F,t*hl);
    sound(y,Fs);
end

y = harmonic(440); % Test with 220 Hz

