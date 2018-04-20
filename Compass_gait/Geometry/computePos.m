%Function to compute the positions of mid points of the legs and the hip
%given the configuration and position of the fixed leg on the ramp

function [fixed_mp_x, fixed_mp_y, hip_x, hip_y, swing_mp_x, swing_mp_y, swing_x, swing_y] = computePos(q1, q2, fixed_x, fixed_y)

global params

fixed_mp_x = params.init_fixed_x - params.l*sin(q1)/2;
fixed_mp_y = params.init_fixed_y + params.l*cos(q1)/2;
hip_x = params.init_fixed_x - params.l*sin(q1);
hip_y = params.init_fixed_y + params.l*cos(q1);
swing_mp_x = hip_x + params.l*sin(q2)/2;
swing_mp_y = hip_y - params.l*cos(q2)/2;
swing_x = hip_x + params.l*sin(q2);
swing_y = hip_y - params.l*cos(q2);