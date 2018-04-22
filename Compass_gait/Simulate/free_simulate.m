%Function to simulate the free dynamcis of the compass gait walker
function [] = free_simulate(ax, x_init)

%Unrolling
q1_init = x_init(1);
q2_init = x_init(2);
q1d_init = x_init(3);
q2d_init = x_init(4);

delta_t = 0.1;
curr_time = 0;

sim_time_multiplier = 0.5;

x_curr = x_init;

for i=1:100
    
    tspan = [0, delta_t];
    [~, x] = ode45(@(t, x) odeFunc(x), tspan, x_curr);
    x_curr = x(end, :).';
    
    %Hybrid dynamics
    x_curr = hybridDynamics(x_curr);
    
    ax = plotCompass(ax, x_curr(1), x_curr(2));
    
    pause(delta_t*sim_time_multiplier);

    
    
end



