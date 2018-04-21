%Function for ode45
function x_next = odeFunc(x)

%Unrolling
q1 = x(1);
q2 = x(2);
q1d = x(3);
q2d = x(4);

[M, C, G] = computeMCG(x);
xdd =  M\(-C*[x(3); x(4)] - G);
x_next = zeros(4, 1);
x_next(1) = q1d;
x_next(2) = q2d;
x_next(3) = xdd(1);
x_next(4) = xdd(2);




