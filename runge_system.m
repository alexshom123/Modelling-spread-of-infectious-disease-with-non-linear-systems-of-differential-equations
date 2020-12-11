

% [t0,tN] is the domain over which a solution is sought; 
% y(t0)=y0 is the initial condition; h is the step size. The RHS must be
% defined in the function f.m file.
t0=0; 
tN=500;
y0(1,1)=0.8;
y0(2,1)=0.1;
j(1)=0.1;
h=1;

% Determine the number of steps required.
N_steps=(tN-t0)/h;

% Return an error message if the step size has is not suitable.
if rem(N_steps,1)~=0
    display('The length of the domain (tN-t0) must be an integer multiple of the step size h')
    return
end

% Initialise y and t vectors.
y=zeros(2,N_steps+1);
t=zeros(N_steps+1,1);

% Perform Runge Kutta method on system.
t(1)=t0;
y(:,1)=y0;
for i=1:N_steps
    t(i+1)=t(i)+h;
    k1=f_system(t(i),y(:,i));
    k2=f_system(t(i)+h/2,y(:,i)+h/2*k1)
    k3=f_system(t(i)+h/2,y(:,i)+h/2*k2)
    k4=f_system(t(i)+h,y(:,i)+h*k3)
    y(:,i+1)=y(:,i)+h/6*(k1+2*k2+2*k3+k4)
    j(i+1) = 1 - y(1,i+1) - y(2,i+1)
    
end

% Plot the solution
plot(t,y(1,:),'b--',t,y(2,:),'r--',t,j,'g--')
xlabel('t')
ylabel('i(t)/s(t)/r(t)')


