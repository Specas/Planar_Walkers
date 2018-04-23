%Function to simulate the free dynamcis of the compass gait walker
function [] = free_simulate(ax, x_init)

global params

%Unrolling
q1_init = x_init(1);
q2_init = x_init(2);
q1d_init = x_init(3);
q2d_init = x_init(4);

delta_t = 0.1;
curr_time = 0;

sim_time_multiplier = 0.5;

x_curr = x_init;

q2_curr = x_init(2);

for i=1:500
    
    tspan = [0, delta_t];
    [~, x] = ode45(@(t, x) odeFunc(x), tspan, x_curr);
    x_curr = x(end, :).';
    
    q2_prev = q2_curr;
    q2_curr = x_curr(2);
    
    %If q2 decreases, then its time for a foot place
    if q2_curr <= q2_prev
        params.foot_place = true;
%         disp('Foot place');
    end
    
    %Check for leg crossing
    if x_curr(2) > x_curr(1)
        params.leg_crossed = true;
    end
    
    %Hybrid dynamics
    x_curr = hybridDynamics(x_curr);
    
%     disp(x_curr);
    
    pause;
    
    ax = plotCompass(ax, x_curr(1), x_curr(2));
    
    pause(delta_t*sim_time_multiplier);

    
    
end



