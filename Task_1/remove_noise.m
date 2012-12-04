function quiet_image = remove_noise(i)

% define a structuring element to use for noise removal
 se = strel('diamond',1);
quiet_image = imerode(i,se);

% DEBUG
% output the image
% figure; imshow(quiet_image);



