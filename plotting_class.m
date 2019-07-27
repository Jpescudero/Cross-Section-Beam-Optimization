classdef plotting_class

properties (Constant)

end

properties
    
    % Plotting options    
    FontSizeLegend = 12;
    LineWidth      = 1;     % plot line width
    axFontSize     = 10;	% axis labels and the title size
    MarkerSize     = 3;     % marker size
    axLineWidth    = 1.1;	% Border line width
    axGridAlpha    = 0.1;	% Grid-line transparency
    savePlot       = true;	% save figures? 
    TitleFontSizeMultiplier   = 1.5;

end

methods (Static)
    function [] = setGraphProp(obj,axesHandle)
        set (axesHandle, 'GridAlpha', obj.axGridAlpha)
        set (axesHandle, 'FontSize',  obj.axFontSize)
        set (axesHandle, 'LineWidth', obj.LineWidth)
        set (axesHandle, 'TitleFontSizeMultiplier', obj. TitleFontSizeMultiplier)	
        grid on
        %grid minor
    end
end   


end