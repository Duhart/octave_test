% This is the method2 script for Q1b of Assignment 3

% The statements alpha = beta = 10 and gamma = delta = 1
% are implemented as follows:

A=[10 -10; 1 -1];
u0=[2 1];
timespan=[0 5];

h=input('Input your timestep: ');

[t2,u2]=met2('f',u0,timespan,h,A);

subplot(1,2,1), plot(t2,u2(:,1),'r-',t2,u2(:,2),'g-');
subplot(1,2,2), plot(u2(:,1),u2(:,2));
