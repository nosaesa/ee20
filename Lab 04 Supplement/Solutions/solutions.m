% Make sure this script is in the same directory as the files y1.mat and
% y2.mat.
load('y1.mat');
load('y2.mat');
L = length(y1);

% Don't change this! (sampling rate, will be explained later in the course)
fs = 11025;

% You can run code enclosed in a cell (a section that begins/ends with %%)
% by hitting Ctrl+Enter. Hit Ctrl+C in the command window to stop the code
% (in case you don't want to listen to the whole song).

%% Section 4.1, A Single Tone

%% Listen to the corrupt song
sound(y1,fs)

%% Let's clean it up!
N = 3;
a = -1;
h = zeros(1,L);
h(1) = 1;
h(N + 1) = a;

% Filtering the corrupted signal via convolution:
out1 = conv(y1,h);

%% Listen to the cleaned up signal:
sound(out1,fs)

%% The "Hack" Method
% FFT is a fast algorithm for computing the Fourier Transform.
spectrum = fft(y1);
% Since we know there is only one offending noise frequency and we see from
% plotting the spectrum that it is stronger than anything else in the
% signal, we can simply find the exact noise frequency, "delete" its
% contribution to the spectrum of the signal, and reconstruct:
noise_freq = find(abs(spectrum) == max(abs(spectrum)));
spectrum(noise_freq) = 0;
noiseless = ifft(spectrum);
sound(noiseless,fs)

%% Section 4.3, Random Noise

%% Listen to the corrupt song
sound(y2,fs)

%% Optional: try filtering with the same filter as before
out2 = conv(y2,h);
sound(out2,fs)

%%  Let's clean it up!
B = [.5 .5];
A = [1 -.5];
out3 = filter(B,A,y2);

%% Listen to the "cleaned up" signal...
sound(out3,fs)
