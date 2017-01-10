clear;
clc;
close all;
% UI����׌ʹ�����xȡһ��ȫ��Ӱ��
[fileName, pathName , FilterIndex] = uigetfile({'*.jpg;*.jpeg;*.bmp;*.gif','All Image Files'; '*.*','All Files' },'�п�ܼv���Ҧb��Ƨ�','MultiSelect', 'on');
filelist = [dir([pathName,'\*.jpg']);
dir([pathName,'\*.bmp'])];
addpath(pathName);
% ��ݔ���Ӱ���D�ɻ��A
image = imread(fileName);
[h, w, z] = size(image);
if z > 1
    image = rgb2gray(image);
end
imwrite(image, 'gray.jpg');
% ���sӍ
% arg1: ԭʼ���AӰ��
% arg2: ��˹�sӍ�Ę˜ʲ�ƽ��
amp = 100;
gasim = gaussianNoise(image, amp);
imwrite(uint8(gasim), 'gaussianNoise.jpg');

% adaptiveȥ�sӍ
adaptive = adptiveLocal(gasim);
imwrite(uint8(adaptive),'adaptive.jpg');

% medianȥ�sӍ
mean = median(gasim);
imwrite(uint8(mean),'mean.jpg');
