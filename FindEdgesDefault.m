function [edgemap, dilated_mask, filled_mask] = FindEdgesDefault(image)
    %calls FindEdges with default values
    [edgemap, dilated_mask, filled_mask] = FindEdges(image, 0.5, 4,... 
        false, 2);
end