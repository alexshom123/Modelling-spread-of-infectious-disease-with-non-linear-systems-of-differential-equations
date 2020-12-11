function [v1,v2,v3,v4]=insert_arrow(x,y,angle,arrow_size)

% This function outputs the coordinates to plot an arrow at the midpoint of
% the trajectory defined by x and y.


% x          = a vector of x-coordinates of the trajectory.
% y          = a vector of y-coordinates of the trajectory (must be the 
%              same length as x).
% angle      = the angle between the trajectory and each arm of the arrow 
%              head (in radians).
% arrow_size = the length of each arm of the arrow head.

n=size(x,2);

% Calculate the length of the trajectory
len=0;
for i=1:n-1
    len=len+(x(i+1)-x(i))^2+(y(i+1)-y(i))^2;
end

cum_len=0;
i=0;
while cum_len<len/2
    i=i+1;
    cum_len=cum_len+(x(i+1)-x(i))^2+(y(i+1)-y(i))^2;
end

position2_x=x(i+1);
position2_y=y(i+1);
position1_x=x(i);
position1_y=y(i);

dx=position2_x-position1_x;
dy=position2_y-position1_y;

if dx~=0
    theta1=atan(dy/dx);
end
if dx>0
    if dy~=0
        phi1=-sign(theta1)*(pi-abs(theta1)-angle);
        phi2=-sign(theta1)*(pi-abs(theta1)+angle);
    else
        phi1=pi-angle;
        phi2=pi+angle;
    end
elseif dx<0
    phi1=theta1-angle;
    phi2=theta1+angle;
else
    if dy>0
        phi1=-pi/2-angle;
        phi2=-pi/2+angle;
    else
        phi1=pi/2-angle;
        phi2=pi/2+angle;
    end
end

v1=[position2_x position2_x+arrow_size*cos(phi1)];
v2=[position2_y position2_y+arrow_size*sin(phi1)];
v3=[position2_x position2_x+arrow_size*cos(phi2)];
v4=[position2_y position2_y+arrow_size*sin(phi2)];