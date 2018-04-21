%Main file that runs the compass gait simulation

clear; 
clc;

%Adding to path
addpath(genpath('Simulate/'));
addpath(genpath('Geometry/'));
addpath(genpath('Dynamics/'));

%Global parameters
global params
params.alpha = deg2rad(20);
params.xlim = [0, 250];
params.ylim = [0, 250];
params.right_height = 50;
params.M = 10;
params.m = 5;
params.l = 30;
params.g = 9.81;
params.init_fixed_x = 50;

%Calculated parameters
params.left_height = params.right_height + (params.xlim(2) - params.xlim(1))*tan(params.alpha);
params.figure_width = params.xlim(2) - params.xlim(1);
params.figure_height = params.ylim(2) - params.ylim(1);
params.init_fixed_y = params.right_height + (params.figure_width - params.init_fixed_x)*tan(params.alpha);

%Initial parameters (Angles and velocities)
q1_init = deg2rad(-5);
q2_init = deg2rad(-45);
q1d_init = 0;
q2d_init = 0;

select_q2_automatically = true;
if select_q2_automatically
    q2_init = computeQ2(q1_init);
end


%Initializing figure
[fig, ax] = initializeFigure2D('Compass-Gait', 'GridOn', params.xlim, params.ylim);

%Repositioning and rescaling figure
set(fig, 'Position', [450, 250, 700, 500]);

%Plotting the ground
ax = plotGround(ax);

%Plotting initial configuration
ax = plotCompass(ax, q1_init, q2_init);

% pause;

%Simulating. We can simulate either after computing q2 for foot placed on
%the ground or by a manual initial value of q2. This can be selected by
%changing the boolean value selection variable above.
q_init = [q1_init; q2_init; q1d_init; q2d_init];

free_simulate(ax, q_init);
















