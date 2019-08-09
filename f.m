function fofx = f(x,A)
% This is the function f(x) that defines the Lotka-Volterra equations as
% xdot=alpha*x(t)-beta*x(t)*y(t)
% ydot=delta*x(t)*y(t)-gamma*y(t)
% Hence the matrix A will be interpreted as A=[alpha -beta; delta -gamma]
% The input column vector x is actually x=[x(t);y(t)].

z=[x(1); prod(x); x(2)];
A2=[A(1,:) 0; 0 A(2,:)];
fofx=A2*z;

end

