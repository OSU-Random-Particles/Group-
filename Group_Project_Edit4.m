% Group project Random Walk

%% Workspace Preamble
clear all;
close all;
clc;

%% User Input
prompt1 = 'How many particles do you want to observe?: ';
Number_Particles = input(prompt1);
prompt2 = 'How many steps do you want the particle(s) to move?: ';
Number_Step = input(prompt2);
prompt3 = 'What step size do you want the particle(s) to take?: ';
Step_Size = input(prompt3);

%% Monte Carlo For Loop
for j = 1:Number_Particles % Loop for # of particles
    x_coordinate = 0; %Initialize x-cordinate
    y_coordinate = 0; %Initialize y-cordinate
    Number_Step = 100; %The number of step that the particle is moving
    Step_Size = 1; %The size of step when it moves


    % Loop For Random Angle
    for i = 1:Number_Step %Iterate to length of number of steps
        Angle = rand*2*pi; %Create random angle
        x_coordinate = (Step_Size * cos(Angle)) + x_coordinate; % x coordinate calc
        y_coordinate = (Step_Size * sin(Angle)) + y_coordinate; % y coordinate calc
    end
    
    x(j) = x_coordinate; %Index x coordinates
    y(j) = y_coordinate; %Index y coordinates
  
    %Graph for each step
    figure(1)
    plot(x,y,'o','MarkerEdgeColor','b','MarkerFaceColor','r')
    hold on
    title(['Step ',num2str(i)]) %Label the graph with the number of steps taken
    axis([-20,20,-20,20]) %Set the axes so they don't continually change
    pause(0.1) %Let the graph refresh
   
end

%% Histogram for X
figure(2)
histogram(x)

%% Standard Deviation Calculation
t = Number_Step * Step_Size;
D = Number_Particles / Number_Step;
sigma = sqrt(2 * D * t);
fprintf('The standard deviation of this Brownian Distribution is : %.3f', sigma)
