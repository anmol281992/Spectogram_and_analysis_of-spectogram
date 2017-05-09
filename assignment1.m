% Anmol Monga : N18513543
%% q(a) - default
N = 128;
hopsize = N/2;
windowsize = N;
fftlength = N;
fs = 44100;
f_max = 5000;
f_min = 500;
a = 0.95;
duration = 1;
x = sine_sweep(f_min, f_max, fs, duration, a);
win_type = 'rect';
nfft = N;
[S,F,T] = my_spectrogram(x,windowsize,hopsize,win_type,fs,nfft);

imagesc(T,F,abs(S));
xlabel('time');
ylabel('frequency');

%% Q(b) 
% window size = 256
N = 256;
hopsize = N/2;
windowsize = N;
fftlength = N;
fs = 44100;
f_max = 5000;
f_min = 500;
a = 0.95;
duration = 1;
x = sine_sweep(f_min, f_max, fs, duration, a);
win_type = 'rect';
nfft = N;
figure(1);
[S,F,T] = my_spectrogram(x,windowsize,hopsize,win_type,fs,nfft);
figure(1);
subplot(1,3,1);
imagesc(T,F,abs(S));
title('N=256');
xlabel('time');
ylabel('frequency');
% N= 512

N = 512;
hopsize = N/2;
windowsize = N;
fftlength = N;
fs = 44100;
f_max = 5000;
f_min = 500;
a = 0.95;
duration = 1;
x = sine_sweep(f_min, f_max, fs, duration, a);
win_type = 'rect';
nfft = N;

[S,F,T] = my_spectrogram(x,windowsize,hopsize,win_type,fs,nfft);
subplot(1,3,2);
imagesc(T,F,abs(S));xlabel('time');
title('N=512');
xlabel('time');

ylabel('frequency');

% N = 1024
N = 1024;
hopsize = N/2;
windowsize = N;
fftlength = N;
fs = 44100;
f_max = 5000;
f_min = 500;
a = 0.95;
duration = 1;
x = sine_sweep(f_min, f_max, fs, duration, a);
win_type = 'rect';
nfft = fftlength;

[S,F,T] = my_spectrogram(x,windowsize,hopsize,win_type,fs,nfft);
subplot(1,3,3);
imagesc(T,F,abs(S));
title('N=1024');
xlabel('time');
ylabel('frequency');
%% Q(c)
N = 256;
windowsize = N;
fftlength = N;
fs = 44100;
f_max = 5000;
f_min = 500;
a = 0.95;
duration = 1;
x = sine_sweep(f_min, f_max, fs, duration, a);
win_type = 'rect';
nfft = N;
hopsize = N/4;
figure(2)

[S,F,T] = my_spectrogram(x,windowsize,hopsize,win_type,fs,nfft);
subplot(1,3,1);
imagesc(T,F,abs(S));
title('h = N/4');
xlabel('time');
ylabel('frequency');

hopsize = N/16;
subplot(1,3,2);
[S,F,T] = my_spectrogram(x,windowsize,hopsize,win_type,fs,nfft);
imagesc(T,F,abs(S));
title('h = N/16');
xlabel('time');
ylabel('frequency');

hopsize = N/32;
subplot(1,3,3);
[S,F,T] = my_spectrogram(x,windowsize,hopsize,win_type,fs,nfft);
imagesc(T,F,abs(S));
title('h = N/32');
xlabel('time');
ylabel('frequency');
%% Q(d)
N = 128;
windowsize = N;
fftlength = N;
fs = 44100;
f_max = 5000;
f_min = 500;
a = 0.95;
duration = 1;
x = sine_sweep(f_min, f_max, fs, duration, a);
win_type = 'rect';
nfft = N;
figure(5);

[S,F,T] = my_spectrogram(x,windowsize,hopsize,win_type,fs,nfft);
subplot(1,3,1);
imagesc(T,F,abs(S));
title('rect');
xlabel('time');
ylabel('frequency');
win_type = 'hamm';
nfft = N;

[S,F,T] = my_spectrogram(x,windowsize,hopsize,win_type,fs,nfft);
subplot(1,3,2);
imagesc(T,F,abs(S));
title('hamming');
xlabel('time');
ylabel('frequency');
win_type = 'black';

[S,F,T] = my_spectrogram(x,windowsize,hopsize,win_type,fs,nfft);
subplot(1,3,3);
imagesc(T,F,abs(S));
title('blackmann');
xlabel('time');
ylabel('frequency');
%% Q(e)
N = 256;
windowsize = N;
fftlength = N;
fs = 44100;
f_max = 5000;
f_min = 500;
a = 0.95;
duration = 1;

x = sine_sweep(f_min, f_max, fs, duration, a);
win_type = 'rect';
nfft = 2*N;
figure(6)
subplot(1,3,1);
[S,F,T] = my_spectrogram(x,windowsize,hopsize,win_type,fs,nfft);

imagesc(T,F,abs(S));
title('nfft = 2*N');
xlabel('time');
ylabel('frequency');

nfft = 4*N;
subplot(1,3,2);
[S,F,T] = my_spectrogram(x,windowsize,hopsize,win_type,fs,nfft);
imagesc(T,F,abs(S));
title('nfft = 4*N');
xlabel('time');
ylabel('frequency');
nfft = 8*N;
subplot(1,3,3);
[S,F,T] = my_spectrogram(x,windowsize,hopsize,win_type,fs,nfft);
imagesc(T,F,abs(S));
title('nfft = 8*N');
xlabel('time');
ylabel('frequency');
%% q(f) - implementation_ using spectrogram or my_spectrogram
N = 128;
hopsize = N/2;
windowsize = N;
fftlength = N;
fs = 44100;
f_max = 5000;
f_min = 500;
a = 0.95;
duration = 1;
x = sine_sweep(f_min, f_max, fs, duration, a);
win_type = 'rect';
nfft = N;
figure(6)
subplot(1,2,1)
[S,F,T] = my_spectrogram(x,windowsize,hopsize,win_type,fs,nfft);
imagesc(T,F,abs(S));
title('using my spectrogram function');
xlabel('time');
ylabel('frequency');
subplot(1,2,2)
plot_spectrogram(x,windowsize,hopsize,win_type,fs,nfft);
title('matlab - spectrogram function');



