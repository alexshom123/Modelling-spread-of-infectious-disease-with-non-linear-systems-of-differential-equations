function output=f_system(t,y)

% The RHS function to be used in Runge_System.m

output=[-0.05*y(1)*y(2)+0.01-0.01*y(1)-0.01*y(2);0.05*y(1)*y(2)-0.02*y(2)];