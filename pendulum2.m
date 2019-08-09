% This is a script for solving Q2c of assignment 3
% basically compares the three methods for Q2.

T=100;
alfa=0.25;
h=0.1;

timespan=[0 T];
init=[alfa; 0];

[tf,uf]=feuler('fpend',init',timespan,h);
[tsy,usy]=sympleuler('fpend',init',timespan,h);
[tst,ust]=stormer('fpend',init',timespan,h);

Ef=1/2*uf(:,2).^2-cos(uf(:,1));
Esy=1/2*usy(:,2).^2-cos(usy(:,1));
Est=1/2*ust(:,2).^2-cos(ust(:,1));

subplot(2,2,1), plot(tf,uf(:,1),'g-');
subplot(2,2,2), plot(tf,Ef,'g-');
subplot(2,2,3), plot(tsy,usy(:,1),'r-',tst,ust(:,1),'b-');
subplot(2,2,4), plot(tsy,Esy,'r-',tst,Est,'b-');