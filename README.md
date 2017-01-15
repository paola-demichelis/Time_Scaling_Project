# Time Scaling Project

## Breve descrizione
L'obiettivo di questo progetto è di allungare o accorciare la durata di un file audio senza alterare l’altezza (pitch) del suono, in funzione di un time-scaling-factor compreso tra 0.5 (dimezza la durata) e 2 (raddoppia la durata). Questo procedimento viene realizzato utilizzando un approccio di Time-scaling nel domino del tempo tramite la tecnica Waveform Similarity and Overlap Add (WSOLA) di Verhelst e Roelands.

## Setup
Scaricare il file del progetto.
Aprire MATLAB e scegliere 'Open' dal menu' File: appare la finestra Open da cui si può aprire il file seguendo il suo path.
Nella cartella è presente un script 'esempio.m' in cui viene richiamata la funzione, inoltre è anche possibile cambiare i parametri e scegliere una diversa traccia audio. Una volta lanciato il programma, viene creato un nuovo segnale audio scalato nel tempo e salvato con nome del file originale seguito dal fattore di scalamento.

## Esempio”

```sh
%% Setup

clear all; 
close all; clc;

L = 240; 
S = L/2;
TSR = 0.5;
dk = 40;

%% Lettura del segnale in input

[input_signal, Fs] = audioread('speech.wav');
[pathstr,name,ext] = fileparts('speech.wav'); 
y_output = wsola_funzione(input_signal,TSR,L, dk, S);
L_tot = length(input_signal);
outlen = ceil(L_tot/TSR);

%% Ascolto

soundsc(y_output(1:outlen),Fs);

%% Salvataggio del file output

str1 = name;
str2 = num2str(TSR);
str = strcat(str1,'_', str2, ext);
audiowrite(str,y_output,Fs);
```

