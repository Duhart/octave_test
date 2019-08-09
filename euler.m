function [t,u] = euler(f,u0,timespan,h,A)

% This function implements the Euler method to solve the ODE
% udot=f(u,t) with u(0)=u0 in R^n (row vector)
% Over the timespan given as a column vector in R^2 indicating [t0 tf]
% by using a timestep of h.

% Output is a vector t of all the times at which the function u(t) was
% evaluated. And a matrix u in R^(m X n) where m is the length of vector t
% and the column k corresponds to the function u_k(t).

t(1)=timespan(1);
u(1,:)=u0;

m=1;
while(t(m)<timespan(2))
    m=m+1;
    t(m)=t(m-1)+h;
    u(m,:)=u(m-1,:)+h*feval(f,u(m-1,:)',A)';
end
t=t';

end

