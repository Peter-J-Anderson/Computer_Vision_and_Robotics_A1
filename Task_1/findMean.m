function [R, G, B, stdR, stdG, stdB]  = findMean(region_image, RGB_image)

% use the template image to look at the correct pixels in the RGB image. 
R = 0; 
G = 0; 
B = 0; 

col = region_image.PixelList(:,2);
row = region_image.PixelList(:,1);

pixels = impixel(RGB_image, row, col); 
R = (mean(pixels(:,1)));
G = (mean(pixels(:,2)));
B = (mean(pixels(:,3)));

stdR = std(pixels(:,1));
stdG = std(pixels(:,2));
stdB = std(pixels(:,3));
