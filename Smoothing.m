function smoothed_img = Smoothing(img, filter_type, filter_size, sigma)
    %Convolution function, using calculations explained by Prof. Eric
    %Miller in Region Processing II: https://canvas.tufts.edu/courses/7818/files/folder/FinalProjects/projectIdeas/imageProcessingBackgroundMiller?
    if strcmp(filter_type, 'gaussian')
        %gaussian smoothing
        for i = 1:filter_size(1)
            for j = 1:filter_size(2)
                exponent = (-1 * (i^2 + j^2)) / (2 * sigma^2);
                filter(i, j) = exp(exponent);
            end
        end
        filter = filter/sum(sum(filter));
    elseif strcmp(filter_type, 'box')
        %box smoothing
        filter(1:filter_size(1), 1:filter_size(2)) =...
            1/(filter_size(1) * filter_size(2));
    else 
        smoothed_img = NaN;
        return
    end
    smoothed_img = uint8(filter2(filter, img, 'same'));
end