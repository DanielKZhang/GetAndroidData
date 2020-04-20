clc
clear 
im = imread('img011-012.png');
imwrite( im , 'img.png')

imshow(im)

figure
imNose = imnoise( im , "gaussian", 0,0.02);
imshow(imNose)

% h=fspecial('sobel');%sobelˮƽ��Ե��ǿ�˲���
% h=fspecial('gaussian');%��˹��ͨ�˲���
% h=fspecial('laplacian');%������˹�˲���
% h=fspecial('log');%��˹������˹��LoG���˲���
% h=fspecial('average');%��ֵ�˲���

figure
imhist(im);
figure
imhist(imNose)

g = rgb2gray( im)
figure
imshow(g)