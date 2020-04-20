clc
clear 
im = imread('img011-012.png');
imwrite( im , 'img.png')

imshow(im)

figure
imNose = imnoise( im , "gaussian", 0,0.02);
imshow(imNose)

% h=fspecial('sobel');%sobel水平边缘增强滤波器
% h=fspecial('gaussian');%高斯低通滤波器
% h=fspecial('laplacian');%拉普拉斯滤波器
% h=fspecial('log');%高斯拉普拉斯（LoG）滤波器
% h=fspecial('average');%均值滤波器

figure
imhist(im);
figure
imhist(imNose)

g = rgb2gray( im)
figure
imshow(g)