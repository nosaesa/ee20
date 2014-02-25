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
h = zeros(1,L);
% Fill in the values of h[n] determined by your design.
% e.g. if h[n] = delta[n - 2] + 4*delta[n - 3], you would have:
% h(3) = 1;
% h(4) = 4;

% Filtering the corrupted signal via convolution:
out1 = conv(y1,h);

%% Listen to the cleaned up signal:
sound(out1,fs)

%% Section 4.3, Random Noise

%% Listen to the corrupt song
sound(y2,fs)

%% Optional: try filtering with the same filter as before
out2 = conv(y2,h);
sound(out2,fs)

%%  Let's clean it up!
% Determine the B and A coefficients from System 4's LCCDE and put them
% here:
out3 = filter(B,A,y2);

%% Listen to the "cleaned up" signal...
sound(out3,fs)

