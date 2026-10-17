%% For 2.5 GHz frequency

clc;
close all;
clear all;
theta= 10:90;
g_mu=-94.2;
h_mu=-3.44;
i_mu=0.0318;
mu=(g_mu+theta)./(h_mu+i_mu*theta);
g_sigma=-89.55;
h_sigma=-8.87;
i_sigma=0.0927;
sigma=(g_sigma+theta)./(h_sigma+i_sigma*theta);
x=1:10;
y=2+x;
plot(theta,mu,'.-b');
legend('Mean');
hold on;
plot(theta,sigma,'-b');
legend('Varience');
hold on;

%% For 3.5 GHz frequency

g_mu1=-92.90;
h_mu1=-3.14;
i_mu1=0.0302;
mu1=(g_mu1+theta)./(h_mu1+i_mu1*theta);
g_sigma1=-89.06;
h_sigma1=-8.63;
i_sigma1=0.0921;
sigma1=(g_sigma1+theta)./(h_sigma1+i_sigma1*theta);
plot(theta,mu1,'.-r');
% legend('Mean');
hold on;
plot(theta,sigma1,'-r');
% legend('Varience');
hold on;

%%  For 5.5 GHz frequency

g_mu2=-92.80;
h_mu2=-2.995;
i_mu2=0.0285;
mu2=(g_mu2+theta)./(h_mu2+i_mu2*theta);
g_sigma2=-89.54;
h_sigma2=-8.474;
i_sigma2=0.0900;
sigma2=(g_sigma2+theta)./(h_sigma2+i_sigma1*theta);
plot(theta,mu2,'.-g');
% legend('Mean');
hold on;
plot(theta,sigma2,'-g');
% legend('Varience');
hold on;
