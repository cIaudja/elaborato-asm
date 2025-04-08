# asm_elaborato

Questo progetto riguarda l'elaborato di Assembly per il corso di Architettura degli Elaboratori, Università di Verona (aa. 2022-2023).

## Struttura del Progetto

- `src/`: Contiene il file sorgente in Assembly `elaborato.s` e il file `elaborato.c`.
- `bin/`: Cartella contenente l'output compilato del programma.
- `obj/`: Cartella contenente i file oggetto generati durante la compilazione.
- `Makefile`: Il Makefile per compilare il progetto.
- `relazione.pdf`: La relazione del progetto, che include le specifiche, il funzionamento della FSM, del database e l'ottimizzazione.

## Come Eseguire il Programma

1. **Ambiente di Sviluppo**:  
   Per eseguire questo progetto, è consigliato utilizzare un sistema operativo Linux o una macchina virtuale Linux. Se non hai accesso a una macchina virtuale o a Linux, puoi comunque provare a far funzionare il progetto su un sistema diverso, ma la compilazione e l'esecuzione potrebbero non funzionare come previsto.

2. **Compilazione su Linux o Mac (con strumenti di sviluppo installati)**:  
   Se stai usando Linux o hai un ambiente virtuale con Linux, esegui i seguenti comandi:

   1. Apri il terminale.
   2. Naviga fino alla cartella del progetto:
   
      ```bash
      cd /percorso/della/cartella/asm_elaborato
      ```

   3. Esegui il comando `make` per compilare il programma:
   
      ```bash
      make
      ```

   4. Una volta compilato, esegui il programma con il comando:
   
      ```bash
      ./bin/elaborato
      ```

3. **Funzionalità**:  
   La funzionalità di questo progetto è equivalente a quella in C. Se preferisci, puoi utilizzare il programma in C invece di quello in Assembly, ma la logica e i risultati finali saranno gli stessi.

## Dettagli di Compilazione

- Il Makefile compila il file sorgente `elaborato.s` in un file oggetto, quindi collega il file oggetto per creare l'eseguibile `elaborato`.
- Il comando `make` esegue tutte le operazioni di compilazione automaticamente.

## Pulizia

Per rimuovere i file generati (file oggetto e binari), esegui:

```bash
make clean
