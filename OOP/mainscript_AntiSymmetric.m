clc
clear all

%% Example 1.6
r1=randn;
r2=randn;

%Dims in meters
% y1=200;
% z1=250;
% oA_vec=[cArea(3e4,300*100^3/12,100*300^3/12,0)
%     cArea(6e4,100*600^3/12,600*100^3/12,0)
%     cArea(3e4,300*100^3/12,100*300^3/12,0)];

%Dims in mm
y1=200e-3;
z1=250e-3;
oA_vec=[cArea(3e-2,300e-3*100e-3^3/12,100e-3*300e-3^3/12,0)
    cArea(6e-2,100e-3*600e-3^3/12,600e-3*100e-3^3/12,0)
    cArea(3e-2,300e-3*100e-3^3/12,100e-3*300e-3^3/12,0)];

y_vec=[y1;0;-y1];
z_vec=[z1;0;-z1];
y_hat_vec=y_vec+r1;
z_hat_vec=z_vec+r2;

oSec1=cCompCrossSec(oA_vec,y_hat_vec,z_hat_vec)
A=oSec1.A
y_bar_error=oSec1.y_bar-r1
z_bar_error=oSec1.z_bar-r2
Iy_hat=oSec1.Iy_hat
Iz_hat=oSec1.Iz_hat
Iyz_hat=oSec1.Iyz_hat
I_p_hat=oSec1.I_p_hat
Iy=oSec1.Iy
Iz=oSec1.Iz
Iyz=oSec1.Iyz
I_p=oSec1.I_p
cA=cArea(oSec1)
rho_y=cA.rho_y
rho_z=cA.rho_z
Sy=cA.Sy(300)
Sz=cA.Sz(350)

oSec2=cCompCrossSec_AntiSymm_ZSymm(oA_vec([1,2]),y_vec([1,2]),z_vec([1,2]))
oSec2.A-oSec1.A
%oSec2.y_bar-oSec1.y_bar
%oSec2.z_bar-oSec1.z_bar
% oSec2.Iy_hat-oSec1.Iy_hat
% oSec2.Iz_hat-oSec1.Iz_hat
% oSec2.Iyz_hat-oSec1.Iyz_hat
% oSec2.I_p_hat-oSec1.I_p_hat
oSec2.Iy-oSec1.Iy
oSec2.Iz-oSec1.Iz
oSec2.Iyz-oSec1.Iyz
oSec2.I_p-oSec1.I_p

oSec3=cCompCrossSec_AntiSymm_YSymm(oA_vec([1,2]),y_vec([1,2]),z_vec([1,2]))
oSec3.A-oSec1.A
%oSec3.y_bar-oSec1.y_bar
% oSec3.z_bar-oSec1.z_bar
% oSec3.Iy_hat-oSec1.Iy_hat
% oSec3.Iz_hat-oSec1.Iz_hat
% oSec3.Iyz_hat-oSec1.Iyz_hat
% oSec3.I_p_hat-oSec1.I_p_hat
oSec3.Iy-oSec1.Iy
oSec3.Iz-oSec1.Iz
oSec3.Iyz-oSec1.Iyz
oSec3.I_p-oSec1.I_p

%% Problem 1.2-e
r1=rand;
r2=randn;
r3=randn;
y1=203e-3/2+27.4e-3;
z1=254e-3/2+7.7e-3-14.7e-3;
z2=254e-3/2+7.7e-3-14.1e-3;
oA_vec=[cArea(1450e-6,0.278e-6,0.799e-6,r1)
    cArea(2610e-6,0.633e-6,15e-6,0)
    cArea(4810e-6,51.2e-6,2.8e-6,0)
    cArea(2610e-6,0.633e-6,15e-6,0)
    cArea(1450e-6,0.278e-6,0.799e-6,r1)];
y_vec=[y1;0;0;0;-y1];
z_vec=[z1;z2;0;-z2;-z1];
y_hat_vec=y_vec+r2;
z_hat_vec=z_vec+r3;

oSec1=cCompCrossSec(oA_vec,y_hat_vec,z_hat_vec)
A=oSec1.A
y_bar_error=oSec1.y_bar-r2
z_bar_error=oSec1.z_bar-r3
Iy_hat=oSec1.Iy_hat
Iz_hat=oSec1.Iz_hat
Iyz_hat=oSec1.Iyz_hat
I_p_hat=oSec1.I_p_hat
Iy=oSec1.Iy
Iz=oSec1.Iz
Iyz=oSec1.Iyz
I_p=oSec1.I_p

oSec2=cCompCrossSec_AntiSymm_YSymm(oA_vec(1:3),y_vec(1:3),z_vec(1:3))
oSec2.A-oSec1.A
% oSec2.y_bar-oSec1.y_bar
% oSec2.z_bar-oSec1.z_bar
% oSec2.Iy_hat-oSec1.Iy_hat
% oSec2.Iz_hat-oSec1.Iz_hat
% oSec2.Iyz_hat-oSec1.Iyz_hat
% oSec2.I_p_hat-oSec1.I_p_hat
oSec2.Iy-oSec1.Iy
oSec2.Iz-oSec1.Iz
oSec2.Iyz-oSec1.Iyz
oSec2.I_p-oSec1.I_p

oSec3=cCompCrossSec_AntiSymm_ZSymm(oA_vec(1:4),y_vec(1:4),z_vec(1:4))
oSec3.A-oSec1.A
% oSec3.y_bar-oSec1.y_bar
% oSec3.z_bar-oSec1.z_bar
% oSec3.Iy_hat-oSec1.Iy_hat
% oSec3.Iz_hat-oSec1.Iz_hat
% oSec3.Iyz_hat-oSec1.Iyz_hat
% oSec3.I_p_hat-oSec1.I_p_hat
oSec3.Iy-oSec1.Iy
oSec3.Iz-oSec1.Iz
oSec3.Iyz-oSec1.Iyz
oSec3.I_p-oSec1.I_p