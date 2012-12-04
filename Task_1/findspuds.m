function findspuds(i)

% convert the image (i) to grey scale so it is easier to threash-hold the
% background out. 

% step 1
% create a grey scale version of the image 
grey_image = rgb2gray(i);

% use a mean filter and subtract to remove some of the noise 
mean_image = medfilt2(grey_image, [4 4]);
filt_image = grey_image - mean_image;
grey_image = grey_image - filt_image; 

% DEBUG - make sure the image has been converted
% figure; imshow(grey_image);

% step 2
% convert to binary image
bw_image = slicing(grey_image);
% figure; imshow(bw_image);

% step 3 
% clean up - fill potato
fill_image = imfill(bw_image);
% figure; imshow(fill_image);

% step 4 
% open some gaps
se = strel('diamond',3);
open_image = imopen(fill_image, se);
% figure; imshow(open_image);

% step 4
% label potatoes
[L, num] = bwlabel(open_image, 8);
disp(num);
outline_image = label2rgb(L, 'winter', 'k', 'shuffle');
outline_image = imdilate(outline_image,se) - outline_image;


% final step 
% add the outlines to the spuds 
% make sure the color channels are blue
% set all the colors to blue 
blue_outline = im2bw(outline_image, 0.1);

%blue = immultiply(blue_outline, i(:,:,3));
blue = imfuse(i(:,:,3), blue_outline);

finalImg = cat(3, i(:,:,1), i(:,:,2), blue(:,:,3));
finalImg = finalImg - i;
finalImg = i + finalImg;
figure; imshow(finalImg);
