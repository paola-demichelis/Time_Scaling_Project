# Time Scaling Project

## Breve descrizione
L'obiettivo di questo progetto è di allungare o accorciare la durata di un file audio senza alterare l’altezza (pitch) del suono, in funzione di un time-scaling-factor compreso tra 0.5 (dimezza la durata) e 2 (raddoppia la durata) utilizzando un approccio di Time-scaling nel domino del tempo tramite la tecnica Weighted Overlap and Add [Verhelst93].

## Setup

In Matlab, change to the nctoolbox directory. For example,

 cd~/Documents/MATLAB/nctoolbox
Run the setup_nctoolbox.m function>

setup_nctoolbox
This sets up nctoolbox for the current Matlab session only. You will need to add the follwing lines to your startup.m file if you would like nctoolbox automatically when you start Matlab:

## Esempio per “farlo girare”

```sh
%% Inizializzazione dei valori della funzione

clear all; 
close all; clc;
L = 240; 
S = L/2;
TSR = 0.5;
dk = 40;

%% Lettura dell'audio in ingresso

[input_signal, Fs] = audioread('furelise.wav');
y_output = wsola_funzione(input_signal,TSR,L, dk, S);
L_tot = length(input_signal);
outlen = ceil(L_tot/TSR);

%% Ascolto

soundsc(y_output(1:outlen),Fs);

%% Salvataggio del file in output

audiowrite('audio.wav',y_output,Fs);

```

