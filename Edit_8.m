% Group project Random Walk

%% Workspace Preamble
clear all;
close all;
clc;

%% User Input
prompt1 = 'Amount of Particles: ';
Number_Particles = input(prompt1);
%The number of step that the particle is moving
prompt2 = 'Number of Steps: ';
Number_Step = input(prompt2); 
%The size of step when it moves
prompt3 = 'Step Size: ';
Step_Size = input(prompt3);

%% Monte Carlo For Loop
% axis bounds variable
k = 20 * Step_Size;
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
    r(j) = x(j)^2 + y(j)^2; 
    
    % Circles for distances
    for R = 1:2:k % For loop to iterate over size of axes (for different radii)
        theta = 0:pi/100:2*pi; %range and increment of angle theta
        xunit = R * cos(theta); %calculation for x unit of circle
        yunit = R * sin(theta); %calculationg for y unit of circle
        plot(xunit, yunit, 'k'); %plot circles
        axis square;
    end

    %Graph for each step
    figure(1)
    plot(x,y,'o','MarkerEdgeColor','b','MarkerFaceColor','r')
    hold on
    title(['Step ',num2str(i)]) %Label the graph with the number of steps taken
    xlabel('Distance mm'); %Label x - axis
    ylabel('Distance mm'); %Label y - axis
    axis([-k,k,-k,k]) %Set the axes so they don't continually change
   
end



%% Histogram for X
figure(2) % Make new figure
histfit(x); %Plot histogram of x with fitted normal curve
title('Spatial Distribution') %Label the graph with the number of steps taken
ylabel('Number of Particles'); %Label x - axis
xlabel('Distance from Origin along X - axis (mm)'); %Label y - axis
hold on

%% Standard Deviation Calculation
t = Number_Step * Step_Size;% Time
sigma = std(r); % Standard Deviation
D = sigma^2/(2*t); % Diffusivity
disp('--------------------------------------------------------------')
fprintf('The Diffusivity of this Brownian Distribution is %.3f.        \n', D)
fprintf('The Standard Deviation of this Brownian Distribution is %.3f. \n', sigma)
disp('--------------------------------------------------------------')