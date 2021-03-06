
 function findspuds(i)

% convert the image (i) to grey scale so it is easier to threash-hold the
% background out. 

% step 1
% create a grey scale version of the image 
grey_image = rgb2gray(i);
%figure; imshow(grey_image);


% use a mean filter and subtract to remove some of the noise 
mean_image = medfilt2(grey_image, [4 4]);
%figure; imshow(mean_image);
filt_image = grey_image - mean_image;
%figure; imshow(filt_image);
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
%figure; imshow(fill_image);

% step 4 
% open some gaps
se = strel('diamond',3);
open_image = imopen(fill_image, se);
%figure; imshow(open_image);

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
%figure; imshow(blue_outline);
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
disp('                   Potato Centroid                                                                               Mean                  Standard Deviation');
disp('Potato Number      X          Y        Num of Pixels    MajorAxisLength   MinorAxisLength  circularity      R      G      B            R       G       B');
hold on
for j = 1:1:numel(s), 
x_coordinate = s(j).Centroid(1);
y_coordinate = s(j).Centroid(2);
pixelValue = s(j).Area;
majorAxis = s(j).MajorAxisLength;
minorAxis = s(j).MinorAxisLength;
circularity = (4*pi*pixelValue)/(s(j).Perimeter^2);
[R,G,B, stdR,stdG,stdB] = findMean(s(j),i);
str = ['\t',num2str(j),'\t\t\t', num2str(x_coordinate,'%07.3f'), '\t\t', num2str(y_coordinate,'%07.3f'), '\t\t',num2str(pixelValue,'%09.3f'), '\t\t\t', num2str(majorAxis,'%07.3f'), '\t\t\t', num2str(minorAxis,'%07.3f'), ' \t\t ', num2str(circularity,'%05.3f'), '\t\t', num2str(R,'%07.3f'), '\t', num2str(G,'%07.3f'), '\t', num2str(B,'%07.3f'),'\t\t', num2str(stdR,'%07.3f'),'\t',num2str(stdG,'%07.3f'), '\t', num2str(stdB,'%07.3f'), '\n'];
fprintf(str);
end
hold off