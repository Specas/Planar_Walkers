function ax = plotCompass(ax, q1, q2)

global params
hold on;

[~, ~, hip_x, hip_y, ~, ~, swing_x, swing_y] = computePos(q1, q2, params.init_fixed_x, params.init_fixed_y);
hip_radius = 2; 

%Plotting the fixed leg first
plot(ax, [params.init_fixed_x, hip_x], [params.init_fixed_y, hip_y], 'b', 'LineWidth', 2);

%Plotting the swing leg
plot(ax, [hip_x, swing_x], [hip_y, swing_y], 'b', 'LineWidth', 2);

%Plotting the hip
rectangle(ax, 'Position', [hip_x - hip_radius, hip_y - hip_radius, 2*hip_radius, 2*hip_radius], 'Curvature', [1, 1], 'FaceColor', [0.9100    0.4100    0.1700]);


