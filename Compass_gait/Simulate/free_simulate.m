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
q2d_curr = x_init(4);

for i=1:350
    
    tspan = [0, delta_t];
    [~, x] = ode45(@(t, x) odeFunc(x), tspan, x_curr);
    x_curr = x(end, :).';
    
    q2_prev = q2_curr;
    q2d_prev = q2d_curr;
    q2_curr = x_curr(2);
    q2d_curr = x_curr(4);
    
    %Setting control flags
    
    %Check for leg crossing
    if x_curr(2) > x_curr(1)
        params.leg_crossed = true;
    else
        params.leg_crossed = false;
        params.swing_switch = false;
    end
    
    %Checking if the velocity of the swing leg has switched
    if (q2d_curr >=0 && q2d_prev <=0) || (q2d_curr <=0 && q2d_prev >=0)
        if params.leg_crossed
            if params.DEBUG
                fprintf('Swing leg switched\n');
            end
            params.swing_switch = true;
        else
            params.swing_switch = false;
        end
    end
    
    %Hybrid dynamics
    x_curr = hybridDynamics(x_curr);
    
    if params.DEBUG
        pause;
    end
    
    ax = plotCompass(ax, x_curr(1), x_curr(2));
    
    pause(delta_t*sim_time_multiplier);

    
    
end



