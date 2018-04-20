%Computing q2 given q1 such that both feet touch the ground exactly.
%This is needed for the initial configuration

function q2 = computeQ2(q1)

global params

% hip_x = params.init_fixed_x - params.l*sin(q1);
% hip_y = params.init_fixed_y + params.l*cos(q1);
% A = params.l*tan(params.alpha);
% B = -params.l;
% C = params.figure_width*tan(params.alpha) - hip_x*tan(params.alpha) - hip_y + params.right_height;
% phi = atan2(B, A);
% r = sqrt(A^2 + B^2);
% q2 = -atan2(C, sqrt(r^2 - C^2)) + phi;

beta = pi/2 - params.alpha - q1;
half_base = params.l*cos(beta);
altitude = params.l*sin(beta);
phi = atan2(half_base, altitude);
q2 = -(2*phi - q1);