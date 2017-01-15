function [output_signal] =wsola_funzione(input_signal,TSR,L, dk, S);

%% Setup
win = hanning (L, 'periodic');
L_tot = length(input_signal);

Sout = S;
Sin = round(S*TSR);  % Es: TSR=0.5 prendo più campioni quindi intervalli + piccoli
pin=0; 
pout=0; 

outlen = ceil(L_tot/TSR);  %lunghezza output> input (0.5 rallentato)
output_signal = zeros(outlen,1);

%% codice per primo frame (per cui non posso effettuare la ricerca con dk)

output_signal(1:L)=input_signal(1:L).*win;
pin_rif = S; 

%% confronto dal secondo frame 
while ( ((pin_rif + L) <= L_tot ) & ((pin+L+dk+Sin) <= L_tot) ) %sia la fine del frame di riferimento sia la fine del frame di analisi non superano le dimensioni deel'input
 
    pin = pin+Sin;
    pout = pout + Sout;
    
    rif_frame = input_signal(pin_rif:pin_rif+L-1);
    confronto_frame = input_signal (pin-dk: pin+L+dk-1);
    
    r = xcorr (confronto_frame, rif_frame);
    l_confronto=length(confronto_frame);
    l_r=length(r);
    
    if(r==zeros(l_r, 1))
        pin_ok = pin;
   
    else
    m=find(r == max(r(l_confronto:l_confronto+2*dk)));
    max1=m-l_confronto+1;  %compensa indici (in xcorr c'è uno shift di "l_confronto")-> elimina le posizioni prima della sovrapposizione 
    pin_ok = pin-dk+max1;
    end;
    
    analysis_frame = input_signal(pin_ok:pin_ok + L-1);  
	output_signal(pout:pout+L-1) = output_signal(pout:pout+L-1) + analysis_frame.* win;  

    pin_rif=pin_ok+S;
   
end;
