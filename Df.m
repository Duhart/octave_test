function deriv = Df(x,A)
% This function is the derivative of the function f that defines the
% Lotka-Volterra system.

deriv=[A(1,1)+A(1,2)*x(2) A(1,2)*x(1); A(2,1)*x(1)*x(2) A(2,1)*x(1)-A(2,2)];

end

