clc
close all
clear all
R=30;                                               % Coverage radious
H=20;                                               % Platform height
r=8;                                                % Cell radious
ele=60;                                             % Atak vary korae kicu plot neya jete pare
g=R-H*cotd(ele);                                    % Spacing radious
n_H=30;                                             % Atak vary korae amra amader cell edge ar sathe 3db/10db point k adjust korte parbo
                                                    % Akhane n=1.7 a -3db adjusted
a_H=1/n_H;
effi=0.8;
theta_3db=2*acosd(0.5^a_H);
D_max=(32*log10(2))/(2*theta_3db^2);
i=0;
f=3.5;
c=0.3;
P_H=40;                                             % Tx power
NF=-100.5;                                          % Noise power
n_U=58;
D_bore=18;
x0=-3*r:3/2*r:3*r;
y0=-realsqrt(3)*2*r:realsqrt(3)/2*r:realsqrt(3)*2*r;
m1=size(x0);
n1=size(y0);
for m=1:m1(2)
    for n=1:n1(2)
        i=i+1;
        %if mod(i,2)==1
        if i==11
            x4=x0(m)+g;
            y4=y0(n);
            g_cell=realsqrt(x4^2+y4^2);                       % Distance between SPP and cell centre
            theta_sub = atand((g_cell+r)/H)- atand((g_cell-r)/H);       % Subtended angle
            theta_0= atand((g_cell-r)/H)+theta_sub/2;                    % Angle of max point.
            x1=theta_sub/2-90;                                  % Ata use kora hoica -90 to +90 range a neyar jonno
            x2=theta_sub/2+90;                                  % Ata use kora hoica -90 to +90 range a neyar jonno
            x= x1:x2;
            %x= 0:theta_sub;
            deviation=theta_sub/2-x;                            % Angles away from the boresight
            D=D_max*effi*cosd(deviation).^n_H;                  % Gain at the angles away
            D_db=10*log10(D);                                   % 
%             %figure (i);
%             plot(deviation,D_db);
%             title('Radiation pattern of HAP antenna');
%             hold on;
%             grid on;
            x3=-r:1:r;
            y3=-r:1:r;
            m3=size(x3);
            n3=size(y3);
            CINR=zeros(size(x3));
            for m2=1:m3(2)
                for n2=1:n3(2)
                    x5=x4+x3(m2);
                    y5=y4+y3(n2);
                    y=realsqrt(x5^2+y5^2);                                
                    theta_user=atand(y/H);                              
                    deviation_user=theta_0-theta_user;  
                    %deviation_user=theta_sub/2-theta_user;  
                    A_H=D_max*effi*cosd(deviation_user).^n_H;           % Atak use kora hocce user ar jonno specific HAP antenna gain ber korar jonno
                    A_H_db=10*log(A_H);                                 % HAP antenna gain
                    A_U=effi*cosd(theta_user).^n_U;
                    A_U_db=D_bore+10*log10(A_U);                        % User antenna gain
                    lamda=c/f;                        % Akhane f ar different value use korte hobe different cell ar jonno
                    d=realsqrt(H^2+x5^2+y5^2);                          % Distance from the user
                    FSL= (4*pi*d*1000/lamda)^2;
                    FSL_db=10*log10(FSL);                             % Free space loss
                    C=P_H+A_H+A_U-FSL_db;                               % Carrier
                    CINR(m2,n2)=C-NF;
                end
            end
            x3=x0(m)-r:1:x0(m)+r;                       % Akhane x3 and y3 use korteci specific cell contour plot korar jonno 
            y3=y0(n)-r:1:y0(n)+r;
            figure (3);
            contour(x3,y3,CINR);
            hold on;
        end
    end
end
%%  User antenna ratiation pattern
% 
% theta=-90:1:90;
% %n_U=58;
% %D_bore=18;
% D_U=effi*cosd(theta).^n_U;
% D_U_db= D_bore+10*log10(D_U);
% figure (2);
% plot(theta,D_U_db,'r');
% title('Radiation pattern of User antenna');
% hold on;
% grid on;

%% Carrier to Noise ration
% 
% 
% 
% for m=1:m1(2)
%     for n=1:n1(2)
%         x1=x0(m)+floor(g);
%         y1=y0(n);
%         y=realsqrt(x1^2+y1^2);                                
%         theta_user=atand(y/H);                              
%         deviation_user=theta_sub/2-theta_user;              
%         A_H=D_max*effi*cosd(deviation_user).^n_H;
%         A_H_db=10*log(A_H);                                 % HAP antenna gain
%         A_U=effi*cosd(theta_user).^n_U;
%         A_U_db=D_bore+10*log10(A_U);                        % User antenna gain
%         lamda=c/f;
%         d=realsqrt(H^2+x1^2+y1^2);                          % Distance from the user
%         FSL= (4*pi*d*1000/lamda)^2;
%         FSL_db=10*log10(FSL);                             % Free space loss
%         C=P_H+A_H+A_U-FSL_db;                               % Carrier
%         CINR(m,n)=C-NF;
%     end
% end
% figure (3);
% contour(x0,y0,CINR);

