%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author        : Priyank Parmar
% Tested On     : 14th June, 2017
% Description   : Detection of Optical Disc from Eye Image
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
clear all;
close all;
%% Reading Image
rgbImage = imread('Image1.jpg');
grayImage = rgb2gray(rgbImage);
figure,
subplot(1,2,1), imshow(rgbImage);       title('Original Image');
subplot(1,2,2), imshow(grayImage);      title('Grayscale Image');

%% Splitting Image into RGB channels
redChannel   = rgbImage(:,:,1);
greenChannel = rgbImage(:,:,2);
blueChannel  = rgbImage(:,:,3);
figure, 
subplot(2,2,1), imshow(grayImage);      title('Grayscale Image');
subplot(2,2,2), imshow(redChannel);     title('Red Negative Image');
subplot(2,2,3), imshow(greenChannel);   title('Green Negative Image');
subplot(2,2,4), imshow(blueChannel);    title('Blue Negative Image');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                          OPTICAL DISC CLASS                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Thresholding Image Red
level = graythresh(redChannel);
redChannelBinary = imbinarize(redChannel,level);
% Filling Small points
opticalDiscClass = imopen(redChannelBinary,strel('disk',10));

% Filling desired color in Optical Disc
desiredColor = [39, 130, 239]; % Yellow Color
redChannel(opticalDiscClass)   = desiredColor(1);
greenChannel(opticalDiscClass) = desiredColor(2);
blueChannel(opticalDiscClass)  = desiredColor(3);
redChannel(~opticalDiscClass)  = 0;
greenChannel(~opticalDiscClass)= 0;
blueChannel(~opticalDiscClass) = 0;
segmentedColorImage = cat(3,redChannel,greenChannel,blueChannel);

% Display Segmented Image
figure, 
subplot(1,2,1), imshow(rgbImage);           title('Color Image');
subplot(1,2,2), imshow(segmentedColorImage);title('Optical Disc Image');

% Saving Image 
imwrite(segmentedColorImage,'OutputImage.jpg');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




