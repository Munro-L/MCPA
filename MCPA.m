time = 200;

% single particle
%x = 0;
%last_x = 0;
%vx = 0;
%last_vx = 0;

% multiple particles
x = zeros(5, 1);
last_x = zeros(5, 1);
vx = zeros(5, 1);
last_vx = zeros(5, 1);

velocities = [];
mean_v = 0;
last_mean_v = 0;
acceleration = 5;
figure(1)
hold on

%figure(2)
%hold on

% this would be nice, but I don't have 2019b on my laptop :(
% tiledlayout(2,1)

for t = 1:time
    vx = vx + acceleration;
    x = x + vx;
    
    scattered = rand(5, 1) < 0.05;
    if any(scattered)       % scatter chance
        % perfectly eleastic case
        % vx = 0;   
        
        % changes direction at half energy
        vx = vx - 1.5 * (vx .* scattered); 
    end
    
    figure(1)
    subplot(2, 1, 1)
    hold on
    plot([t-1 t], [last_x x], "g");
    last_x = x;
    
    %figure(2)
    subplot(2, 1, 2)
    hold on
    mean_v = mean(velocities, "all");
    title(sprintf("Avg Velocity: %s", mean_v))
    plot([t-1 t], [last_vx vx], "r");
    plot([t-1 t], [last_mean_v mean_v], "b");
    last_mean_v = mean_v;
    last_vx = vx;
    velocities = [velocities vx];
end
