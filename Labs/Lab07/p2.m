% Tecnologico de Costa Rica
% EL5805 Digital Signal Processing
% Author: Ronald Rios Pineda
% Octave 7.2.0 on macOS Ventura 13.0.1
% Lab 07
% Description: Frequency analysis

warning off
pkg load symbolic
addpath(pwd)

function my_fourier(x,i)
    global omega;
    n = 0:length(x) - 1;
    E = exp(-j*omega*n);
    X = E*x;
    subplot(3,2,i-1)
    plot(omega,abs(X))
    title(['Fourier transform X_',num2str(i/2),' Magnitude'])
    subplot(3,2,i)
    plot(omega,angle(X))
    title(['Fourier transform X_',num2str(i/2),' Phase'])
end 

function my_ztrans(W,i)
    global omega;
    subplot(3,2,i-1)
    plot(omega,abs(W))
    title(['Fourier transform X_',num2str(i/2),' Magnitude'])
    subplot(3,2,i)
    plot(omega,angle(W))
    title(['Fourier transform X_',num2str(i/2),' Phase'])
end

x1 = [1,1,1,1]';
x2 = [1/4,1/2,1/4]';
x3 = [1/4,-1/2,1/4]';

global omega;
omega = [-pi:0.01:pi]'; % Limit

% Fourier transform
fig1 = figure('name','Fourier transform');
clf;

my_fourier(x1,2)
my_fourier(x2,4)
my_fourier(x3,6)

syms z
% Z-transform definition for x1, ztrans didn't work
n = 0:length(x1)-1;
X1 = x1'.*z.^-n
% Z-transform definition for x2, ztrans didn't work
n = 0:length(x2)-1;
X2 = x2'.*z.^-n
% Z-transform definition for x3, ztrans didn't work
n = 0:length(x3)-1;
X3 = x3'.*z.^-n

% Thus
W1 = 1 + exp(-j*omega) + exp(-2*j*omega) + exp(-3*j*omega);
W2 = 1/4 + 1/2*exp(-j*omega) + 1/4*exp(-2*j*omega);
W3 = 1/4 - 1/2*exp(-j*omega) + 1/4*exp(-2*j*omega);

% Using Z-transform
fig2 = figure('name','Using Z-transform');
clf;

my_ztrans(W1,2)
my_ztrans(W2,4)
my_ztrans(W3,6)

