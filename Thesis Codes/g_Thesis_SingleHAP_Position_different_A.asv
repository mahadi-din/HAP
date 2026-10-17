% clc;
% close all;
% clear all;
R=30;
H=22;
ele=60;                                             % Atak vary korae kicu plot neya jete pare
g=R-H*cotd(ele);
%g=10;
theta_sub = atand((R+g)/H)+ atand((R-g)/H);
theta_0= (theta_sub/2)-atand((R-g)/H);
n_H=10;                                            %%Atak vary korae amra amader cell edge ar sathe 3db/10db point k adjust korte parbo
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
n_U=2;
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
theta_user=zeros(size(x0));
deviation_user1=zeros(size(x0));
A_H_db=zeros(size(x0));
A_U_db=zeros(size(x0));
FSL_db=zeros(size(x0));
C=zeros(size(x0));
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
            %u_p=[x0(m) y0(R+1) z0(1)];
            spp=[x0(R+1)-g y0(R+1) z0(1)];
            bore_point1=[H*tand(theta_0)-g y0(R+1) z0(1)];        % Bore at theta_sub/2 point 
            bore_point2=spp;                % Bore at spp point 
            bore_point3=[x0(R+1) y0(R+1) z0(1)];                  % Bore at cell centre point
            vec_h2bore=[bore_point3(1)-h_p(1) bore_point3(2)-h_p(2) bore_point3(3)-h_p(3)];
            vec_h2u=[u_p(1)-h_p(1) u_p(2)-h_p(2) u_p(3)-h_p(3)];
            vec_h2spp=[spp(1)-h_p(1) spp(2)-h_p(2) spp(3)-h_p(3)];
            theta_user=acosd(dot(vec_h2u,vec_h2bore)/(norm(vec_h2bore)*norm(vec_h2u)));                     
            %theta_user(m,1)=acosd(dot(vec_h2u,vec_h2bore)/(norm(vec_h2bore)*norm(vec_h2u))); 
            deviation_user=theta_user;                           % Akhane user angle e hocce  deviation
            A_H=D_max*effi*cosd(deviation_user)^n_H;
            A_H_db=30+10*log10(A_H);                                 % HAP antenna gain
            %A_H_db(m,1)=40+10*log10(A_H);
            theta_spp= atand((R-g)/H);
            theta_u2spp= acosd(dot(vec_h2u,vec_h2spp)/(norm(vec_h2spp)*norm(vec_h2u)));
            A_U=effi*cosd(theta_u2spp)^n_U;
            A_U_db=10+D_bore+10*log10(A_U);                        % User antenna gain
            %A_U_db(m,1)=10+D_bore+10*log10(A_U);                    % Ata use kora hocce error checking ar jonno
            lamda=c/f;
            d=norm(vec_h2u);                                    % Distance from the user
            FSL= (4*pi*d*1000/lamda)^2;
            FSL_db=10*log10(FSL);                               % Free space loss
            %FSL_db(m,1)=10*log10(FSL);                          % Ata use kora hocce error checking ar jonno
            C=P_H+A_H_db+A_U_db-FSL_db;                               % Carrier
            %C(m,n)=P_H+A_H_db+A_U_db-FSL_db;
            CINR(n,m)=C-NF;
            %CINR(m,1)=C-NF;
        end
    end
    %end
%end
figure (2);
%contour(x0,y0,C,'ShowText','on');                % use kora hocce error checking ar jonno
%figure (1);
%plot(x0,CINR(:,1),'g');
% figure (2);
% plot(x0,A_U_db(:,1),'g');
% figure (3);
% plot(x0,FSL_db(:,1),'g');
%contour(x0,y0,CINR,'ShowText','on');
plot(x0,CINR(R+1,:),'b');                            % For different boresight
hold on;
% %clabel(CINR);
% plot(x0(R+1)-g,y0(R+1),'--ko');
% hold on;
% plot(g*cosd(60),g*sind(60),'--k>');
% hold on;
% plot(g*cosd(60),-g*sind(60),'--k>');
% hold on;
% 
% Radius = 30;
%  
% [x,y,z] = cylinder(Radius,200);
% % %figure (2);
% plot(x(1,:),y(1,:),'k');
% %axis equal