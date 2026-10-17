clear all;
close all;
clc;

R=30;
H=22;
g=10;
Dia=-30:30;
n_H=1.3;                                            %%Atak vary korae amra amader cell edge ar sathe 3db/10db point k adjust korte parbo
                                                    %%Akhane n=1.7 a -3db adjusted
a_H=1/n_H;
effi=0.8;
theta_3db=2*acosd(0.5^a_H);
D_max=(32*log10(2))/(2*theta_3db^2);
theta_sub = atand((R+g)/H)+atand((R-g)/H);
%% For boresight at the centre

Dia_A=-R+g:R+g;
y=atand(Dia_A/H);
theta_centre=atand(g/H);
deviation1=theta_centre-y;                               % Angles away from the boresight
D_centre=D_max*effi*cosd(deviation1).^n_H;          % Gain at the angles away
D_centre_db=50+10*log10(D_centre);  
figure (1);
plot(Dia,D_centre_db,'g');
hold on;

%% For boresight at the theta_Sub/2

%x= 0:theta_sub/60:theta_sub;
left=atand((R-g)/H);
theta_0= (theta_sub/2)-left;
deviation2=theta_0-y;                           % Angles away from the boresight
D=D_max*effi*cosd(deviation2).^n_H;             % Gain at the angles away
D_db=50+10*log10(D);                               
%figure (2);
plot(Dia,D_db,'r');
hold on;

%% For boresight at the SPP

theta_spp= atand((R-g)/H);
deviation3=y;                               % Angles away from the boresight
D_spp=D_max*effi*cosd(deviation3).^n_H;                 % Gain at the angles away
D_spp_db=50+10*log10(D_spp);                               
% figure (3);
plot(Dia,D_spp_db,'b');
hold on;
title('Radiation pattern at different boresight');
hold on;
grid on;