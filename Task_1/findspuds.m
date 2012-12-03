function findspuds(i)

% convert the image (i) to grey scale so it is easier to threash-hold the
% background out. 

% step 1
% create a grey scale version of the image 
grey_image = rgb2gray(i); 
% DEBUG - make sure the image has been converted
%figure; 
%imshow(grey_image);


% step 2
% using slicing to remove background
sliced_grey_image = slicing(grey_image);
% DEBUG - make sure the image has been converted
% figure; imshow(sliced_grey_image);

% step 3
 quiet_image = remove_noise(sliced_grey_image);
% DEBUG - make sure the image has been converted
 figure; imshow(quiet_image);
