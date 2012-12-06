function task2()
% take the 4 test images and add all colours found in the images into a
% colour model.
backgroundModel = zeros(255,255,255);

% DEBUG - lets make sure that the entire array is empty. 
% str = background(255,255,255);
% disp(str);

% now flag all colours in background image in our background model 
backgroundImage1 = imread('beltempty_1.jpg');
backgroundImage2 = imread('beltempty_2.jpg');
backgroundImage3 = imread('beltempty_3.jpg');
backgroundImage4 = imread('beltempty_4.jpg');

myImage1 = imread('beltpotatoes_1.jpg');
myImage2 = imread('beltpotatoes_2.jpg');
myImage3 = imread('beltpotatoes_3.jpg');
myImage4 = imread('beltpotatoes_4.jpg');
myImage5 = imread('beltpotatoes_5.jpg');
myImage6 = imread('beltpotatoes_6.jpg');
myImage7 = imread('beltpotatoes_7.jpg');
myImage8 = imread('beltpotatoes_8.jpg');
myImage9 = imread('beltpotatoes_9.jpg');
myImage10 = imread('beltpotatoes_10.jpg');

% figure; imshow(myImage1);
% figure; imshow(myImage2);
% figure; imshow(myImage3);
% figure; imshow(myImage4);
% figure; imshow(myImage5);
% figure; imshow(myImage6);
% figure; imshow(myImage7);
% figure; imshow(myImage8);
% figure; imshow(myImage9);
% figure; imshow(myImage10);

backgroundModel = learnBackground(backgroundImage1,backgroundModel);
backgroundModel = learnBackground(backgroundImage2,backgroundModel);
backgroundModel = learnBackground(backgroundImage3,backgroundModel);
backgroundModel = learnBackground(backgroundImage4,backgroundModel);


% now remove all pixels found in the background model from the image. 
% figure; imshow(testImage);

removeUnwantedParts(myImage1 ,backgroundModel);
removeUnwantedParts(myImage2 ,backgroundModel);
removeUnwantedParts(myImage3 ,backgroundModel);
removeUnwantedParts(myImage4 ,backgroundModel);
removeUnwantedParts(myImage5 ,backgroundModel);
removeUnwantedParts(myImage6 ,backgroundModel);
removeUnwantedParts(myImage7 ,backgroundModel);
removeUnwantedParts(myImage8 ,backgroundModel);
removeUnwantedParts(myImage9 ,backgroundModel);
removeUnwantedParts(myImage10 ,backgroundModel);


