function [t,u] = feuler(f,init,timespan,h)
% This function implements the forward Euler method to solve the ODE
% udot=f(u) with u(0)=init in R^n (row vector)
% Over the timespan given as a row vector in R^2 indicating [t0 tf]
% by using a timestep of h.

% Output is a vector t of all the times at which the function u(t) was
% evaluated. And a matrix u in R^(m X n) where m is the length of vector t
% and the column k corresponds to the function u_k(t).

t(1)=timespan(1);
u(1,:)=init;

m=1;
while(t(m)<timespan(2))
    m=m+1;
    t(m)=t(m-1)+h;
    u(m,:)=u(m-1,:)+h*feval(f,u(m-1,:)')';
end
t=t';

end