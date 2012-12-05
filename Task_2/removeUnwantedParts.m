function myImage = removeUnwantedParts(myImage, backgroundModel)
myImageNN = removeBackground(backgroundModel, myImage);

myImagegray = removeNoise(myImageNN);

% need to romove noise first 
SE = strel('diamond', 3);
myImagebw = imdilate(myImagegray,SE);myImagebw = imdilate(myImagebw,SE);
myImagebw = imerode(myImagebw,SE); myImagebw = imerode(myImagebw,SE); 


image_fill = imfill(myImagebw, 'holes');


% DEBUG
image_fill = im2uint8(image_fill);
image_fill = cat(3,image_fill,image_fill,image_fill);

myImage = useBWtemplate(myImage, image_fill);

figure; imshow(myImage);
