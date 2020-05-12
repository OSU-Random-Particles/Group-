% Group project Random Walk
clear all;
close all;
clc;

for j = 1:3
    x_coordinate = 0; % initialize x-cordinate
    y_coordinate = 0; % initialize y-cordinate
    Number_Step = 100; % The number of step that the particle is moving
    Step_size = 1; % The size of step when it moves


    % Angle 
    for i = 1:Number_Step
        Angle = rand*2*pi; % random angle
        % calculate x and y coorditanes to graph
        x_coordinate(i+1) = (Step_size * cos(Angle)) + x_coordinate(i);
        y_coordinate(i+1) = (Step_size * sin(Angle)) + y_coordinate(i);
    end
    x = x_coordinate;
    y = y_coordinate;
    % Graph each step
    plot(x,y)
    hold on
    % Label the graph with the number of steps taken
    title(['Step ',num2str(i)])
    % Set the axes so they don't continually change
    axis([-20,20,-20,20])
    % let the graph refresh
    pause(0.1)
    % We don't need the circles if we don't want to plot them
end