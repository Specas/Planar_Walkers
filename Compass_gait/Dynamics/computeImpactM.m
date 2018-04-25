%Function to compute the four coordinate Mass matrix at the time of impact.
%This is required to compute the post impact velocities

function M = computeImpactM(q)

global params

%Unrolling
q1 = q(1);
q2 = q(2);

M = zeros(4, 4);

M(1, 1) = 2*params.m + params.M;
M(1, 3) = -(3/2)*params.m*params.l*cos(q1) - params.M*params.l*cos(q1);
M(1, 4) = (1/2)*params.m*params.l*cos(q2);
M(2, 2) = 2*params.m + params.M;
M(2, 3) = -(3/2)*params.m*params.l*sin(q1) - params.M*params.l*sin(q1);
M(2, 4) = (1/2)*params.m*params.l*sin(q2);
M(3, 1) = -(3/2)*params.m*params.l*cos(q1) - params.M*params.l*cos(q1);
M(3, 2) = -(3/2)*params.m*params.l*sin(q1) - params.M*params.l*sin(q1);
M(3, 3) = (5/4)*params.m*params.l^2 + params.M*params.l^2;
M(3, 4) = -(1/2)*params.m*params.l^2*cos(q1 - q2);
M(4, 1) = (1/2)*params.m*params.l*cos(q2);
M(4, 2) = (1/2)*params.m*params.l*sin(q2);
M(4, 3) = -(1/2)*params.m*params.l^2*cos(q1 - q2);
M(4, 4) = (1/4)*params.m*params.l^2;