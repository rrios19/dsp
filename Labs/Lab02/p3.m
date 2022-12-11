% Tecnologico de Costa Rica
% EL5805 Digital Signal Processing
% Author: Ronald Rios Pineda
% Octave 7.2.0 on macOS Ventura 13.0.1
% Lab 02
% Description: Flip a signal y(n) = x(-n)

sci = 'sounds/sci.wav'; % Spaceship
brd = 'sounds/brd.wav'; % Birdsong
bng = 'sounds/bng.wav'; % Boing boing
drm = 'sounds/drm.wav'; % Drum

[y,Fs] = audioread(sci);
[r,c] = size(y);
y = flip(y);
sound(y, Fs)

