% Digital Signal Processing
% Supervision 2
% Andreea Deac (aid25)
% Exercise 13
f = fopen('iq-fm-97M-3.6M.dat', 'r', 'ieee-le');
c = fread(f, [2,inf], '*float32');
fclose(f);
z = c(1,:) + j*c(2,:);
fs = 36e5;

figure;
spectrogram(z, 1024, [], [], fs);

f_shift = 1e6
dt = 1/fs;

shift = exp(2*pi*f_shift*j*dt* (1:size(z, 2)));
z = z .* shift;

figure;
spectrogram(z, 1024, [], [], fs)

fc = 2e5;
[b,a] = butter(4,fc/(fs/2));
z = filter(b,a,z);

figure;
spectrogram(z, 1024, [], [], fs)

s = angle(z(1:end-1) ./ z(2:end))/pi; % Here 'pi' is used for normalization

fc = 16e3; 
[b,a] = butter(4,fc/(fs/2)); 
s_filtered = filter(b,a,s);

s = s_filtered(1:75:end);
s = s/max(abs(s));

load handel.mat
Fs = 48e3
filename = 'exercise131.wav';
audiowrite(filename,s,Fs);
sound(s,Fs); 