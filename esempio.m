%% Setup

clear all; 
close all; clc;

L = 240; 
S = L/2;
TSR = 0.5;
dk = 40;

%% Lettura segnale in ingresso

[input_signal, Fs] = audioread('speech.wav');
[pathstr,name,ext] = fileparts('speech.wav'); 
y_output = wsola_funzione(input_signal,TSR,L, dk, S);
L_tot = length(input_signal);
outlen = ceil(L_tot/TSR);

%% Ascolto

soundsc(y_output(1:outlen),Fs);

%% Salvataggio segnale in uscita

str1 = name;
str2 = num2str(TSR);
str = strcat(str1,'_', str2, ext);
audiowrite(str,y_output,Fs);
