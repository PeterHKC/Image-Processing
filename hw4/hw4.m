clear;
clc;
close all;
% UI介面讓使用者選取一張全彩影像
[fileName, pathName , FilterIndex] = uigetfile({'*.jpg;*.jpeg;*.bmp;*.gif','All Image Files'; '*.*','All Files' },'叫匡拒紇钩┮戈Ж','MultiSelect', 'on');
filelist = [dir([pathName,'\*.jpg']);
dir([pathName,'\*.bmp'])];
addpath(pathName);
% 將輸入的影像轉成灰階
image = imread(fileName);
[h, w, z] = size(image);
if z > 1
    image = rgb2gray(image);
end
imwrite(image, 'gray.jpg');
% 撒雜訊
% arg1: 原始灰階影像
% arg2: 高斯雜訊的標準差平方
amp = 100;
gasim = gaussianNoise(image, amp);
imwrite(uint8(gasim), 'gaussianNoise.jpg');

% adaptive去雜訊
adaptive = adptiveLocal(gasim);
imwrite(uint8(adaptive),'adaptive.jpg');

% median去雜訊
mean = median(gasim);
imwrite(uint8(mean),'mean.jpg');
