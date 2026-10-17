% Yogesh Mhatre || IGOY.IN
clc;
clear all;
close all;
 
%Generating a hexagon with centre (0,0)and radius 8 km
 
t=linspace(0,2*pi,7);
ahx=0+8*cos(t);
bhx=0+8*sin(t);
plot(ahx,bhx);
plot(0,0,'ro');
grid on
hold on
 
% To generate 6 adjacent hexagon

a1=0+8*cos(t);                        % Upper hex 1
b1=27.71+8*sin(t);
plot(a1,b1);
plot(0,27.71,'ko');

a1=-12+8*cos(t);                      % Upper left hex 2
b1=20.78+8*sin(t);
plot(a1,b1);
plot(-12,20.78,'ko');

a1=12+8*cos(t);                       % Upper right hex 3
b1=20.78+8*sin(t);
plot(a1,b1);
plot(12,20.78,'ko');

a1=-24+8*cos(t);                      % Upper left left hex 4
b1=13.86+8*sin(t);
plot(a1,b1);
plot(-24,13.86,'ko');

a1=0+8*cos(t);                         % Upper middle hex 5
b1=13.86+8*sin(t);
plot(a1,b1);
plot(0,13.86,'ko');

a1=24+8*cos(t);                        % Upper right right hex 6
b1=13.86+8*sin(t);
plot(a1,b1);
plot(24,13.86,'ko');

a5=-12+8*cos(t);                       % Upper Left hex 7
b5=6.93+8*sin(t);
plot(a5,b5);
plot(-12,6.93,'ko');

a4=12+8*cos(t);                        % Upper right hex 8
b4=6.93+8*sin(t);
plot(a4,b4);
plot(12,6.93,'ko');

a1=-24+8*cos(t);                       % Middle left hex 9
b1=0+8*sin(t);
plot(a1,b1);
plot(-24,0,'ko');

                                       % Middle hex 10 is at the beginning

a1=24+8*cos(t);                        % Middle right hex 11
b1=0+8*sin(t);
plot(a1,b1);
plot(24,0,'ko');

a6=-12+8*cos(t);                       % Lower left hex 12
b6=-6.93+8*sin(t);
plot(a6,b6);
plot(-12,-6.93,'ko');

a3=12+8*cos(t);                        % Lower right hex 13
b3=-6.93+8*sin(t);
plot(a3,b3);
plot(12,-6.93,'ko');

a1=-24+8*cos(t);                       % Lower left left hex 14
b1=-13.86+8*sin(t);
plot(a1,b1);
plot(-24,-13.86,'ko');
 
a2=0+8*cos(t);                         % Lower middle hex 15
b2=-13.86+8*sin(t);
plot(a2,b2);
plot(0,-13.86,'ko');

a1=24+8*cos(t);                        % Lower right right hex 16
b1=-13.86+8*sin(t);
plot(a1,b1);
plot(24,-13.86,'ko');

a1=-12+8*cos(t);                       % lower left hex 17
b1=-20.78+8*sin(t);
plot(a1,b1);
plot(-12,-20.78,'ko');

a1=12+8*cos(t);                        % Lower right hex 18
b1=-20.78+8*sin(t);
plot(a1,b1);
plot(12,-20.78,'ko');

a1=0+8*cos(t);                         % Lower hex 19
b1=-27.71+8*sin(t);
plot(a1,b1);
plot(0,-27.71,'ko');

% for i=1:250
%      xa=-0.75+1.5*rand(1,1);
%      ya=-1.2+2.4*rand(1,1);
%      xra(i)=xa;
%      yra(i)=ya;
%  
%      xb=-1+2*rand(1,1);
%      yb=-0.65+1.3*rand(1,1);
%      xrb(i)=xb;
%      yrb(i)=yb;
% 
%      figure(1)
%      plot(xra(i),yra(i),'k.');
%      hold on
%      plot(xrb(i),yrb(i),'k.');
% end
hold on;
Radius = 30;

[x,y,z] = cylinder(Radius,200);
%figure (2);
plot(x(1,:),y(1,:))
axis equal