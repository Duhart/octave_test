% This is an auxiliary script for Q1c of Assignment 3

A=[10 -10; 1 -1];
u0=[2 1];
timespan=[0 5];
eps=0.3;

clf('reset');

% Here we compare Euler's method for different timesteps.
% On the upper left, the plot of time vs x(t) is displayed,
% on the upper right, the plot of time vs y(t) is displayed,
% on the bottom left, the plot of x(t) vs y(t) is displayed,
% on the bottom right, the plot of h vs the trucation error at t=5 is
% displayed.

for(k=4:10)
    h=2^-k;
    c=1+(1-eps)*(k-10)/6;
    [te,ue]=euler('f',u0,timespan,h,A);
    n=length(te);
    taue(k-3,1:2)=h^2/2*(feval('Df',ue(n,:),A)*feval('f',ue(n,:),A))';
    taue(k-3,3)=norm(taue(k-3,1:2));
    subplot(2,2,1), hold on, plot(te,ue(:,1),'Color',[c,0,0]);
    subplot(2,2,2), hold on, plot(te,ue(:,2),'Color',[0,c,0]);
    subplot(2,2,3), hold on, plot(ue(:,1),ue(:,2),'Color',[0,0,c]);
       
end

ppe=polyfit(2.^-(4:10),taue(:,3)',2);
pe=polyval(ppe,linspace(0,2^-4,100));
subplot(2,2,4), hold on, plot(2.^-(4:10),taue(:,3),'black*',linspace(0,2^-4,100),pe,'black-');

aux=input('press enter key to continue');
clf('reset');

% Now we compare the second method for different timesteps.
% On the upper left, the plot of time vs x(t) is displayed.
% on the upper right, the plot of time vs y(t) is displayed.
% on the bottom left, the plot of x(t) vs y(t) is displayed.
% on the bottom right, the plot of h vs the trucation error at t=5 is
% displayed.

for(k=4:10)
    h=2^-k;
    c=1+(1-eps)*(k-10)/6;
    [t2,u2]=met2('f',u0,timespan,h,A);
    n=length(t2);
    interior=h/2*feval('f',u2(n,:)',A);
    tau2(k-3,1:2)=-h^3/8*feval('D2f',interior,A);
    tau2(k-3,3)=norm(tau2(k-3,1:2));
    subplot(2,2,1), hold on, plot(t2,u2(:,1),'Color',[c,0,0]);
    subplot(2,2,2), hold on, plot(t2,u2(:,2),'Color',[0,c,0]);
    subplot(2,2,3), hold on, plot(u2(:,1),u2(:,2),'Color',[0,0,c]);
    
end
pp2=polyfit(2.^-(4:10),tau2(:,3)',3);
p2=polyval(pp2,linspace(0,2^-4,100));
subplot(2,2,4), hold on, plot(2.^-(4:10),tau2(:,3),'black*',linspace(0,2^-4,100),p2,'black-');

aux=input('press enter key to continue');
clf('reset');

% Finally, on the upper left we displayed t vs x(t) red for Euler's and
% blue for the second method.
% On the upper right we displayed t vs y(t) red for Euler's and
% blue for the second method.
% On the bottom left we displayed x(t) vs y(t) red for Euler's and
% blue for the second method.
% All this plots are done with the smallest timestep above of 2^-10.

subplot(2,2,1), hold on, plot(te,ue(:,1),'r-',t2,u2(:,1),'b-');
subplot(2,2,2), hold on, plot(te,ue(:,2),'r-',t2,u2(:,2),'b-');
subplot(2,2,3), hold on, plot(ue(:,1),ue(:,2),'r-',u2(:,1),u2(:,2),'b-');

subplot(2,2,4), hold on, plot(2.^-(4:10),taue(:,3)','r*',linspace(0,2^-4,100),pe,'r-',2.^-(4:10),tau2(:,3)','b*',linspace(0,2^-4,100),p2,'b-');

