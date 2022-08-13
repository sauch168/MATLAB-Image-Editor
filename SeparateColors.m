function [r, g, b] = SeparateColors(image)
    %returns 3 color channels
    r = image(:, :, 1);
    g = image(:, :, 2);
    b = image(:, :, 3);
end