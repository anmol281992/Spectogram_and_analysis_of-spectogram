% Anmol Monga : N18513543
function [S,F,T] = my_spectrogram(x_t,win_size,hop_size,win_type,fs,nfft)
overlap = win_size - hop_size;
size_x = length(x_t);
Y = buffer(x_t,win_size,overlap);
[n,m] = size(Y);

if(strcmp(win_type,'rect'))
    win = ones(win_size,1);
elseif(strcmp(win_type,'hamm'))
    win = hamming(win_size);
elseif(strcmp(win_type,'black'))
    win = blackman(win_size);
end

winmat = repmat(win,1,m);
mat = winmat.*Y;
mat = padarray(mat,[(nfft-win_size) 0],'post');
DFTMAT= dftmtx(nfft);
fftword  = DFTMAT*mat;
fftword = fftword(1:(nfft/2+1),:);
S = fftword;
F = 0:fs/(2*nfft):fs/2;
T = 0:win_size/fs:(size_x-1)/fs;

end