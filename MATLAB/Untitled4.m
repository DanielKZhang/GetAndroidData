clear
clc
% »ìÏý¾ØÕó
load('matlab1.mat')
load('matlab2.mat')

len = 20
ma = zeros(len, len)

for i = 1 : len
   for j = 1 : 10 
        z = YPred(  (i-1) * 10 + j) 
        ma(i , z) = ma(i ,z ) + 1
   end
end
imagesc(ma)
colorbar

set(gca,'xtick',1: len)
set(gca,'ytick',1: len)