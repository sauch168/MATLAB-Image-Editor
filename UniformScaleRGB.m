function [x, y, scaled] = UniformScaleRGB(image, factor, trim)
    [R, G, B] = SeparateColors(image);
    [x, y, R] = UniformScale(R, factor);
    [~, ~, G] = UniformScale(G, factor);
    [~, ~, B] = UniformScale(B, factor);
    scaled = cat(3, R, G, B);
    scaled = uint8(scaled);
    [row, col, ~] = size(image);
    row_begin = round((row * factor)/2);
    col_begin = round((col * factor)/2);
    if trim && factor < 1
        scaled = scaled(row_begin:(row-row_begin), col_begin:(col-col_begin), :);
    end
end