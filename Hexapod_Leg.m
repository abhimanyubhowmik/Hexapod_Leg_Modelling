syms q1 q2 q3 l0 l1 l2 l3;

%Homogeneous Transform Matrix

T0 = [cos(q1), -sin(q1), 0,  0;
sin(q1),  cos(q1), 0,  0;
      0,        0, 1, l0;
      0,        0, 0,  1];

T1 = [cos(q2), -sin(q2),  0, l1;
      0,        0, -1,  0;
sin(q2),  cos(q2),  0,  0;
     0,        0,  0,  1];


T2 = [cos(q3), -sin(q3), 0, l2;
sin(q3),  cos(q3), 0,  0;
      0,        0, 1,  0;
      0,        0, 0,  1];


T3 = [1, 0, 0, l3;
0, 1, 0,  0;
0, 0, 1,  0;
0, 0, 0,  1];

%Combined Tranformation Matrix

T03 = T0*T1*T2*T3;

%Jacobian matrix

Px = T03(1,4);
Py = T03(2,4);
Pz = T03(3,4);

Jacobian = [diff(Px,q1), diff(Px,q2), diff(Px,q3);
    diff(Py,q1), diff(Py,q2), diff(Py,q3);
    diff(Pz,q1), diff(Pz,q2), diff(Pz,q3)];

% Singularities of the Jacobian

eqn = det(Jacobian) == 0;

S = solve(eqn,[q1 q2 q3]);
subs(Jacobian,{q1,q2,q3},[pi/2, pi/2,pi/2])
