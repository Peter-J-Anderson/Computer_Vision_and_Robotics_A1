function quiet_image = remove_noise(i)

% define a structuring element to use for noise removal
 se = strel('disk',3);

quiet_image = imerode(i,se);

% lets get rid of some of the noise
quiet_image = imdilate(quiet_image,se);
quiet_image = imerode(quiet_image,se);
quiet_image = imdilate(quiet_image,se);
quiet_image = imerode(quiet_image,se);
quiet_image = imdilate(quiet_image,se);
quiet_image = imerode(quiet_image,se);
quiet_image = imdilate(quiet_image,se);

% some potatoes are still connected - lets try and fix that. 
 se = strel('diamond',6);
quiet_image = imopen(quiet_image,se);

%test labeling

 
% DEBUG
% output the image
% figure; imshow(quiet_image);



