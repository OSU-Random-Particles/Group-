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

%% Add in a variable for the axes
k = 20*Step_Size^2;
%% Monte Carlo For Loop
for j = 1:Number_Particles % Loop for # of particles
    x_coordinate = 0; %Initialize x-cordinate
    y_coordinate = 0; %Initialize y-cordinate

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
    title(['Number of Steps: ',num2str(i)]) %Label the graph with the number of steps taken
    xlabel('Distance from Origin')
    ylabel('Distance from Origin')
    axis([-k k -k k]) %Set the axes so they don't continually change
end

%% Histogram for X with a Gausian curve
figure(2)
histfit(x)
title('Distribution of the Particles')
xlabel('Distance from Origin')
ylabel('Number of Particles')
%% Standard Deviation Calculation
t = Number_Step * Step_Size;
D = Number_Particles / Number_Step;
sigma = sqrt(2 * D * t);
disp('----------------------------------------------------------------')
fprintf('The standard deviation of this Brownian Distribution is : %.3f\n', sigma)