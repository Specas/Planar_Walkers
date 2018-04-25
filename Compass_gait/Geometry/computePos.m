%Function to compute the positions of mid points of the legs and the hip
%given the configuration and position of the fixed leg on the ramp

%INPUTS:
%q1: First generalized coordinate (Angle of the fixed leg with the
%vertical)
%q2: Second generalized coordinate (Angle of the swing leg with the
%vertical)

%OUTPUS:
%fixed_mp_x, fixed_mp_y: Position of the mid point of the fixed leg
%hip_x, hip_y: Position of the hip 
%swing_mp_x, swing_mp_y: Position of the mid point of the swing leg
%swing_x, swing_y: Position of the toe of the swing leg 

function [fixed_mp_x, fixed_mp_y, hip_x, hip_y, swing_mp_x, swing_mp_y, swing_x, swing_y] = computePos(q1, q2)

global params

fixed_mp_x = params.fixed_x - params.l*sin(q1)/2;
fixed_mp_y = params.fixed_y + params.l*cos(q1)/2;
hip_x = params.fixed_x - params.l*sin(q1);
hip_y = params.fixed_y + params.l*cos(q1);
swing_mp_x = hip_x + params.l*sin(q2)/2;
swing_mp_y = hip_y - params.l*cos(q2)/2;
swing_x = hip_x + params.l*sin(q2);
swing_y = hip_y - params.l*cos(q2);










