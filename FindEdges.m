function [edgemap, dilated_mask, filled_mask] = FindEdges(image,... 
    factor, borderclear_factor, borderclear_bool, smoothing_num)
    [~, ~, channels] = size(image);
    if (channels == 3)
        grayed = rgb2gray(image);
    else
        grayed = image;
    end
    %https://www.mathworks.com/help/images/detecting-a-cell-using-image-segmentation.html
    %This function will make use of Matlab functions to reduce possibility
    %of error as writing edge detection, gradient mask, dilation, and hole
    %filling functions individually would be unnecessarily cumbersome.
    
    %create a binary gradient mask
    [edgemap, thresh] = edge(grayed, 'sobel');
    bin_grad_mask = edge(grayed, 'sobel', factor * thresh);
    
    %linear structuring elements
    str_el_90 = strel('line', 3, 90); %vertical
    str_el_0 = strel('line', 3, 0); %horizontal
    %convert the mask to more of an outline by "dilating"
    dilated_mask = imdilate(bin_grad_mask, [str_el_90 str_el_0]);
    %the outlines will still have holes; fill them
    filled_mask = imfill(dilated_mask, 'holes');
    %focus on object outlines near the center; remove the ones near the
    %borders
    if borderclear_bool
        filled_mask = imclearborder(filled_mask, borderclear_factor);
    end
    %outline has been made; smooth the object by a user-defined number of
    %times with another structuring element (instead of line shape, use
    %diamond shape to better smooth the outline's edges)
    smoothing_element = strel('diamond', 1);
    for i = 1:smoothing_num
        filled_mask = imerode(filled_mask, smoothing_element);
    end
end