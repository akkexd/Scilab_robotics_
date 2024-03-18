pi = 22/7;
ap1 =0; ap2 =0; ap3 = 0;
a1 = 1; a2 = 1; a3 = 1;
d1=0; d2=0; d3=0;
zeta1 = pi*(20)/180; zeta2 = pi*20/180; zeta3 = pi*(20)/180;

T1 = [cos(zeta1), -sin(zeta1)*cos(ap1), sin(zeta1)*sin(ap1), a1*cos(zeta1); sin(zeta1), cos(zeta1)*cos(ap1), -cos(zeta1)*sin(ap1), a1*sin(zeta1); 0, sin(ap1), cos(ap1), d1;0,0,0,1];

T2 = [cos(zeta2), -sin(zeta2)*cos(ap2), sin(zeta2)*sin(ap2), a2*cos(zeta2); sin(zeta2), cos(zeta2)*cos(ap2), -cos(zeta2)*sin(ap2), a2*sin(zeta2); 0, sin(ap2), cos(ap2), d2;0,0,0,1];

T3 = [cos(zeta3), -sin(zeta3)*cos(ap3), sin(zeta3)*sin(ap3), a3*cos(zeta3); sin(zeta3), cos(zeta3)*cos(ap3), -cos(zeta3)*sin(ap3), a3*sin(zeta3); 0, sin(ap3), cos(ap3), d3;0,0,0,1];

T = T1*T2*T3;
    T*[0;0;0;1]
Tp1 = T1*[0;0;0;1];
Tp2 = T1*T2*[0;0;0;1];
Tp3 = T1*T2*T3*[0;0;0;1];
Tp = [Tp1, Tp2, Tp3]
//to plot the robot
plot([0,Tp(1,:)],[0,Tp(2,:)]);
plot(Tp(1,3), Tp(2,3), 'marker', 'd', 'markerFaceColor', 'green');
