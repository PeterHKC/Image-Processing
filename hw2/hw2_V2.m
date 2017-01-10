clear;
clc;
close all;
[fileName, pathName , FilterIndex] = uigetfile({'*.jpg;*.jpeg;*.bmp;*.gif','All Image Files'; '*.*','All Files' },'請選擇影像所在資料夾','MultiSelect', 'on');
filelist = [dir([pathName,'\*.jpg']);
dir([pathName,'\*.bmp'])];
addpath(pathName);

image1=double(imread(filelist(1).name));

loc1 = [207 99;74 487;1070 429;1122 729];
loc2 = [207 99;207 517;1088 99;1088 517];

[h w z] = size(image1);

M= get_transformation_matrix(loc1,loc2);

bb=[-500 2000 -1500 1000];

[stitch_im1] = stitch_M8(image1,M,bb);

figure,imagesc(stitch_im1);
axis image off;