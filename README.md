# Time Scaling Project

## Breve descrizione
L'obiettivo di questo progetto è di allungare o accorciare la durata di un file audio senza alterare l’altezza (pitch) del suono, in funzione di un time-scaling-factor compreso tra 0.5 (dimezza la durata) e 2 (raddoppia la durata). Questo procedimento viene realizzato utilizzando un approccio di Time-scaling nel domino del tempo tramite la tecnica Waveform Similarity and Overlap Add (WSOLA) di Verhelst e Roelands.

## Setup
Scaricare il file del progetto.
Aprire MATLAB e scegliere Open dal menu' File: appare la finestra Open. 
Si apre il file seguendo il suo path;

## Esempio per “farlo girare”

```sh
%% Inizializzazione dei valori della funzione

clear all; 
close all; clc;
L = 240; 
S = L/2;
TSR = 0.5;
dk = 40;

%% Lettura audio in ingresso

[input_signal, Fs] = audioread('furelise.wav');
y_output = wsola_funzione(input_signal,TSR,L, dk, S);
L_tot = length(input_signal);
outlen = ceil(L_tot/TSR);

%% Ascolto

soundsc(y_output(1:outlen),Fs);

%% Salvataggio del file in uscita

audiowrite('audio.wav',y_output,Fs);

```

