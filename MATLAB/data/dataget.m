clc
clear
a1 = textread('a1.txt')
subplot(1, 4 ,1)
plot([1 : 1 : 18].*0.2 , a1)
title('a')
xlabel("t/s")
ylabel("d/mm")

b1 = textread('b1.txt')
subplot(1, 4 ,2)
plot(  [1:1:32].*0.2 ,b1)
title('b')
xlabel("t/s")
ylabel("d/mm")


c1 = textread('c1.txt')
subplot(1, 4 ,3)
plot( [1 : 1 : 16] .* 0.2,c1)
title('c')
xlabel("t/s")
ylabel("d/mm")



d1 = textread('d1.txt')
subplot(1, 4 ,4)
plot([1:1:21].* 0.2 ,d1)
title('d')
xlabel("t/s")
ylabel("d/mm")





