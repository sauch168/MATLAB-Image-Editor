function smoothed_img = SmoothingRGB(img, filter_type, filter_size, sigma)
    if ~strcmp(filter_type, 'gaussian') && ~strcmp(filter_type, 'box')
        smoothed_img = NaN;
        return
    end
    [R, G, B] = SeparateColors(img);
    R = Smoothing(R, filter_type, filter_size, sigma);
    G = Smoothing(G, filter_type, filter_size, sigma);
    B = Smoothing(B, filter_type, filter_size, sigma);
    smoothed_img = cat(3, R, G, B);
end