
% NOTE: need system.m = m-file outputing the RHS function f(t,x) of the system of
%            equations. and need insert_arrow.m for plotting 
% x1min     = lower bound for x1 in the phase portrait.
% x1max     = upper bound for x1 in the phase portrait.
% x2min     = lower bound for x2 in the phase portrait.
% x2max     = upper bound for x2 in the phase portrait.
% IC        = A n x 2 matrix of initial conditions whose solution 
%             trajectories will construct the phase portrait.
% tmax      = A vector of length n of upper bounds for the time domain over 
%             which each trajectories defined in IC will be calculated.
%

clear

x1min=0;
x1max=1;
x2min=-0;
x2max=1;

IC(2,:)=[1 0.1];
IC(3,:)=[0 0];
IC(5,:)=[0.4 0.001];
IC(6,:)=[0.001 0.05];
IC(7,:)=[0.001 0.1];
IC(8,:)=[0.001 0.3];
IC(9,:)=[0.001 0.17];
IC(10,:)=[0.001 0.17];
IC(11,:)=[0.001 0.5];
IC(12,:)=[0.001 0.999];
IC(14,:)=[0.5 0.999];
IC(15,:)=[0.999 0.999];
IC(16,:)=[0.999 0.3];
IC(17,:)=[0.999 0.2];
IC(18,:)=[0.999 0.4];
IC(19,:)=[0.999 0.5];
IC(20,:)=[0.999 0.6];
IC(21,:)=[0.999 0.7];
IC(22,:)=[0.999 0.9];
IC(23,:)=[0 0.025];
IC(24,:)=[0.999 0.025];



n=size(IC,1);
tmax=500*ones(n,1);

figure
axis square
grid on
hold on
for i=1:n
    [t,x]=ode45(@system1,[0 tmax(i)],IC(i,:));
    plot(x(:,1),x(:,2),'b','Linewidth',2)
    if tmax(i)<0
        m=size(x,1);
        temp=zeros(size(x));
        for j=1:m
            temp(j,:)=x(m+1-j,:);
        end
        x=temp;
    end
    [v1,v2,v3,v4]=insert_arrow(x(:,1)',x(:,2)',pi/6,0.02*(x1max-x1min));
    plot(v1,v2,'b','Linewidth',2)
    plot(v3,v4,'b','Linewidth',2)
end
xlim([x1min x1max])
ylim([x2min x2max])
xlabel('x_1')
ylabel('x_2')

