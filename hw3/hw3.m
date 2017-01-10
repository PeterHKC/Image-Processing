clear;
clc;
close all;
[fileName, pathName , FilterIndex] = uigetfile({'*.jpg;*.jpeg;*.bmp;*.gif','All Image Files'; '*.*','All Files' },'請選擇影像所在資料夾','MultiSelect', 'on');
filelist = [dir([pathName,'\*.jpg']);
dir([pathName,'\*.bmp'])];
addpath(pathName);

image = imread(filelist(1).name);
im = rgb2gray(image);
imwrite(im, 'gray.jpg');

sobel_Result = sobel(im);
sobel_norm = normc(sobel_Result);
imwrite(sobel_Result, 'sobel.jpg');
laplcian_Result = laplacian(im);
imwrite(laplcian_Result, 'laplacian.jpg');

result1 = sobel_norm.*laplcian_Result;
imwrite(result1, 'sobelAndlaplcian.jpg');

result2 = result1 + double(im);
imshow(uint8(result2));
imwrite(uint8(result2), 'result.jpg');