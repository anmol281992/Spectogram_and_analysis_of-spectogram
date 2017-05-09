% Anmol Monga : N18513543
function [] = plot_spectrogram(x_t,win_size,hop_size,win_type,fs,nfft)
overlap = win_size - hop_size;
if(strcmp(win_type,'rect'))
    win = ones(win_size,1);
elseif(strcmp(win_type,'hamm'))
    win = hamming(win_size);
elseif(strcmp(win_type,'black'))
    win = blackman(win_size);
end
[S,F,T] = spectrogram(x_t,win,overlap,nfft,fs);
imagesc(T,F,abs(S));
xlabel('time');
ylabel('frequency');
end