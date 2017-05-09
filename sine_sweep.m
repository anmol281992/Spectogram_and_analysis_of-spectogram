% Anmol Monga : N18513543
function x_t = sine_sweep(f_min, f_max, fs, duration, a)
f_min1 = log10(f_min);
f_max1 = log10(f_max);
N = duration*fs;%length
v = logspace(f_min1,f_max1,N);
x_t = a.*(sin(cumsum(2*pi*v/fs)));


end