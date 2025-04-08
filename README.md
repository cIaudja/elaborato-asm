# asm_elaborato

Questo progetto riguarda l'elaborato di Assembly per il corso di Architettura degli Elaboratori, Università di Verona (aa. 2022-2023).

## Struttura del Progetto

- `src/`: Contiene il file sorgente in Assembly `elaborato.s` e il file `elaborato.c`.
- `bin/`: Cartella contenente l'output compilato del programma.
- `obj/`: Cartella contenente i file oggetto generati durante la compilazione.
- `Makefile`: Il Makefile per compilare il progetto.
- `relazione.pdf`: La relazione del progetto, che include le specifiche, il funzionamento della FSM, del database e l'ottimizzazione.

## Come Eseguire il Programma

1. Apri il terminale.
2. Naviga fino alla cartella del progetto:

   cd Desktop/uni/1_anno/architettura\ degli\ elaboratori/asm/asm_elaborato

3. Esegui il comando `make` per compilare il programma:

   make

4. Una volta compilato, esegui il programma con il comando:

   ./bin/elaborato

## Dettagli di Compilazione

- Il Makefile compila il file sorgente `elaborato.s` in un file oggetto, quindi collega il file oggetto per creare l'eseguibile `elaborato`.
- Il comando `make` esegue tutte le operazioni di compilazione automaticamente.

## Pulizia

Per rimuovere i file generati (file oggetto e binari), esegui:

make clean
