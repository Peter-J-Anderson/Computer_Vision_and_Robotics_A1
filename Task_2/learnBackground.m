function model = learnBackground(background, model)

[x,y,z] = size(background);
% loop though each image
    for i=1:1:x,
        %disp(i);
        for j=1:1:y,
            r = background(i,j,1);
            g = background(i,j,2);
            b = background(i,j,3);
            model(r+1,g+1,b+1) = 1; 
        end
    end

SE = strel('square', 2);
model = imdilate(model,SE);
    

