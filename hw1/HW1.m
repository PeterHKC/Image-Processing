%img1 = imread('1.jpg');
%img2 = imread('2.jpg');
%img3 = imread('3.jpg');
img1 = imread('_MG_3744.JPG');
img2 = imread('_MG_3745.JPG');
img3 = imread('_MG_3746.JPG');

result = (img2/3 + img3/3 + img1/3);
temp1 = [img1;img2];
temp2 = [img3;result];
im = [temp1 temp2];
imshow(im);
imwrite(result,'result.jpg');
