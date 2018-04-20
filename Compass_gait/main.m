%Main file that runs the compass gait simulation

clear; 
clc;

%Adding to path
addpath(genpath('Plotting/'));
addpath(genpath('Geometry/'));

%Global parameters
global params
params.alpha = deg2rad(5);
params.xlim = [0, 300];
params.ylim = [0, 150];
params.right_height = 5;
params.M = 10;
params.m = 5;
params.l = 30;
params.init_fixed_x = 50;

%Calculated parameters
params.left_height = params.right_height + (params.xlim(2) - params.xlim(1))*tan(params.alpha);
params.figure_width = params.xlim(2) - params.xlim(1);
params.figure_height = params.ylim(2) - params.ylim(1);
params.init_fixed_y = params.right_height + (params.figure_width - params.init_fixed_x)*tan(params.alpha);

%Initial parameters
q1_init = deg2rad(10);
q2_init = deg2rad(-20);

%Initializing figure
[fig, ax] = initializeFigure2D('Compass-Gait', 'GridOn', params.xlim, params.ylim);

%Repositioning and rescaling figure
set(fig, 'Position', [450, 250, 700, 500]);

%Plotting the ground
ax = plotGround(ax);

%Plotting initial configuration
ax = plotCompass(ax, q1_init, computeQ2(q1_init));
disp(computeQ2(q1_init));














