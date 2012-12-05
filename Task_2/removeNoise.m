function myImagebw = removeNoise(myImagegray)

% remove noise here
myImagegray = rgb2gray(myImagegray);

mean_image = medfilt2(myImagegray, [4 4]);
filt_image = myImagegray - mean_image;
myImagegray = myImagegray - filt_image; 


% convert to binary
 
myImagegray = slicing(myImagegray);


myImagebw = bwareaopen(myImagegray,1000);

%figure; imshow(myImagegray);