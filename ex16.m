% Digital Signal Processing
% Supervision 2
% Andreea Deac (aid25)
% Exercise 16 - b)

[y, fs] = audioread('touchtone.wav');
spectrogram(y, 1024, 256);