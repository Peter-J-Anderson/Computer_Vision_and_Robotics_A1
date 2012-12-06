function image = removeBackground(model, image)
for i=1:1:1080
    for j=1:1:360
        r = image(i,j,1);
        g = image(i,j,2);
        b = image(i,j,3);
        
        if model(r+1,g+1,b+1) == 1
            image(i,j,1) = 0;
            image(i,j,2) = 0;
            image(i,j,3) = 0;
        end
    end
end

% DEBUG
% figure; imshow(image);