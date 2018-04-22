%Function to get relative position of feet wrt to the ground (For hybrid
%gate)
function out = getFeetPosGround(q1, q2)

global params

[~, ~, ~, ~, ~, ~, swing_x, swing_y] = computePos(q1, q2, params.fixed_x, params.fixed_y);

pos_struct = {};
pos_struct.above = 1;
pos_struct.on = 0;
pos_struct.below = -1;

%We obtain the height of the ground at the same x coordinate of the swing
%leg and then compare it with the height of the swing leg 

ground_height = params.right_height + tan(params.alpha)*(params.figure_width - swing_x);

%Using a small epsilon to reduce false positive below ground returns
epsilon = 0.01;

if swing_y > ground_height
    out = pos_struct.above;
elseif swing_y == ground_height
    out = pos_struct.on;
elseif swing_y < ground_height - epsilon
    out = pos_struct.below;
else
    %Uncertain
    out = 2;
end

