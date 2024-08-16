clear all;
close all;
clc;

xi1 = [70.4, -3]';
xi2 = [20.1, 71.6]';

xf1 = [69.8, -2.7]';
xf2 = [21.7, 71.8]';

ri = sqrt(sum((xi2-xi1).^2));
rf = sqrt(sum((xf2-xf1).^2));

g = rf/ri;

xlf1 = xf1 / g;
xlf2 = xf2 / g;

##thetai = 135  ;
##R = [cosd(thetai), -sind(thetai); sind(thetai), cosd(thetai)];
##T = [1,3]';
##
##xf1 = R*xi1 + T;
##xf2 = R*xi2 + T;

Dxf = xlf2 - xlf1;
Dxi = xi2 - xi1;

M = [Dxi(1), -Dxi(2); Dxi(2), Dxi(1)];
c = M\Dxf;
theta = atan2d(c(2), c(1));

R = [cosd(theta), -sind(theta); sind(theta), cosd(theta)];
theta = -theta;
T = xlf1 - R*xi1;

A = [g*R, g*T; [0,0,1]];

function y = transform(A, x)
  y = (A*[x;1])(1:end-1);
end

disp(["set scale ", num2str(g)]);
disp(["set rot ", num2str(theta)]);
disp(["set trans_x ", num2str(T(1))]);
disp(["set trans_y ", num2str(T(2))]);
