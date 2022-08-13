function [x, y, g] = NonUniformRotate(image, type)
    %This function uses calculations that are explained by Prof. Eric
    %Miller in slideshow "Image Warping": https://canvas.tufts.edu/courses/7818/files/folder/FinalProjects/projectIdeas/imageProcessingBackgroundMiller?
    if type ~= 1 && type ~= 2
        x = NaN;
        y = NaN;
        g = NaN;
        return
    end
    [row, col] = size(image);
    %make grid where the center of the picture is (0, 0)
    x = linspace(-0.5, 0.5, col)';
    y = linspace(-0.5, 0.5, row)';
    y = flipud(y);
    [X, Y] = meshgrid(x, y);
    image = double(image);
    r = sqrt(X.^2 + Y.^2);
    %transform coordinates
    if type == 1
        theta = 5 * r;
    elseif type == 2
        theta = 5 * exp(-10 * r);
    end
    p = X.*cos(theta) + Y.*sin(theta);
    q = -1*X.*sin(theta) + Y.*cos(theta);
    %create image
    g = interp2(X, Y, image, p, q);
    g = uint8(g);
end