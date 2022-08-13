function [x, y, g] = NonUniformScale(image, type)
    %outputs x and y are coordinates; g is an image
    %This function uses calculations that are explained by Prof. Eric
    %Miller in slideshow "Image Warping": https://canvas.tufts.edu/courses/7818/files/folder/FinalProjects/projectIdeas/imageProcessingBackgroundMiller?
    if type ~= 1 && type ~= 2
        x = NaN;
        y = NaN;
        g = NaN;
        return
    end
    [row, col] = size(image);
    %make grid with center of picture as coordinate (0, 0)
    x = linspace(-0.5, 0.5, col)';
    y = linspace(-0.5, 0.5, row)';
    y = flipud(y);
    [X, Y] = meshgrid(x, y);
    %transform coordinates
    if type == 1
        P = exp(-1 * sqrt(X.^2 + Y.^2)) .* X;
        Q = exp(-1 * sqrt(X.^2 + Y.^2)) .* Y;
    elseif type == 2
        P = sqrt(X.^2 + Y.^2) .*X;
        Q = sqrt(X.^2 + Y.^2) .* Y;
    end
    image = double(image);
    %create image
    g = interp2(X, Y, image, P, Q, 'linear', 0);
    g = uint8(g);
end