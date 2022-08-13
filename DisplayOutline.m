function outlined = DisplayOutline(image, red, green, blue) 
    [edgemap, ~, ~] = FindEdgesDefault(image);
    outlined = image;
    [~, ~, n] = size(image);
    if n > 1
        R = outlined(:, :, 1);
        G = outlined(:, :, 2);
        B = outlined(:, :, 3);
        R(edgemap) = red;
        G(edgemap) = green;
        B(edgemap) = blue;
        outlined = cat(3, R, G, B); 
    else
        outlined(edgemap) = 255;
    end
end