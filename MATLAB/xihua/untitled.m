Isrc = imread('img011-012.png');

if ndims(Isrc) == 3
    I = rgb2gray(Isrc);
else
    I = Isrc;
end

I = 255 - I;
I = im2bw(I,0.5);
%外围扩展边界
[H,W] = size(I);
I = [zeros(2,W);I;zeros(2,W)];
I = [zeros(H+4,2),I,zeros(H+4,2)];
[H,W] = size(I);

for k = 1:1000 %迭代次数
p = zeros(8,1);
NzI = zeros(H,W);
ZI = zeros(H,W);
P024I = zeros(H,W);
P246I = zeros(H,W);
I2 = I;
for i = 2:H-1
    for j = 2:W-1
        if I(i,j) 
        p(1) = I(i,j+1);
        p(2) = I(i-1,j+1);
        p(3) = I(i-1,j);
        p(4) = I(i-1,j-1);
        p(5) = I(i,j-1);
        p(6) = I(i+1,j-1);
        p(7) = I(i+1,j);
        p(8) = I(i+1,j+1);

        NzI(i,j) = sum(p);
        ZI(i,j) = sum(abs(diff(p)))+abs(p(8)-p(1));

        P024I(i,j) = p(1) * p(3) * p(5);
        P246I(i,j) = p(3) * p(5) * p(7);
        end
    end
end
for i = 3:H-1
    for j = 3:W-1
        if I(i,j)
        if ((NzI(i,j) >= 2) && (NzI(i,j) <= 6)) && ...
             (ZI(i,j) == 2) && ...
             ((P024I(i,j)==0)||(ZI(i,j-1)~=2)) && ...
             ((P246I(i,j)==0)||(ZI(i-1,j)~=2)) 

         I2(i,j) = 0;  
        end 

        end
    end
end
I = I2;
end
figure(1);
subplot(121);
imshow(Isrc);
subplot(122);
imshow(I2);
