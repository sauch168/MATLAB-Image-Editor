function [x, y, g] = UniformRotate(image, theta)
    %The calculations in this function were explained by Prof. Eric Miller
    %in slideshow "Image Warping": https://canvas.tufts.edu/courses/7818/files/folder/FinalProjects/projectIdeas/imageProcessingBackgroundMiller?
    [row, col] = size(image);
    %creates a grid where the middle of the picture is coordinate (0, 0)
    x = linspace(-0.5, 0.5, col)';
    y = linspace(-0.5, 0.5, row)';
    y = flipud(y);
    [X, Y] = meshgrid(x, y);
    %transformed coordinates
    p = X * cosd(theta) + Y * sind(theta);
    q = -1 * X * sind(theta) + Y * cosd(theta);
    image = double(image);
    %create transformed image
    g = interp2(X, Y, image, p, q, 'linear', 0);
    g = uint8(g);
end