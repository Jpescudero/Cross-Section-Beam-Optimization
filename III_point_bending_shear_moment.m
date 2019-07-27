function [sm] = III_point_bending_shear_moment(F,L,x,y,a) 

    % Output Allocation
    sm = zeros(length(y),2);
    
    if x<=L/2
    
        % shear
        sm(:,1) = (F/2);
        % moment
        sm(:,2) = (F/2)* x; 
    
    else

        % shear
        sm(:,1) = (-F/2);
        % moment
        sm(:,2) = (-F/2)* (x-L);
        
    end
    
end