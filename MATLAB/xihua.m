
close all;clear all;clc;  %�ر�����ͼ�δ��ڣ���������ռ����б��������������
p=imread('img011-012.png');
p = rgb2gray(p);
I1  = imbinarize(p);
% I1 = p;
figure
I2=bwmorph(I1,'skel', Inf);
imshow(I2);
figure
I3=bwmorph(I1,'thin',Inf);
imshow(I3);