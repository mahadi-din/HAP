clc;
close all;
clear all;
theta=20:90;
m0=size(theta);
x=zeros(m0);
for m=1:m0(2)
    x(1,m)=normrnd((-92.4+theta(m))./(-3.44+0.0318.*theta(m)),(-89.55+theta(m))./(-8.87+0.0927.*theta(m)))+normrnd(0,10);
end
plot(theta,x);