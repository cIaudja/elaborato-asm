# elaborato-asm
Elaborato ASM per il corso di Architettura degli Elaboratori dell'Università di Verona, anno accademico 2022-2023.

Questo progetto riguarda la scrittura di codice Assembly per l'architettura i386 e la gestione della compilazione tramite Makefile. L'obiettivo del progetto è dimostrare l'uso dell'Assembly in un contesto di sviluppo software su architetture a 32 bit.

## Struttura del Progetto

Il progetto è organizzato come segue:

### `src/`
Contiene i file sorgenti del progetto, inclusi:
- `elaborato.s`: Il codice Assembly che implementa la logica principale.
- `elaborato.c`: Un file C utilizzato insieme al codice Assembly per alcune funzionalità.

### `bin/`
Questa cartella conterrà l'eseguibile finale (`elaborato`) dopo la compilazione.

### `obj/`
Questa cartella conterrà i file oggetto generati durante il processo di compilazione.

### `relazione.pdf`
Contiene la documentazione del progetto, inclusi i dettagli sulle specifiche, la progettazione e l'implementazione.

## Come Compilare il Progetto

Per compilare e generare l'eseguibile, segui questi passaggi:

1. Assicurati di avere **GNU Assembler (as)** e **GNU Linker (ld)** installati nel tuo sistema.
2. Esegui il comando `make` nella root della repository per compilare il progetto. Questo genererà il file eseguibile nella cartella `bin/`:

    make

3. Se desideri pulire i file generati (file oggetto e binari), puoi eseguire il comando:

    make clean

## Dettagli del Makefile

Il Makefile contiene le seguenti configurazioni:

- **AS_FLAGS**: Opzioni per l'assembler. L'opzione `--32` indica la modalità a 32 bit, mentre `-gstabs` abilita il supporto per il debug.
- **LD_FLAGS**: Opzioni per il linker. L'opzione `-m elf_i386` specifica che il programma deve essere linkato per l'architettura i386.

### Processi di compilazione:

1. **`as`**: Compila il codice Assembly (`elaborato.s`) in un file oggetto (`elaborato.o`).
2. **`ld`**: Linka il file oggetto per generare l'eseguibile finale (`elaborato`).

## Come Eseguire il Programma

Una volta compilato, il programma eseguibile si troverà nella cartella `bin/` e può essere eseguito con:

    ./bin/elaborato

## Tecnologie Usate

- **Assembly i386**: Linguaggio Assembly per l'architettura a 32 bit.
- **C**: Utilizzato insieme all'Assembly per alcune funzionalità.
- **GNU Make**: Strumento per automatizzare la compilazione.
- **GNU Assembler (as)**: Assembler per il codice Assembly.
- **GNU Linker (ld)**: Linker per il codice compilato.

## Documentazione

La documentazione del progetto è inclusa nel file **relazione.pdf**, che descrive:

- Le specifiche del progetto.
- Il funzionamento del codice Assembly.
- Dettagli sull'implementazione e ottimizzazione.
