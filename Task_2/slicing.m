function sliced_image = slicing(i)
% i = grayscale image
% this function will remove the background between two values

    j = double(i);
    u = 20; % upper threashold  
    l = 0;  % lower threashold

    % get the height and width of the image
    [row,col,byt] = size(j); 
    
    for x=1:1:row       % go through the entire row one at a time 
        for y=1:1:col   % go through each column
            if((j(x,y)>l) && (j(x,y)<u))
                j(x,y) = 0; 
            else 
                % the 'background' black
                j(x,y) = i(x,y); 
            end
        end
    end

    % DEBUG
    sliced_image = j; 
    % figure; imshow(i);  % show original image 
    % figure; imshow(j);  % show sliced image
    