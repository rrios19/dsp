% Tecnologico de Costa Rica
% EL5805 Digital Signal Processing
% Author: Ronald Rios Pineda
% Octave 7.2.0 on macOS Ventura 13.0.1
% Lab 03
% Description: Alias frequency

n = 0:1:25;
f = 0.2;
y = sin(2*pi*f*n);

fig = figure('name','Alias frequency');
clf;

for i=0:1
    subplot(2,1,i+1)
    y = cos(2*pi*(f+i)*n);
    stem(n,y)
    title(["y(n)=cos(3*pi*",num2str(f+i),'*n)'])
end

