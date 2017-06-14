%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Author        : Priyank Parmar
% Tested On     : 14th June, 2017
% Description   : To fill desired color in Image for segmentation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
clear all;
close all;

% Reading Color Image 
rgbImage    = imread('Image1.jpg');
% Convert Color image in Grayscale Image
grayImage   = rgb2gray(rgbImage);

% Fetching Red, Green and Blue Channels
redChannel  = rgbImage(:,:,1);
greenChannel= rgbImage(:,:,2);
blueChannel = rgbImage(:,:,3);

% Thresholding Grayscale Image
level = graythresh(redChannel);
binaryImage = imbinarize(redChannel,level);

% Filling Desired Color
desiredColor = [255, 255, 0]; % Yellow Color
redChannel(binaryImage) = desiredColor(1);
greenChannel(binaryImage) = desiredColor(2);
blueChannel(binaryImage) = desiredColor(3);
segmentedColorImage = cat(3,redChannel,greenChannel,blueChannel);

% Display Output
subplot(1,2,1), imshow(rgbImage);               title('Original Image');
subplot(1,2,2), imshow(segmentedColorImage);    title('Colored Image');