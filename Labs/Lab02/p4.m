% Tecnologico de Costa Rica
% EL5805 Digital Signal Processing
% Author: Ronald Rios Pineda
% Octave 7.2.0 on macOS Ventura 13.0.1
% Lab 02
% Description: Add and play signals y(n) = x1(n) + x2(n)

sci = 'sounds/sci.wav'; % Spaceship
brd = 'sounds/brd.wav'; % Birdsong
bng = 'sounds/bng.wav'; % Boing boing
drm = 'sounds/drm.wav'; % Drum

[x1,f1] = audioread(sci);
[x2,f2] = audioread(drm);
[x3,f3] = audioread(brd);
[x4,f4] = audioread(bng);

assert(f1,f2);
assert(f1,f3);
assert(f1,f4);
Fs = f1;    % Same sample rate

function play_add(x1,x2,x3,Fs)
    c = 1; % Channel
    m = max([length(x1) length(x2)]);
    x1 = [x1(:,c);zeros(m-length(x1),1)];
    x2 = [x2(:,c);zeros(m-length(x2),1)];
    x3 = [x3(:,c);zeros(m-length(x3),1)];

    add = (1/3)*x1(:,1) + (1/3)*x2(:,1) + (1/3)*x3(:,1);

    sound(add, Fs)
end

x4 = [x4;x4;x4;x4;x4];  % Four times "boing"

play_add(x1,x2,0 ,Fs)   % With two signals
%play_add(x1,x2,x3,Fs)   % With three signals
%play_add(x1,x2,x4,Fs)   % With three signals

