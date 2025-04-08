# ------------------
# filename: main.s |
# ------------------

.section .data	

# Supervisore -------------------------------------------
	supervisore: .string "2244"
# -------------------------------------------------------

# Codice pulizia terminale ------------------------------
	codice_pulizia: .byte 27, '[', '1', ';', '1', 'H', 27, '[', '2', 'J', 0
	codice_pulizia_len: .long .-codice_pulizia
# -------------------------------------------------------
   
# variabili per lo spostamento nel menu -----------------
	spostamento_menu: .space 64		
	freccia_su: .byte 'A'
	freccia_giu: .byte 'B'    	
	freccia_destra: .byte 'C'
# -------------------------------------------------------

# selezione voce del menu -------------------------------
	num_voci_menu: .long 6
	selezionato: .long 4
	selezione: .string  " > "
# -------------------------------------------------------
		
# Voci menu ----------------------------------------------
	titolo: .string "Setting Automobile "
				titolo_len = .-titolo 

	titolo_supervisore: .string "Setting Automobile (supervisor)"
	titolo_supervisore_len: .long .-titolo_supervisore

	voce1: .string "Data: "
			voce1_len = .-voce1 

	voce2: .string "Ora: "
			voce2_len = .-voce2 

	voce3: .string "Blocco automatico porte: "
			voce3_len = .-voce3 

	voce4: .string "Back-home: "
			voce4_len = .-voce4 

	voce5: .string "Check olio "
			voce5_len = .-voce5

	voce6: .string "Frecce direzione "
			voce6_len = .-voce6

	voce7: .string "Reset pressione gomme "
			voce7_len = .-voce7
# --------------------------------------------------------

# Valori menu --------------------------------------------    
	valore_titolo: .string "\n"
					valore_titolo_len = .-valore_titolo 

	valore_voce1: .string "15/06/2014\n"
				   valore_voce1_len = .-valore_voce1

	valore_voce2: .string "15:32\n"
				   valore_voce2_len = .-valore_voce2 

	valore_voce3: .string "ON\n"
				   valore_voce3_len = .-valore_voce3 

	valore_voce4: .string "ON\n"
				   valore_voce4_len = .-valore_voce4 

	valore_voce5: .string "\n"
				   valore_voce5_len = .-valore_voce5

	valore_voce6: .string "\n"
				   valore_voce6_len = .-valore_voce6

	valore_voce7: .string "\n"
				   valore_voce7_len = .-valore_voce7
# --------------------------------------------------------

# Array voci menu e valori menu --------------------------
	voci_menu: .long titolo, voce1, voce2, voce3, voce4, voce5, voce6, voce7
    voci_menu_len: .long titolo_len, voce1_len, voce2_len, voce3_len, voce4_len, voce5_len, voce6_len, voce7_len

    valori_menu: .long valore_titolo, valore_voce1, valore_voce2, valore_voce3, valore_voce4, valore_voce5, valore_voce6, valore_voce7
	valori_menu_len: .long valore_titolo_len, valore_voce1_len, valore_voce2_len, valore_voce3_len, valore_voce4_len, valore_voce5_len, valore_voce6_len, valore_voce7_len
# --------------------------------------------------------        

# ON/OFF -------------------------------------------------
	domanda_on_off: .string "Premi freccia su per ON e freccia giù per OFF, o invio per tornare al menu\n"
	domanda_on_off_len: .long .-domanda_on_off
	on_stringa: .string "ON\n"
	off_stringa: .string "OFF\n"
# --------------------------------------------------------

# Frecce di direzione ------------------------------------
	lampeggi_attuali: .string "Numero lampeggi attuali: "
	lampeggi_attuali_len: .long .-lampeggi_attuali
	num_lampeggi: .string "3"
	domanda_frecce: .string "\nInserisci il numero di lampeggi desiderato (2 min, 5 max), o invio per tornare al menu principale\n"
	domanda_frecce_len: .long .-domanda_frecce
# --------------------------------------------------------

# Reset pressione gomme ----------------------------------
	messaggio_gomme: .string "Pressione gomme resettata\n"
	messaggio_gomme_len: .long .-messaggio_gomme
	domanda_gomme: .string "Freccia a destra per resettare la pressione delle gomme, o invio per tornare al menu\n"
	domanda_gomme_len: .long .-domanda_gomme
	timespec: .long 0
			  .long 0
# --------------------------------------------------------

.section .text		
.global  _start

_start:
	movl $4, %eax
	movl $1, %ebx
	leal codice_pulizia, %ecx
	movl codice_pulizia_len, %edx
	int $0x80

	movl (%esp), %ecx			
	cmpl $1, %ecx     		   
	je menu_utente       		
	
	movl 8(%esp), %esi			
	leal supervisore, %edi 			
	cmpsl                       
	jne	menu_utente            

	movl $0, %esi
	movl $titolo_supervisore, %eax
	movl titolo_supervisore_len, %ebx
	movl %eax, voci_menu(%esi)
	movl %ebx, voci_menu_len(%esi)

	movl $8, num_voci_menu        

menu_utente:
	movl $0, %esi                        

# stampaggio del menu ---------------------------------------------------------------    
stampa_menu:
	movl $4, %eax					
	movl $1, %ebx	
	movl voci_menu(%esi), %ecx	
	movl voci_menu_len(%esi), %edx   	  	
	int	$0x80    

	movl $4, %eax					
	movl $1, %ebx	
	movl valori_menu(%esi), %ecx
	movl valori_menu_len(%esi), %edx       
    int	$0x80  

	movl $4, %eax					
	movl $1, %ebx					
	leal selezione, %ecx			
	movl $3, %edx					
	int	$0x80                  		 

	movl selezionato, %esi 
	movl $4, %eax					
	movl $1, %ebx	
	movl voci_menu(%esi), %ecx	
	movl voci_menu_len(%esi), %edx   	  	
	int	$0x80    

	movl $4, %eax					
	movl $1, %ebx	
	movl valori_menu(%esi), %ecx
	movl valori_menu_len(%esi), %edx       
    int	$0x80 
fine_stampa_menu:
# scanf delle frecce per spostarsi nel menu
	movl $0, spostamento_menu		
	
	movl $3, %eax					
	movl $1, %ebx
	movl $spostamento_menu, %ecx
	movl $128, %edx 
	int	$0x80  			    	     
         
	movl $4, %eax
	movl $1, %ebx
	leal codice_pulizia, %ecx
	movl codice_pulizia_len, %edx
	int $0x80  				
	
	movl $3, %esi                		
	movb spostamento_menu(%esi), %cl 	
	movb $10, %ch		  	
	cmpb %ch, %cl    			
	jne torna_stampa_menu             

	movl $2, %esi					  
	movb spostamento_menu(%esi), %bl

	cmpb %bl, freccia_su                        
	je salto_freccia_su
	cmpb %bl, freccia_giu                       
	je salto_freccia_giu
	cmpb %bl, freccia_destra                     
	je salto_freccia_destra                 

	jmp torna_stampa_menu

	salto_freccia_su:                               	
		subl $4, selezionato			
		cmpl $0, selezionato
		jne torna_stampa_menu		

		movl num_voci_menu, %eax
		movl $4, %ebx
		mull %ebx
		subl $4, %eax			
		movl %eax, selezionato	        	
		jmp torna_stampa_menu

	salto_freccia_giu:                             
		addl $4, selezionato			
		movl num_voci_menu, %eax
		movl $4, %ebx
		mull %ebx	
		cmpl %eax, selezionato
		jne	torna_stampa_menu	
			
		movl $4, selezionato
		jmp	torna_stampa_menu		

	salto_freccia_destra:
    	cmpl $12, selezionato               	
    	je salto_blocco_porte

    	cmpl $16, selezionato               	
    	je salto_back_home

    	cmpl $24, selezionato               	
    	je salto_frecce_direzione

    	cmpl $28, selezionato               	
    	je salto_reset_gomme

		jmp	torna_stampa_menu
# fine scanf frecce

torna_stampa_menu:
	xorl %ecx, %ecx                  	
	xorl %esi, %esi                  	

	jmp stampa_menu

	salto_blocco_porte:
		movl $12, %esi
		movl $4, %eax					
		movl $1, %ebx	
		movl voci_menu(%esi), %ecx
		movl voci_menu_len(%esi), %edx       
		int	$0x80  

		movl $4, %eax					
		movl $1, %ebx	
		movl valori_menu(%esi), %ecx
		movl valori_menu_len(%esi), %edx
		int	$0x80  

		movl $4, %eax					
		movl $1, %ebx	
		leal domanda_on_off, %ecx
		movl domanda_on_off_len, %edx       
		int	$0x80  

		movl $0, spostamento_menu		 
	
		movl $3, %eax					
		movl $1, %ebx
		movl $spostamento_menu, %ecx
		movl $128, %edx 
		int	$0x80  			    	     
			
		movl $4, %eax
		movl $1, %ebx
		leal codice_pulizia, %ecx
		movl codice_pulizia_len, %edx
		int $0x80  				
		
		movl $0, %esi                
		movb spostamento_menu(%esi), %cl 	
		movb $10, %ch		  	
		cmpb %ch, %cl    			
		je torna_stampa_menu

		movl $3, %esi                		
		movb spostamento_menu(%esi), %cl 	
		movb $10, %ch		  	
		cmpb %ch, %cl    			
		jne salto_blocco_porte            

		movl $2, %esi					  
		movb spostamento_menu(%esi), %bl

		cmpb %bl, freccia_su                     
		je salto_on_porte 

		cmpb %bl, freccia_giu                     
		je salto_off_porte  

			salto_on_porte:
			movl $12, %esi
			movl $on_stringa, %eax
			movl $4, %ebx
			movl %eax, valori_menu(%esi)
			movl %ebx, valori_menu_len(%esi)
			jmp salto_blocco_porte

			salto_off_porte:
			movl $12, %esi
			movl $off_stringa, %eax
			movl $5, %ebx
			movl %eax, valori_menu(%esi)
			movl %ebx, valori_menu_len(%esi)
			jmp salto_blocco_porte
	
	salto_back_home:
		movl $16, %esi
		movl $4, %eax					
		movl $1, %ebx	
		movl voci_menu(%esi), %ecx
		movl voci_menu_len(%esi), %edx       
		int	$0x80  

		movl $4, %eax					
		movl $1, %ebx	
		movl valori_menu(%esi), %ecx
		movl valori_menu_len(%esi), %edx
		int	$0x80  

		movl $4, %eax					
		movl $1, %ebx	
		leal domanda_on_off, %ecx
		movl domanda_on_off_len, %edx       
		int	$0x80  

		movl $0, spostamento_menu		 
	
		movl $3, %eax					
		movl $1, %ebx
		movl $spostamento_menu, %ecx
		movl $128, %edx 
		int	$0x80  			    	     
			
		movl $4, %eax
		movl $1, %ebx
		leal codice_pulizia, %ecx
		movl codice_pulizia_len, %edx
		int $0x80  				
		
		movl $0, %esi                
		movb spostamento_menu(%esi), %cl 	
		movb $10, %ch		  	
		cmpb %ch, %cl    			
		je torna_stampa_menu

		movl $3, %esi                		
		movb spostamento_menu(%esi), %cl 	
		movb $10, %ch		  	
		cmpb %ch, %cl    			
		jne salto_back_home             

		movl $2, %esi					  
		movb spostamento_menu(%esi), %bl

		cmpb %bl, freccia_su                     
		je salto_on_back  

		cmpb %bl, freccia_giu                     
		je salto_off_back  

			salto_on_back:
			movl $16, %esi
			movl $on_stringa, %eax
			movl $4, %ebx
			movl %eax, valori_menu(%esi)
			movl %ebx, valori_menu_len(%esi)
			jmp salto_back_home

			salto_off_back:
			movl $16, %esi
			movl $off_stringa, %eax
			movl $5, %ebx
			movl %eax, valori_menu(%esi)
			movl %ebx, valori_menu_len(%esi)
			jmp salto_back_home
		
		jmp salto_back_home

	salto_frecce_direzione:
		movl $24, %esi
		movl $4, %eax					
		movl $1, %ebx	
		movl voci_menu(%esi), %ecx
		movl voci_menu_len(%esi), %edx
		int $0x80

		movl $4, %eax					
		movl $1, %ebx	
		movl valori_menu(%esi), %ecx
		movl valori_menu_len(%esi), %edx
		int	$0x80  

		movl $4, %eax					
		movl $1, %ebx	
		leal lampeggi_attuali, %ecx
		movl lampeggi_attuali_len, %edx
		int	$0x80 
		
		movl $4, %eax					
		movl $1, %ebx	
		leal num_lampeggi, %ecx
		movl $1, %edx
		int	$0x80 

		movl $4, %eax					
		movl $1, %ebx	
		leal domanda_frecce, %ecx
		movl domanda_frecce_len, %edx
		int	$0x80 
		
		movl $0, spostamento_menu		 
	
		movl $3, %eax					
		movl $1, %ebx
		movl $spostamento_menu, %ecx
		movl $128, %edx 
		int	$0x80  			    	     
			
		movl $4, %eax
		movl $1, %ebx
		leal codice_pulizia, %ecx
		movl codice_pulizia_len, %edx
		int $0x80  				
		
		movl $0, %esi                
		movb spostamento_menu(%esi), %cl 	
		movb $10, %ch		  	
		cmpb %ch, %cl    			
		je torna_stampa_menu

		movl $1, %esi	          
		movb spostamento_menu(%esi), %cl 	
		movb $10, %ch		  	
		cmpb %ch, %cl    			
		jne maggiore_di_cinque

		# convertiamo da ascii a numero 
		movb spostamento_menu, %cl
		subb $48, %cl

		movb $2, %ch
		cmpb %ch, %cl
		jle minore_di_due

		movb $3, %ch
		cmpb %ch, %cl
		je tre

		movb $4, %ch
		cmpb %ch, %cl
		je quattro
		
		movb $5, %ch
		cmpb %ch, %cl
		jge maggiore_di_cinque

		addb $48, %cl
		movb %cl, num_lampeggi

		jmp salto_frecce_direzione

			minore_di_due:
			movb $2, %ch
			addb $48, %ch
			movb %ch, num_lampeggi
			jmp salto_frecce_direzione

			tre:
			movb $3, %ch
			addb $48, %ch
			movb %ch, num_lampeggi
			jmp salto_frecce_direzione

			quattro:
			movb $4, %ch
			addb $48, %ch
			movb %ch, num_lampeggi
			jmp salto_frecce_direzione

			maggiore_di_cinque:
			movb $5, %ch
			addb $48, %ch
			movb %ch, num_lampeggi
			jmp salto_frecce_direzione
		
		jmp salto_frecce_direzione
    
	salto_reset_gomme:
		movl $28, %esi
		movl $4, %eax					
		movl $1, %ebx	
		movl voci_menu(%esi), %ecx
		movl voci_menu_len(%esi), %edx       
		int	$0x80  

		movl $4, %eax					
		movl $1, %ebx	
		movl valori_menu(%esi), %ecx
		movl valori_menu_len(%esi), %edx
		int	$0x80  

		movl $4, %eax					
		movl $1, %ebx	
		leal domanda_gomme, %ecx
		movl domanda_gomme_len, %edx       
		int	$0x80  

		movl $0, spostamento_menu		
	
		movl $3, %eax					
		movl $1, %ebx
		movl $spostamento_menu, %ecx
		movl $128, %edx 
		int	$0x80  			    	     
			
		movl $4, %eax
		movl $1, %ebx
		leal codice_pulizia, %ecx
		movl codice_pulizia_len, %edx
		int $0x80  				
		
		movl $0, %esi                
		movb spostamento_menu(%esi), %cl 	
		movb $10, %ch		  	
		cmpb %ch, %cl    			
		je torna_stampa_menu

		movl $3, %esi                		
		movb spostamento_menu(%esi), %cl 	
		movb $10, %ch		  	
		cmpb %ch, %cl    			
		jne salto_reset_gomme             	

		movl $2, %esi					 
		movb spostamento_menu(%esi), %bl

		cmpb %bl, freccia_destra                     
		je salto_freccia_destra_gomme                 

		jmp salto_reset_gomme

		salto_freccia_destra_gomme:
			movl $4, %eax					
			movl $1, %ebx	
			leal messaggio_gomme, %ecx
			movl messaggio_gomme_len, %edx
			int	$0x80 

			movl $1, timespec
			movl $162, %eax
			movl $timespec, %ebx
			int $0x80

			movl $4, %eax
			movl $1, %ebx
			leal codice_pulizia, %ecx
			movl codice_pulizia_len, %edx
			int $0x80

			jmp torna_stampa_menu

# fine programma
	movl $1, %eax
	movl $0, %ebx
	int $0x80
