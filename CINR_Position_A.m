clc;
close all;
clear all;
R=30;
H=20;
ele=60;                                             % Atak vary korae kicu plot neya jete pare
%g=R-H*cotd(ele);
g=30;
theta_sub = atand((R+g)/H)+ atand((R-g)/H);
theta_0= (theta_sub/2)-(90-ele);
%x0= sqrt(x.^2+y.^2).*cosd(atand(y/x)-theta_0);
%y0= sqrt(x.^2+y.^2).*sind(atand(y/x)-theta_0);
%x_a= (x0-H*tand(theta_0)).*cosd(theta_0);
%theta_a=atand(realsqrt(x_a.^2)/(H*cosd(theta_0)+x0.*sind(theta_0)));
%theta=-90:1:90;
n_H=1.7;                                            %%Atak vary korae amra amader cell edge ar sathe 3db/10db point k adjust korte parbo
                                                    %%Akhane n=1.7 a -3db adjusted
a_H=1/n_H;
effi=0.8;
theta_3db=2*acosd(0.5^a_H);
D_max=(32*log10(2))/(2*theta_3db^2);
x1=theta_sub/2-90;                                  % Ata use kora hoica -90 to +90 range a neyar jonno
x2=theta_sub/2+90;                                  % Ata use kora hoica -90 to +90 range a neyar jonno
x= x1:x2;
%x= 0:theta_sub;
deviation=theta_sub/2-x;                            % Angles away from the boresight
D=D_max*effi*cosd(deviation).^n_H;                         % Gain at the angles away
D_db=50+10*log10(D);                                   % 
figure (1);
plot(deviation,D_db);
title('Radiation pattern of HAP antenna');
hold on;
grid on;

%%  User antenna ratiation pattern

theta=-90:1:90;
n_U=58;
D_bore=18;
D_U=effi*cosd(theta).^n_U;
D_U_db= D_bore+10*log10(D_U);
figure (2);
plot(theta,D_U_db,'r');
title('Radiation pattern of User antenna');
hold on;
grid on;

%% Carrier to Noise ration

x0=-30:30;
y0=-30:30;
f=3.5;
c=.3;
P_H=40;                                             % Tx power
NF=-100.5;                                          % Noise power
CINR=zeros(size(x0));
m1=size(x0);
n1=size(y0);
for m=1:m1(2)
    for n=1:n1(2)
        x1=x0(m)+floor(g);
        y1=y0(n);
        y=realsqrt(x1^2+y1^2);                                
        theta_user=atand(y/H);                              
        deviation_user=theta_sub/2-theta_user;              
        A_H=D_max*effi*cosd(deviation_user).^n_H;
        A_H_db=60+10*log(A_H);                                 % HAP antenna gain
        A_U=effi*cosd(theta_user).^n_U;
        A_U_db=60+D_bore+10*log10(A_U);                        % User antenna gain
        lamda=c/f;
        d=realsqrt(H^2+x1^2+y1^2);                          % Distance from the user
        FSL= (4*pi*d*1000/lamda)^2;
        FSL_db=10*log10(FSL);                             % Free space loss
        C=P_H+A_H_db+A_U_db-FSL_db;                               % Carrier
        CINR(m,n)=C-NF;
    end
end
figure (3);
contour(x0,y0,CINR);