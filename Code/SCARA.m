syms t1 t2 t3 a r4;

T01 = [cos(t1), -sin(t1), 0,0;
    sin(t1),cos(t1),0,0;
    0,0,1,452.4;
    0,0,0,1]; 
T12 = [cos(t2),-sin(t2),0,220;
    sin(t2),cos(t2),0,0;
    0,0,1,0;
    0,0,0,1];
T23 = [cos(t2),-sin(t2),0,240;
    sin(t2),cos(t2),0,0;
    0,0,1,0;
    0,0,0,1];
T03 = T01*T12*T23;
T02 = T01*T12;

Px = T03(1,4);
Py = T03(2,4);

Jacobian = [diff(Px,t1), diff(Px,t2);
    diff(Py,t1), diff(Py,t2)];

det_J = det(Jacobian);

eqn = det_J == 0;
sing = solve(eqn,t2);


