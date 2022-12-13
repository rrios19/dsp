% Tecnologico de Costa Rica
% EL5805 Digital Signal Processing
% Author: Ronald Rios Pineda
% Octave 7.2.0 on macOS Ventura 13.0.1
% Lab 04
% Description: Discrete-time invariant systems y(n) = nx(n)

addpath(pwd)

function [n,y] = system1(n,x)
    y = n.*x; % y(n) = n*x(n)
end

function [n,y] = system2(n,x)
    y = [x,0] - [0,x]; % y(n) = x(n) - x(n-1)
    n = [n,n(end)+1];
end

function [n,y] = delay(n,x,k)
    n = n + k; % y(n) = x(n-k)
    y = x;  
end

function my_plot(n,y,i,s)
    t = ['x(n)'; 'y(n)'; 'y(n-2)'; 'x(n)'; 'y(n-2)'; 'y(n)'];
    subplot(2,3,i)
    stem(n,y)
    title(t(i,:))
    xlim([0 s])
end

% Input x(n) = u(n) - u(n-5)
% u(n):     1   1   1   1   1   1   1   ...
% u(n-5):   0   0   0   0   0   1   1   ...
% x(n):     1   1   1   1   1   0   0   ...
x = ones(1,5); % u(n) - u(n-5)
n = 0:4;       % n = [0,1,2,3,4]
k = 2;         % Delay

ofst = n(end)+1:n(end)+k;
m = [n,ofst; zeros(2,length(n)+k); n,ofst; zeros(2,length(n)+k)];
y = [x,zeros(1,k); zeros(2,length(x)+k); x,zeros(1,k); zeros(2,length(n)+k)];

[m(2,:),y(2,:)] = system1(m(1,:),y(1,:)); % Get into the system
[m(3,:),y(3,:)] = delay(m(2,:),y(2,:),k); % Get into the delay

[m(5,:),y(5,:)] = delay(m(4,:),y(4,:),k); % Get into the delay
[m(6,:),y(6,:)] = system1(m(5,:),y(5,:)); % Get into the system

fig1 = figure('name','Invariant analysis with y(n)=nx(n)');
clf;
for i=1:6
    my_plot(m(i,:),y(i,:),i,length(n)-1+k)

end

k = k + 1;
ofst = n(end)+1:n(end)+k;
m = [n,ofst; zeros(2,length(n)+k); n,ofst; zeros(2,length(n)+k)];
y = [x,zeros(1,k); zeros(2,length(x)+k); x,zeros(1,k); zeros(2,length(x)+k)];

[m(2,:),y(2,:)] = system2(m(1,1:end-1),y(1,1:end-1)); % Get into the system
[m(3,:),y(3,:)] = delay(m(2,:),y(2,:),k-1);           % Get into the delay

[m(5,:),y(5,:)] = delay(m(4,:),y(4,:),k-1);           % Get into the delay
[m(6,:),y(6,:)] = system2(m(5,1:end-1),y(5,1:end-1)); % Get into the system

fig2 = figure('name','Invariant analysis with y(n)=x(n)-x(n-1)');
clf;
for i=1:6
    my_plot(m(i,:),y(i,:),i,length(n)-1+k)
end

