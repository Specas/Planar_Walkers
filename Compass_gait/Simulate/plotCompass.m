function ax = plotCompass(ax, q1, q2)

global params

DEBUG = false;

%Clearing axes so that it can be animated
cla;

hold on;

global params

%Plotting ground as it has already been cleared first
ax = plotGround(ax);

[fixed_mp_x, fixed_mp_y, hip_x, hip_y, swing_mp_x, swing_mp_y, swing_x, swing_y] = computePos(q1, q2);
hip_radius = 2; 

%Plotting the fixed leg first
plot(ax, [params.fixed_x, hip_x], [params.fixed_y, hip_y], 'b', 'LineWidth', 2);

%Plotting the swing leg
plot(ax, [hip_x, swing_x], [hip_y, swing_y], 'b', 'LineWidth', 2);

%Plotting the hip
plot(ax, hip_x, hip_y, '.', 'MarkerSize', 25, 'Color', [0.1    0.75    0.63]);

%Debugging plots
if DEBUG
    
    %Mid points of the legs
    plot(ax, fixed_mp_x, fixed_mp_y, 'c.', 'MarkerSize', 10);
    plot(ax, swing_mp_x, swing_mp_y, 'c.', 'MarkerSize', 10);
    
    %Plotting toes
    plot(ax, swing_x, swing_y, 'k.', 'MarkerSize', 10);
    plot(ax, params.fixed_x, params.fixed_y, 'k.', 'MarkerSize', 10);
    
end
    
    
    
    
    
    
    
    
    
    
    
    