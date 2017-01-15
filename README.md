# Time Scaling Project Titolo?

 - Breve descrizione
L'obiettivo di questo progetto è di allungare o accorciare la durata di un file audio senza alterare l’altezza (pitch) del suono, in funzione di un time-scaling-factor compreso tra 0.5 (dimezza la durata) e 2 (raddoppia la durata) utilizzando un approccio di Time-scaling nel domino del tempo tramite la tecnica Weighted Overlap and Add [Verhelst93].

 - Procedura di installazione
 Setup

In Matlab, change to the nctoolbox directory. For example,

cd ~/Documents/MATLAB/nctoolbox
Run the setup_nctoolbox.m function

setup_nctoolbox
This sets up nctoolbox for the current Matlab session only. You will need to add the follwing lines to your startup.m file if you would like nctoolbox automatically when you start Matlab:

% Edit '/Path/to/nctoolbox' to correct nctoolbox directory
addpath('/Path/To/nctoolbox')
setup_nctoolbo


% pathnew_matlab_central
%

% path-to-speech: starting directory definition
path-to-speech='C:\data\matlab_central_speech'

% paths to GUI toolkit
path(strcat(path-to-speech,'\gui_lite_2.6\GUI Lite v2.6'),path);

% paths to speech toolkit
path(strcat(path-to-speech,'\functions_lrr'),path);
path(strcat(path-to-speech,'\speech_files'),path);

% path to highpass filter mat files
path(strcat(path-to-speech,'\highpass_filter_signal'),path);

% path to cepstral coefficient training files
path(strcat(path-to-speech,'\VQ'),path);

% path to cepstral coefficients
path(strcat(path-to-speech,'\cepstral coefficients'),path);

% path to lrr isolated digit files set for training and testing
path(strcat(path-to-speech,'\isolated_digit_files\testing set'),path);
path(strcat(path-to-speech,'\isolated_digit_files\training set'),path);

 - Esempio per “farlo girare”
 
 Example: Deep Belief Network

function test_example_DBN
load mnist_uint8;

train_x = double(train_x) / 255;
test_x  = double(test_x)  / 255;
train_y = double(train_y);
test_y  = double(test_y);

%%  ex1 train a 100 hidden unit RBM and visualize its weights
rand('state',0)
dbn.sizes = [100];
opts.numepochs =   1;
opts.batchsize = 100;
opts.momentum  =   0;
opts.alpha     =   1;
dbn = dbnsetup(dbn, train_x, opts);
dbn = dbntrain(dbn, train_x, opts);
figure; visualize(dbn.rbm{1}.W');   %  Visualize the RBM weights

%%  ex2 train a 100-100 hidden unit DBN and use its weights to initialize a NN
rand('state',0)
%train dbn
dbn.sizes = [100 100];
opts.numepochs =   1;
opts.batchsize = 100;
opts.momentum  =   0;
opts.alpha     =   1;
dbn = dbnsetup(dbn, train_x, opts);
dbn = dbntrain(dbn, train_x, opts);

%unfold dbn to nn
nn = dbnunfoldtonn(dbn, 10);
nn.activation_function = 'sigm';

%train nn
opts.numepochs =  1;
opts.batchsize = 100;
nn = nntrain(nn, train_x, train_y, opts);
[er, bad] = nntest(nn, test_x, test_y);

assert(er < 0.10, 'Too big error');
