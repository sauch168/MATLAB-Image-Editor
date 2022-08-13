function img = ContrastEnhance(original_img)
    [row, col, n] = size(original_img);
    if (n == 1)
        for i = 1:row
            for j = 1:col
                img(i, j) = uint8(45.9858 * log(1 + double(original_img(i, j))));
            end
        end
        return
    end
    [R, G, B] = SeparateColors(original_img);
    %Formula from: "Image Enhancement" by Prof. Eric Miller (found in canvas
    %project ideas): https://canvas.tufts.edu/courses/7818/files/folder/FinalProjects/projectIdeas/imageProcessingBackgroundMiller?
    
    %Contrast enhancement idea: new_img = C * log(1 + old_img) where C
    %makes it so that when new_img = 0, old_img is 0, and when new_img =
    %255, old_img = 255. On a graph of y = c * ln(1 + x), a value of
    %approximately 45.9858 makes it so that the previous conditions are
    %true.
    for i = 1:row
        for j = 1:col
            R(i, j) = uint8(45.9858 * log(1 + double(R(i, j))));
            G(i, j) = uint8(45.9858 * log(1 + double(G(i, j))));
            B(i, j) = uint8(45.9858 * log(1 + double(B(i, j))));
        end
    end
    img = cat(3, R, G, B);
end