
function [R,Weight,b,x_plot,y] = optimal_cross_section_calculator(F,L,H,W,a,rho,sigmat,plotting)


%% DELTAS DEFINITION

delta_x = L/6;
delta_y = H/10;


%% OPTIMIZATION LOOPS

% Counter
i = 0;
for x = 0 : delta_x : L
    
    % Updating loop
    i = i + 1;
    x_plot(i) = x;
    
    % Set plotting figure for each cross section
    if plotting == 1 && x ~= 0 && x~=L
        
        fig = figure(i);
        title(strcat(" Optimal Cross section at x = " ,num2str(round(x)), " (H =" , num2str(round(H)), " W =",num2str(round(W)),")"))
        xlabel('x')
        xlim([-W/2, W/2])
        ylabel('z')
        hold on
        plotting_class.setGraphProp(plotting_class,fig.CurrentAxes)

    end 
    
   

    y = [-H/2+delta_y/2 : delta_y : H/2-delta_y/2].';
    
    [u,fval] = section_optimizer_bending(F,L,H,W,a,x,y,delta_x,delta_y,rho,sigmat);
    
    b(:,i) = u;
    
    R(i,1) = -fval;
    
    Weight(i,1) = sum(delta_x * (delta_y.*b(:,i))* rho /1000000);
        
    if plotting == 1 && x ~= 0 && x~=L 
        
        % Vertical shape
        plot (-b(:,i)/2,y,"k")
        plot (+b(:,i)/2,y,"k")
    
        % Upper and lower Closing Lines
        plot([-b(1,i)/2,b(1,i)/2],[y(1),y(1)],"k")
        plot([-b(end,i)/2,b(end,i)/2],[y(end),y(end)],"k")
        hold off

    end
        
end


end




