%Hybrid Dynamics for the compass gait, including all gate switching and
%transition velocities

function x = hybridDynamics(x)

global params

pos_struct = {};
pos_struct.above = 1;
pos_struct.on = 0;
pos_struct.below = -1;

out = getFeetPosGround(x(1), x(2));

% if out == pos_struct.above
%     disp('Above');
% elseif out == pos_struct.on
%     disp('On');
% elseif out == pos_struct.below
%     disp('Below');
% else
%     disp('Uncertain');
% end