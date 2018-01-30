% Digital Signal Processing
% Supervision 2
% Andreea Deac (aid25)
% Exercise 12

f = fopen('iq-fm-96M-240k.dat', 'r', 'ieee-le');
c = fread(f, [2,inf], '*float32');
fclose(f);
z = c(1,:) + j*c(2,:);

s = angle(z(1:end-1) ./ z(2:end))/pi; % Here 'pi' is used for normalization

fc = 16e3;
fs = 24e4;
[b,a] = butter(4,fc/(fs/2));
s_filtered = filter(b,a,s);

s = s_filtered(1:5:end);
s = s/max(abs(s));



load handel.mat
Fs = 48e3
filename = 'exercise12.wav';
audiowrite(filename,s,Fs);
%sound(s,Fs);