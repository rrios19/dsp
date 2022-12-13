% Tecnologico de Costa Rica
% EL5805 Digital Signal Processing
% Author: Ronald Rios Pineda
% Octave 7.2.0 on macOS Ventura 13.0.1
% Lab 04
% Description: Discrete-time linear systems y(n) = nx(n)

addpath(pwd)

function [n,y] = system1(n,x)
    y = [x,0].*[0,x]; % y(n) = x(n)*x(n-1)
    n = [n,n(end)+1];
end

function [n,y] = system2(n,x)
    y = [x,0] - [0,x]; % y(n) = x(n) - x(n-1)
    n = [n,n(end)+1];
end

function my_plot(n,x,i,s)
    t = ['2x_1(n)'; '0.5x_2(n)'; '2x_1(n) + 0.5x_2(n)';
        'T[ 2x_1(n) + 0.5x_2(n) ]'; 'T[ x_1(n) ]';'T[ x_2(n) ]';
        'T[ x_1(n) ] + T[ x_2(n) ]'; '2T[ x_1(n) ] + 0.5T[ x_2(n) ]'];
    subplot(2,4,i)
    stem(n,x)
    title(t(i,:))
    xlim([0 s])   
end

% Input
x = [[1 2 3 2 1];[1 2 1 2 1]];
n = [0:5];

y = zeros(8,6);
y(1,:) = 2*[x(1,:),0];
y(2,:) = 1/2*[x(2,:),0];
y(3,:) = y(1,:) + y(2,:);
[~,y(4,:)] = system1(n(1:end-1),y(3,1:end-1));
[~,y(5,:)] = system1(n(1:end-1),x(1,:));
[~,y(6,:)] = system1(n(1:end-1),x(2,:));
y(7,:) = y(5,:) + y(6,:); 
y(8,:) = 2*y(5,:) + 1/2*y(6,:); 

fig1 = figure('name','Linear analysis with y(n)=x(n)*x(n-1)');
clf;
for i=1:8
    my_plot(n,y(i,:),i,4)   
end

y = zeros(6,6);
y(1,:) = 2*[x(1,:),0];
y(2,:) = 1/2*[x(2,:),0];
y(3,:) = y(1,:) + y(2,:);
[~,y(4,:)] = system2(n(1:end-1),y(3,1:end-1));
[~,y(5,:)] = system2(n(1:end-1),x(1,:));
[~,y(6,:)] = system2(n(1:end-1),x(2,:));
y(7,:) = y(5,:) + y(6,:); 
y(8,:) = 2*y(5,:) + 1/2*y(6,:); 

fig2 = figure('name','Linear analysis with y(n)=x(n)-x(n-1)');
clf;
for i=1:8
    my_plot(n,y(i,:),i,5)   
    %subplot(2,4,i)
    %stem(n,y(i,:))
    %title(t(i,:))
    %xlim([0 5])   
end

