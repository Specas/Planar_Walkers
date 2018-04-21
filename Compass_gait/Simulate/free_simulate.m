%Function to simulate the free dynamcis of the compass gait walker
function [] = free_simulate(ax, x_init)

%Unrolling
q1_init = x_init(1);
q2_init = x_init(2);
q1d_init = x_init(3);
q2d_init = x_init(4);

delta_t = 0.1;
curr_time = 0;

x_curr = x_init;

for i=1:100
    
    tspan = [0, delta_t];
%     tspan = [curr_time, curr_time + delta_t];
%     tspan = linspace(curr_time, curr_time + delta_t, 2);
    [~, x] = ode45(@(t, x) odeFunc(x_curr), tspan, x_curr);
    x_curr = x(end, :).';
    curr_time = curr_time + delta_t;
     
    x_plot = x(end, :);
    ax = plotCompass(ax, x_plot(1), x_plot(2));
    pause(delta_t);

    
    
end



