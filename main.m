clc;clear;close all;	% Clean screen, clear variables, close windows
warning ('off','all');	% Avoid known warnings
dbstop if error;
dbclear if error;  		% Uncomment if debug mode is wanted

%% INPUTS
% -------------------------------------------------------------------------

% Forces
F      = 1700;  % Input Force

% Geometry
L      = 140;   % Total Beam Lenght
H      = 20;    % Total Beam Height
W      = 20;    % Total Beam widht
a      = 40;    % distance IV point bending test

% Material
rho    = 1148;  % PLA density
sigmat = 40;    % Fracture sigma PLA

% plot optimal cross section?
plotting = 1 ;       % 1 True; 0 False


%% Cross Sections Plotting 

% Calling optimizator for different heights
[R,Weight,b,x_plot,y] = optimal_cross_section_calculator(F,L,H,W,a,rho,sigmat,plotting);
    

%% Height Comparison

% plot optimal cross sections for each height?
plotting = 0 ;       % 1 True; 0 False

% Setting Subplot 
fig = figure;

i = 0; 
for H=20:20:60

    % Counter
    i = i + 1;
    
    % Calling optimizator for different heights
    [R,Weight,b,x_plot,y] = optimal_cross_section_calculator(F,L,H,W,a,rho,sigmat,plotting);
    
    % Plotting Ratio
    subplot(2,1,1);
    hold on
    title ("Weight Ratio comparison for different Heights")
    plot (x_plot,R,'DisplayName',strcat('H = ',num2str(H)),'LineWidth',2);
    legend
    
    
    % Plotting Weight
    subplot(2,1,2);
    hold on
    title ("Weight comparison for different Heights")
    plot (x_plot,Weight,'DisplayName',strcat('H =',num2str(H)),'LineWidth',2);
    legend


end 

hold off









