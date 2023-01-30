% Tecnologico de Costa Rica
% EL5805 Digital Signal Processing
% Author: Ronald Rios Pineda
% Octave 7.2.0 on macOS Ventura 13.0.1
% Lab 09
% Description: Creation of .mat file

% Available sounds: bng brd drm sci
[x,Fs] = audioread("../Lab02/sounds/sci.wav");

ch = 1;
x = x(:,ch);

save("x.mat","x","Fs")

