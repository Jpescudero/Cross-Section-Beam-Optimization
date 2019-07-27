function [R] = section_bending(u0,F,L,a,x,y,delta_x,delta_y,rho,sigmat) 


%% Variables to be optimized
% u0 = [b];
% h = y = 2
% b = z = 3

b  = u0;
h  = delta_y;


%% Inertia Calculation
I =(1/12)*h.*b .* (h^2 + b.^2) + h.*b.*y.^2;


%% Mass Calculation
W = delta_x * (h.*b)* rho /1000000;

%% Shear Moment Calculation

% III point beam stress
sm_III = III_point_bending_shear_moment(F,L,x,y,L/2);

% III point beam stress
sm_IV = IV_point_bending_shear_moment(F,L,x,y,a);



%% Stress Calculation
% Axis criteria
% 1 = x; 2 = y; 3 = z

% allocation
sigma_III = zeros (length(y),3);
sigma_IV = zeros (length(y),3);

% III point bending
sigma_III(:,1) = sm_III(:,2) .* y ./ I;
sigma_III(:,2) = 0;
sigma_III(:,3) = 3 .* sm_III(:,1) ./ (2 .* h .* b);

% IV point bending
sigma_IV(:,1) = sm_III(:,2) .* y ./ I;
sigma_IV(:,2) = 0;
sigma_IV(:,3) = 3 .* sm_III(:,1) ./ (2 .* h .* b);

for j=1:length(y)
    s1 (j,1) = max(abs(sigma_III(j,1)) , abs(sigma_IV(j,1)));
    s2 (j,1) = 0;
    s3 (j,1) = max(abs(sigma_III(j,3)) , abs(sigma_IV(j,3)));
end

% Von misses 
Vm = sqrt(0.5 .* ((s1-s2).^2 + (s1-s3).^2) +(s2-s3).^2);

% Reserve Factor calculation
RF = sigmat ./ Vm;

% Final Ratio
R = (RF .*F )./ (W.^4 .* 9.8 ./ 1000);

% For finding the max ratio
R = -max(R);

end


