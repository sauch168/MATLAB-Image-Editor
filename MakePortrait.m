function portrait_image = MakePortrait(image, filter_size, sigma)
    [~, ~, channels] = size(image);
    if nargin < 3
        filter_size = [10, 10];
    end
    if channels == 3
        portrait_image = SmoothingRGB(image, 'gaussian', filter_size, sigma);
    else
        portrait_image = Smoothing(image, 'gaussian', filter_size, sigma);
    end
    [~, ~, outline] = FindEdgesDefault(image);
    indices = outline ~= 0;
    [row, col] = size(indices);
    for i = 1:row
        for j = 1:col
            if indices(i, j) == 1
                portrait_image(i, j, :) = image(i, j, :);
            end
        end
    end
end