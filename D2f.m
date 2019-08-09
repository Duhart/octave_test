function deriv2 = D2f(x,A)
% The second derivative of the function f (the Lotka-Volterra system).
% The x input should be given as a column vector. 
% The output is a column vector in R^2 which first entry is x'*D^2 f_1*x
% and the second entry is x'*D^2 f_2*x. This is what is needed to do the
% Taylor expansion of f.

left=[x' zeros(1,2); zeros(1,2) x'];
centre=[0 A(1,2); A(1,2) 0; 0 A(2,1); A(2,1) 0];
deriv2=left*centre*x;

end

