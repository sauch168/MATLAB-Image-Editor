function [x, y, g] = UniformScale(image, factor)
    %This function contains calculations explained by Prof. Eric Miller in
    %slideshow "Image Warping": https://canvas.tufts.edu/courses/7818/files/folder/FinalProjects/projectIdeas/imageProcessingBackgroundMiller?
    [row, col] = size(image);
    %creates grid where center of the picture is coordinate (0, 0)
    x = linspace(-0.5, 0.5, col)';
    y = linspace(-0.5, 0.5, row)';
    y = flipud(y);
    [X, Y] = meshgrid(x, y);
    %transform coordinates
    p = X / factor;
    q = Y / factor;
    image = double(image);
    %create image
    g = interp2(X, Y, image, p, q, 'linear', 0);
    g = uint8(g);
end