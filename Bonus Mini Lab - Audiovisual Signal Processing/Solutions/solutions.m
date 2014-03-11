% Use sound(x,fs) to listen to a 1D array x (either column or row, it
% doesn't matter). Don't change the variable fs until you've deciphered the
% message. Once you're finished, try playing around with the sampling
% rate (e.g. sound(x,fs/2), sound(x,2*fs), etc...). What's going on?!?
% This will make sense when you cover sampling of continuous time signals.

load('audio_image.mat')
imshow(av_matrix)
fs = 8192;
signal = av_matrix(:,10:50:end);
signal = signal(:);
sound(signal,fs)