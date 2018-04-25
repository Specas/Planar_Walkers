%Computing q2 given q1 such that both feet touch the ground exactly.
%This is needed for the initial configuration

%INPUT: First generalized coordinate (q1)
%OUTPUT: Second generalized (q2) computed from q1 assuming that both feet
%touch the ground
function q2 = computeQ2(q1)

global params

beta = pi/2 - params.alpha - q1;
half_base = params.l*cos(beta);
altitude = params.l*sin(beta);
phi = atan2(half_base, altitude);
q2 = -(2*phi - q1);