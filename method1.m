% This is the method1 script for Q1a of Assignment 3

% The statements alpha = beta = 10 and gamma = delta = 1
% are implemented as follows:

A=[10 -10; 1 -1];
u0=[2 1];
timespan=[0 5];

h=input('Input your timestep: ');

[te,ue]=euler('f',u0,timespan,h,A);

subplot(1,2,1), plot(te,ue(:,1),'r-',te,ue(:,2),'g-');
subplot(1,2,2), plot(ue(:,1),ue(:,2));
