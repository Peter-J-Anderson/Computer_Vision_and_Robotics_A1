
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


%----------------------------------------------------------------------
% lets now get the detail we want. 
% number of potatoes 
disp('Number of potatoes');
disp(num);

% now we need details for each potato

s = regionprops(L,'All');
disp('                   Potato Centroid                                                                                 Mean            Standard Deviation');
disp('Potato Number      X          Y        Num of Pixels    MajorAxisLength   MinorAxisLength      circularity      R    G   B              R   G   B');
hold on
for j = 1:1:numel(s), 
x_coordinate = s(j).Centroid(1);
y_coordinate = s(j).Centroid(2);
pixelValue = s(j).Area;
majorAxis = s(j).MajorAxisLength;
minorAxis = s(j).MinorAxisLength;
circularity = (4*pi*pixelValue)/(s(j).Perimeter^2);
str = ['       ',num2str(j),'        ', num2str(x_coordinate), '   ', num2str(y_coordinate), '         ',num2str(pixelValue), '           ', num2str(majorAxis), '           ', num2str(minorAxis), '             ', num2str(circularity)];
disp(str);
end
hold off