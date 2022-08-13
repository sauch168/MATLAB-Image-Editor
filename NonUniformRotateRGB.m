function rotated = NonUniformRotateRGB(image, type)
    if type ~= 1 && type ~= 2
        rotated = NaN;
        return
    end
    [R, G, B] = SeparateColors(image);
    [~, ~, R] = NonUniformRotate(R, type);
    [~, ~, G] = NonUniformRotate(G, type);
    [~, ~, B] = NonUniformRotate(B, type);
    rotated = cat(3, R, G, B);
    rotated = uint8(rotated);
end