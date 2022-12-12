% Tecnologico de Costa Rica
% EL5805 Digital Signal Processing
% Author: Ronald Rios Pineda
% Octave 7.2.0 on macOS Ventura 13.0.1
% Lab 03
% Description: Get and plot the period of a signal

% Dependencies for "symbolic" using "pkg" from the Octave prompt
% pkg install -forge symbolic
pkg load symbolic

n = 0:1:25;
w = [pi pi/2 2*pi/3 4/3]; % Frequencies
f = 2*pi; 
t = zeros(1,8); % Periods
xline = @(xval, varargin) line([xval xval], ylim, varargin{:});

% Signals:
x(1,:) = cos(w(1)*n);           % N = w(1)/f = 1/2      => N = 2
x(2,:) = cos(w(2)*n);           % N = w(2)/f = 1/4      => N = 4
x(3,:) = cos(w(3)*n);           % N = w(3)/f = 1/3      => N = 3    
x(4,:) = cos(w(4)*n);           % N = w(4)/f = 2/(3pi)  => N = no period
x(5,:) = x(1,:) + x(2,:);           % N = lcm(2,4)      => N = 4
x(6,:) = x(1,:) + x(3,:);           % N = lcm(2,3)      => N = 6
x(7,:) = x(1,:) + x(2,:) + x(3,:);  % N = lcm(2,3,4)    => N = 12 
x(8,:) = x(1,:) + x(4,:);           % N = lcm(2, inf)   => N = no period

% Periods
for i=1:4
    [nu,de] = numden(sym(w(i)/f,'r'));
    t(i) = double(de);
end
t(5) = lcm(t(1),t(2));
t(6) = lcm(t(1),t(3));
t(7) = lcm(t(1),t(2),t(3));
t(8) = lcm(t(1),t(4));

% Plot
fig = figure('name','Get period');
clf;

for i=1:8
    subplot(2,4,i)
    stem(n,x(i,:))
    if t(i) > length(n)
        t(i) = inf;
    end
    title(['x_',num2str(i),'(n), N = ',num2str(double(t(i)))])
    ylim([-3 3])
    xline(t(i))
end

