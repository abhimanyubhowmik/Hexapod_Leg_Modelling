syms q1 q2 l1 l2;

%Homogeneous Transform Matrix

T1 = [cos(-pi/2+q1), -sin(-pi/2+q1), 0,  0;
sin(-pi/2+q1),  cos(-pi/2+q1), 0,  0;
      0,        0, 1, 0;
      0,        0, 0,  1];


T2 = [cos(q2), -sin(q2), 0, l1;
sin(q2),  cos(q2), 0,  0;
      0,        0, 1,  0;
      0,        0, 0,  1];


T3 = [1, 0, 0, l2;
0, 1, 0,  0;
0, 0, 1,  0;
0, 0, 0,  1];

%Combined Tranformation Matrix

T13 = T1*T2*T3

%Jacobian matrix

Px = T13(1,4)
Py = T13(2,4)

Jacobian = [diff(Px,q1), diff(Px,q2);
     diff(Py,q1), diff(Py,q2)]

% Singularities of the Jacobian
% 
% eqn = det(Jacobian) == 0;
% 
% S = solve(eqn,[q1 q2 q3]);
% subs(Jacobian,{q1,q2,q3},[pi/2, pi/2,pi/2])
