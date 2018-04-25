%Hybrid Dynamics for the compass gait, including all gate switching and
%transition velocities

function x = hybridDynamics(x)

global params

pos_struct = {};
pos_struct.above = 1;
pos_struct.on = 0;
pos_struct.below = -1;

out = getFeetPosGround(x(1), x(2));

if out == pos_struct.below && params.leg_crossed && params.swing_stop
    
    q1 = x(1);
    q2 = x(2);
    q1d = x(3);
    q2d = x(4);
    
%     fprintf('Below.\n');
    
    %Compute new velocities
    M = computeImpactM(x(1:2));
   
    %C matrix that contains the basis of the null space 
%     C = [1; -(params.l*tan(params.alpha)*cos(q2) + params.l*sin(q2))/(params.l*sin(q1) + params.l*tan(params.alpha)*cos(q1))];
    
    C = [1 0 -params.l*cos(q1) params.l*cos(q2); 0 1 -params.l*sin(q1) params.l*sin(q2)].';
    
    %Augmenting the generalized velocities to incorporate the two extra
    %velocities
    qd_pre = [0; 0; x(3:4)];
    impulse_mat = eye(4, 4) - inv(M)*C*inv(C.'*inv(M)*C)*C.';
    qd_pos = impulse_mat*qd_pre;
    
    x(3:4) = qd_pos(3:4);
    
    %Changing position of fixed leg in the simulation
    [~, ~, ~, ~, ~, ~, swing_x, swing_y] = computePos(x(1), x(2));
    
    %Position of the fixed leg is now the position of the swing leg
    params.fixed_x = swing_x;
    params.fixed_y = swing_y;
    
    
    %Switching positions and velocities
    x([1, 2]) = x([2, 1]);
    x([3, 4]) = x([4, 3]);
    
    %Resetting flags
    params.leg_crossed = false;
    params.foot_place = false;
    params.swing_stop = false;
     
    
end

% if out == pos_struct.above
% %     disp('Above');
% elseif out == pos_struct.on
% %     disp('On');
% elseif out == pos_struct.below
%     disp('Below');
% else
% %     disp('Uncertain');
% end