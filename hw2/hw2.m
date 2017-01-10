clear;
clc;
close all;
[fileName, pathName , FilterIndex] = uigetfile({'*.jpg;*.jpeg;*.bmp;*.gif','All Image Files'; '*.*','All Files' },'請選擇影像所在資料夾','MultiSelect', 'on');
filelist = [dir([pathName,'\*.jpg']);
dir([pathName,'\*.bmp'])];
addpath(pathName);

image1=double(imread(filelist(1).name));
image2=double(imread(filelist(2).name));

[h w z] = size(image1);

[im2_loc im1_loc]= match(filelist(2).name, filelist(1).name);
[M A B] = get_affined_matrix(im2_loc,im1_loc);

bb=[-400 1200 -200 800];

[stitch_im1 U V]= stitch(image1,eye(3),bb);
[stitch_im2 U V] = stitch(image2,M,bb);

%figure,imagesc(stitch_im1);
figure,imagesc(max(stitch_im2,stitch_im1));
axis image off;
