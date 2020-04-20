Fs= 48000;
fileId = fopen('audioRecord.pcm','r');
x = fread(fileId,inf,'int16');
% sound(x,Fs);

fileId2 = fopen('audioRecordLeft.pcm','r');
y = fread(fileId2,inf,'int16');
% sound(y,Fs);

fileId3 = fopen('audioRecordRight.pcm','r');
z = fread(fileId3,inf,'int16');
% sound(z,Fs);

yy = fft(y( 1 : Fs*1))
yy = abs(yy)
zz = fft(z( 1 : Fs*1))
zz = abs(zz)

keMin = fs / 38080;
ke = 0 : keMin : keMin * 8000
figure(1)
plot(x)
figure(2)
plot(y)
figure(3)
plot(z)
figure(4)
plot(yy)
figure(5)
plot(zz)

aa = audioread('audioRecord_handler.wav')
bb = fft(aa)
bb = abs(bb)
% figure(6)
% plot(bb)