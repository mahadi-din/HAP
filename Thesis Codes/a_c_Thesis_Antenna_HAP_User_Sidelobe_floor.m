clc;
close all;
clear all;
theta=-90:1:90;
effi=0.8;
n_H=5;
a=1/n_H;
theta_3db=2*acosd(0.5^a);
D_3db=32*log10(2)/(2*theta_3db^2);                        % for HAP antenna
%D_H=effi*D_3db*cosd(theta).^n_H;
%D_db_H=30+10*log10(D_H);
D_H_max=50+10*log10(effi*D_3db*cosd(0)^n_H);            % Maximum value, Atak use kora hobe sidelobe floor ar jonno
D_H_db= zeros(size(theta));
m=size(theta);
for x=1:m(2),
    D_H=effi*D_3db*cosd(theta(x))^n_H;
    D_H_db(1,x)=50+10*log10(D_H);
    if(D_H_db(1,x)<=D_H_max-30)
        D_H_db(1,x)=D_H_max-30;
    end
end
% figure (1);
% plot(theta,D_H_db,'b');
% title('Radiation Pattern of HAP Antenna');
% xlabel('Elevation Angle');
% ylabel('Directivity in dB');
% hold on;
% grid on;
figure (2);
plot(theta,D_H_db,'b');
title('Radiation Pattern of HAP Antenna');
xlabel('Elevation Angle');
ylabel('Directivity in dB');
hold on;
grid on;
%% For user antenna

theta=0:90;
n_U=58;
D_bore=18;
D_U_db= zeros(size(theta));
m2=size(theta);
for y=1:m2(2)
    D_U=effi*cosd(theta(y))^n_U;
    D_U_db(1,y)=D_bore+10*log10(D_U);
    if(D_U_db(1,y)<=D_bore-20)
        D_U_db(1,y)=D_bore-20;
    end
end
figure (3);
y=0:90;
plot(theta,D_U_db,'b');
title('Radiation Pattern of User Antenna');
xlabel('Angle from boresight');
ylabel('Directivity in dB');
hold on;
grid on;