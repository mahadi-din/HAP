clc;
close all;
clear all;
R=30;
H=20;
ele=60;                                             % Atak vary korae kicu plot neya jete pare
g=R-H*cotd(ele);
%g=0;
theta_sub = atand((R+g)/H)+ atand((R-g)/H);
theta_0= (theta_sub/2)-atand((R-g)/H);
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
% figure (1);
% plot(deviation,D_db);
% title('Radiation pattern of HAP antenna');
% hold on;
% grid on;

%%  User antenna ratiation pattern

theta=-90:1:90;
n_U=6;
D_bore=18;
D_U=effi*cosd(theta).^n_U;
D_U_db= D_bore+10*log10(D_U);
% figure (2);
% plot(theta,D_U_db,'r');
% title('Radiation pattern of User antenna');
% hold on;
% grid on;

%% Carrier to Noise ration

x0=-R:R;
y0=-R:R;
z0=0:H;
f=2;
c=.3;
P_H=40;                                             % Tx power
NF=-100.5;                                          % Noise power
CINR=zeros(size(x0));
m1=size(x0);
n1=size(y0);
p1=size(z0);
% for p=1:p1(2)
%     if z0(p)==H
    for m=1:m1(2)
        for n=1:n1(2)
            h_p=[x0(R+1)-g y0(R+1) z0(H+1)];
            u_p=[x0(m) y0(n) z0(1)];
            spp=[x0(R+1)-g y0(R+1) z0(1)];
            bore_point1=[H*tand(theta_0)-g y0(R+1) z0(1)];        % Bore at theta_sub/2 point 
            bore_point2=[x0(R+1)-g y0(R+1) z0(1)];                % Bore at spp point 
            bore_point3=[x0(R+1) y0(R+1) z0(1)];                  % Bore at cell centre point
            vec_h2bore=[bore_point2(1)-h_p(1) bore_point2(2)-h_p(2) bore_point2(3)-h_p(3)];
            vec_h2u=[u_p(1)-h_p(1) u_p(2)-h_p(2) u_p(3)-h_p(3)];
            vec_h2spp=[spp(1)-h_p(1) spp(2)-h_p(2) spp(3)-h_p(3)];
            theta_user=acosd(dot(vec_h2u,vec_h2bore)/(norm(vec_h2bore)*norm(vec_h2u)));                     
            theta_centre=atand(g/H);
            deviation_user1=theta_sub/2-theta_user;              % Akhane onnanno point a bore ar jonno change korte hobe
            deviation_user2=theta_user;                          % Akhane onnanno point a bore ar jonno change korte hobe
            deviation_user3=theta_centre-theta_user;             % Akhane onnanno point a bore ar jonno change korte hobe             
            A_H=D_max*effi*cosd(deviation_user2)^n_H;
            A_H_db=40+10*log10(A_H);                                 % HAP antenna gain
            theta_u2spp= acosd(dot(vec_h2u,vec_h2spp)/(norm(vec_h2spp)*norm(vec_h2u)));
            A_U=effi*cosd(theta_u2spp)^n_U;
            A_U_db=10+D_bore+10*log10(A_U);                        % User antenna gain
            %A_U_db=20;
            lamda=c/f;
            d=norm(vec_h2u);                                       % Distance from the user
            FSL= (4*pi*d*1000/lamda)^2;
            FSL_db=10*log10(FSL);
            r=realsqrt(x0(m)*x0(m)+y0(n)*y0(n));
            if(r<16)
                Shad_Loss=normrnd((-92.4+theta_user)/(-3.44+0.0318.*theta_user),(-89.55+theta_user)/(-8.87+0.0927.*theta_user));
                C=P_H+A_H_db+A_U_db-FSL_db-Shad_Loss-normrnd(0,10);                               % Carrier
                %C=P_H+A_H_db+A_U_db-FSL_db;
                %e=acosd(dot(vec_h2u,vec_h2bore)/(norm(vec_h2bore)*norm(vec_h2u)));
            else
                C=P_H+A_H_db+A_U_db-FSL_db;
            end
            CINR(m,n)=C-NF;
        end
    end
%     end
% end
figure (3);
contour(x0,y0,CINR,'ShowText','on');
hold on;
Radius = 16;

[x,y,z] = cylinder(Radius,200);
%figure (2);
plot(x(1,:),y(1,:),'k')
