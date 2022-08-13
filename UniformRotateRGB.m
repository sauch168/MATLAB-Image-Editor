function [x, y, g] = UniformRotateRGB(image, theta)
    [R, G, B] = SeparateColors(image);
    [x, y, R] = UniformRotate(R, theta);
    [~, ~, G] = UniformRotate(G, theta);
    [~, ~, B] = UniformRotate(B, theta);
    g = cat(3, R, G, B);
    g = uint8(g);
end