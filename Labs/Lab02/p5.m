% Tecnologico de Costa Rica
% EL5805 Digital Signal Processing
% Author: Ronald Rios Pineda
% Octave 7.2.0 on macOS Ventura 13.0.1
% Lab 02
% Description: Add and delay signals y(n) = x1(n-k) + x2(n-m)

addpath(pwd)

function y = delay_add(k,m)
    sci = 'sounds/sci.wav'; % Spaceship
    brd = 'sounds/brd.wav'; % Birdsong
    bng = 'sounds/bng.wav'; % Boing boing
    drm = 'sounds/drm.wav'; % Drum
    [x1,f1] = audioread(sci);
    [x2,f2] = audioread(bng);
    assert(f1,f2);
    Fs = f1;    % Same sample rate

    c = 1 ; % Channel
    x1 = [zeros(k,1);x1(:,c)]; % Set delay k
    x2 = [zeros(m,1);x2(:,c)]; % Set delay m
    mx = max([length(x1) length(x2)]);
    x1 = [x1;zeros(mx-length(x1),1)];
    x2 = [x2;zeros(mx-length(x2),1)];
    
    y = (1/2)*x1 + (1/2)*x2;
    sound(y,Fs)
end

y = delay_add(0,200000);

