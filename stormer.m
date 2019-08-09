function [t,u] =stormer(f,init,timespan,h)
% This function will solve the ODE udot=f(u) by the Stormer-Verlet method.
% Once more, init should be a row vector input.

t(1)=timespan(1);
u(1,:)=init;

m=1;
while(t(m)<timespan(2))
    m=m+1;
    t(m)=t(m-1)+h;
    ustar=u(m-1,1)+h/2*u(m-1,2);
    u(m,2)=u(m-1,2)-h*sin(ustar);
    u(m,1)=ustar+h/2*u(m,2);
    
end
t=t';

end

