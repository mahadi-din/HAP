clc;
close all;
%x=-30:30;
%y=-30:30;
R=30;
H=22;
ele=20:90;
g=R-H*cotd(ele);
theta_sub = atand((R+g)/H)+ atand((R-g)/H);
theta_0= (theta_sub/2)-(90-ele);
%x0= sqrt(x.^2+y.^2).*cosd(atand(y/x)-theta_0);
%y0= sqrt(x.^2+y.^2).*sind(atand(y/x)-theta_0);
%x_a= (x0-H*tand(theta_0)).*cosd(theta_0);
%theta_a=atand(realsqrt(x_a.^2)/(H*cosd(theta_0)+x0.*sind(theta_0)));
%theta=-90:1:90;
% n=5;
% a=1/n;
% theta_3db=2*acosd(0.5^a);
% D1=(32*log10(2))/(2*theta_3db^2);
% y=0:theta_sub;
% deviation=theta_sub/2-y;
% D=D1*cosd(deviation).^n;
% D_db=10*log10(D);   % Ata matrix hoar kotha cilo
% hold on;
% figure (4);
% plot(deviation,D_db); % Akhane problem ace....

%% Relation between the elevation angle and the maximum pointing angle.
%figure (1);
%plot(ele,theta_0);
%title('elevation angle vs the maximum pointing angle');
%% Relation between the elevation angle and the subtended angle.
figure (2);
plot(ele, theta_sub,'b');
title('elevation angle vs subtended angle');
hold on;
grid on;
%% Relation between the elevation angle and the spacing radious

figure (3);
plot(ele,g,'b');
title('elevation angle vs spacing radious');
hold on;
grid on;