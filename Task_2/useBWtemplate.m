function useBWtemplate = useBWtemplate(image, template)
% i = grayscale image
% this function will remove the background between two values

    j = double(template);
    % get the height and width of the image
    [row,col,byt] = size(j); 
    
    for x=1:1:row       % go through the entire row one at a time 
        for y=1:1:col   % go through each column
            if((j(x,y)==0))
                image(x,y,:) = [0,0,0];

            else 
                image(x,y) = image(x,y); 
            end
        end
    end

    % DEBUG
    useBWtemplate = image; 
    % figure; imshow(i);  % show original image 
    % figure; imshow(j);  % show sliced image