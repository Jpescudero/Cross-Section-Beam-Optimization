function [sm] = IV_point_bending_shear_moment(F,L,x,y,a) 

    % Output Allocation
    sm = zeros(length(y),2);

    if x<=a
    
        % shear
        sm(:,1) = F;
        % moment
        sm(:,2) = F/2* x;
        
    
    elseif x>a && x<L-a
    
        % shear
        sm(:,1) = 0;
        % moment
        sm(:,2) = F * a;
    
    else
        
        % shear 
        sm(:,1) = -F;
        % moment
        sm(:,2) = -F .* (x-L);
    end
    
end