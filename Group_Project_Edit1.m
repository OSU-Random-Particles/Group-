% Group project Random Walk
clear all;
close all;
clc;

x_cordinate = 0; % x-cordinate
y_cordinate = 0; % y-cordinate
Number_Step = 100; % The number of step that the particle is moving
Step_size = 1; % The size of step when it moves

% Angle 
for i = 1:Number_Step
    Angle = rand*2*pi; % random angle
    x_cordinate(i+1) = (Step_size * cos(Angle)) + x_cordinate(i);
    y_cordinate(i+1) = (Step_size * sin(Angle)) + y_cordinate(i);
end

pax = polaraxes
polaraxes(pax)
hold on
polarscatter(x_cordinate,y_cordinate)
