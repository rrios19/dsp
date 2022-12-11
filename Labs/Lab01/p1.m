% Tecnologico de Costa Rica
% EL5805 Digital Signal Processing
% Author: Ronald Rios Pineda
% Octave 7.2.0 on macOS Ventura 13.0.1
% Lab 01
% Description: Plot discrete sequence data 

fig = figure('name','Discrete-time signals');
clf;

n = 0:1:75;
f = [0.01 0.02 0.05 0.1];

for i=1:4
    subplot(2,2,i)
    y = sin(3*pi*f(i)*n);
    stem(n,y)
    title(['y(n) = sin(3pi(',num2str(f(i)),')n)'])
    xlim([0 length(n)-1])
end

