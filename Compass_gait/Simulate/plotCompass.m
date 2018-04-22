function ax = plotCompass(ax, q1, q2)

global params

%Clearing axes so that it can be animated
cla;

hold on;

%Plotting ground as it has already been cleared first
ax = plotGround(ax);

[~, ~, hip_x, hip_y, ~, ~, swing_x, swing_y] = computePos(q1, q2, params.fixed_x, params.fixed_y);
hip_radius = 2; 

%Plotting the fixed leg first
plot(ax, [params.fixed_x, hip_x], [params.fixed_y, hip_y], 'b', 'LineWidth', 2);

%Plotting the swing leg
plot(ax, [hip_x, swing_x], [hip_y, swing_y], 'b', 'LineWidth', 2);

%Plotting the hip
plot(ax, hip_x, hip_y, '.', 'MarkerSize', 25, 'Color', [0.1    0.75    0.63]);

