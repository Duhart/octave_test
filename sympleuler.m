function [t,u] = sympleuler(f,init,timespan,h)
% This method will solve the ODE given by udot=f(u) by the Symplectic Euler
% method. THe input vector init should be a row vector.

t(1)=timespan(1);
u(1,:)=init;

m=1;
while(t(m)<timespan(2))
    m=m+1;
    t(m)=t(m-1)+h;
    u(m,1)=u(m-1,1)+h*u(m-1,2);
    u(m,2)=u(m-1,2)-h*sin(u(m,1));
end
t=t';


end

