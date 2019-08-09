% This is the pendulum script for solving Q2b of assignment 3

T=0;
while(T<=0)
    T=input('Give a value of T for the timespan: ');
end

alfa=pi+0.1;
while(abs(alfa)>pi)
    alfa=input('Give a value for the inital angle alpha less than pi: ');
end

h=0;
while(h<=0)
    h=input('Give the timestep to solve the ODE: ');
end

met=0;
while(met<1 | met>3)
    met=input('Press 1 to solve by Forward Euler \nPress 2 to solve by Symplectic Euler \nPress 3 to solve by Stormer-Verlet: ');
end

timespan=[0 T];
init=[alfa; 0];

if(met==1)
    [t,u]=feuler('fpend',init',timespan,h);
elseif(met==2)
    [t,u]=sympleuler('fpend',init',timespan,h);
else
    [t,u]=stormer('fpend',init',timespan,h);
end

E=1/2*u(:,2).^2-cos(u(:,1));

subplot(1,2,1), plot(t,u(:,1),'b-');
subplot(1,2,2), plot(t,E,'b-');