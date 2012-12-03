function sliced_image = slicing(i)
% i = grayscale image
% this function will remove the background between two values


    j = double(i);
    u = 5; % upper threashold  
    l = 1;  % lower threashold

    % get the height and width of the image
    [row,col,byt] = size(j); 
    
    for x=1:1:row       % go through the entire row one at a time 
        for y=1:1:col   % go through each column
            if((j(x,y)>l) && (j(x,y)<u))
                j(x,y) = 0; 
            else 
                j(x,y) = 10; 
            end
        end
    end

    % DEBUG
    %figure; imshow(i);  % show original image 
    %figure; imshow(j);  % show sliced image
    sliced_image = j; 