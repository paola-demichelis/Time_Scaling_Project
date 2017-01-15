# Time Scaling Project

Obiettivo
Speech time-scaling: allungare o accorciare la durata di un file audio senza alterare l’altezza (pitch) del suono, in funzione di un time-scaling-factor compreso tra 0.5 (dimezza la durata) e 2 (raddoppia la durata)

Approccio
" Time-scaling nel domino del tempo tramite la tecnica
Weighted Overlap and Add [Verhelst93]

 - Breve descrizione
 - Procedura di installazione
 - Esempio per “farlo girare”
 
 Step 1: create directory for loading all necessary file folders from MATLAB speech processing exercises (e.g., we create the directory ëmatlab_central_speechí); we define the full path to the chosen directory), e.g., 

path-to-speech= 'C:\data\matlab_central_speech'

Step 2: follow the instructions from the Read_Me file which is included within the folder for each of the speech processing exercises) 

Step 3: do the following: 

download (from Matlab Central File Exchange) and extract the following code folders and data folders into the directory of Step 1, using the following:

    -go to Matlab Central
    -click on File Exchange
    -type speech processing exercises in the search region
    - extract to the directory of Step 1 the following folders:

    	- functions_lrr
    	- speech_files
    	- highpass_filter_signal
    	- VQ
    	- cepstral coefficients
    	- isolated_digit_files
    	- GUI Lite v2.6 (soon to be available)

Step 4: download (from Matlab Central File Exchange) any or all of the folders for the set of speech processing exercises:

    -go to Matlab Central
    -click on File Exchange
    -type speech processing exercises in search menu
    -find any or all of the current set of 58 speech processing exercises and download them (one-at-a-time) to the directory of Step 1

Step 5: edit the file 'pathnew_matlab_central'
    -change the path-to-speech directory name to the one selected in Step 1
    -run the resulting pathnew_matlab_central file (this file must be run each time you log into Matlab)

The resulting 'pathnew_matlab_central' should look like the following (for a starting directory of ëC:\data\matlab_central_speech'):

