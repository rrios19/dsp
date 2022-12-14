% Tecnologico de Costa Rica
% EL5805 Digital Signal Processing
% Author: Ronald Rios Pineda
% Octave 7.2.0 on macOS Ventura 13.0.1
% Lab 01
% Description: Plot discrete sequence data 

fig = figure('name','Discrete-time signals');
clf;

n = 0:1:25;
x = zeros(5,length(n));

x(1,:) = cos(2*pi*n/4);
x(2,:) = cos(2*pi*n/6);
x(3,:) = cos(2*pi*n/8);
x(4,:) = x(1,:) + x(2,:);
x(5,:) = x(1,:) + x(3,:);

for i=1:5
    subplot(5,1,i)
    stem(n,x(i,:))
    title(['x_',num2str(i),'(n)'])
    xlim([0 length(n)-1])
end

