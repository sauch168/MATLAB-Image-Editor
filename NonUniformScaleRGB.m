function scaled = NonUniformScaleRGB(image, type)
    if type ~= 1 && type ~= 2
        scaled = NaN;
        return
    end
    [R, G, B] = SeparateColors(image);
    [~, ~, R] = NonUniformScale(R, type);
    [~, ~, G] = NonUniformScale(G, type);
    [~, ~, B] = NonUniformScale(B, type);
    scaled = cat(3, R, G, B);
    scaled = uint8(scaled);
end