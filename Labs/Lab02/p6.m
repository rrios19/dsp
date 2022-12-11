% Tecnologico de Costa Rica
% EL5805 Digital Signal Processing
% Author: Ronald Rios Pineda
% Octave 7.2.0 on macOS Ventura 13.0.1
% Lab 02
% Description: Down sampling y(n) = x(n*k)

% Dependencies for "downsample" using "pkg" from the Octave prompt
% pkg install -forge signal
pkg load signal

addpath(pwd)

function y = down_sample(k)
    sci = 'sounds/sci.wav'; % Spaceship
    brd = 'sounds/brd.wav'; % Birdsong
    bng = 'sounds/bng.wav'; % Boing boing
    drm = 'sounds/drm.wav'; % Drum

    [x,Fs] = audioread(brd);

    y = downsample(x,k);
    sound(y,Fs/k)
end

y = down_sample(10);

