#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#define N 8

int main(int num_arg, char **argvector)
{
    const int ACCESO = 1;
    
    char spostamento_menu[64];
    int spostamento_menu_int = 1;

    int num_voci_menu = 6;
    int selezionato = 1;

    char *voci_menu[8] = {"Setting Automobile", "Data: ", "Ora: ", "Blocco automatico porte: ", "Back-home: ", "Check olio ", "Frecce direzione ", "Reset pressione gomme "};
    char *valori_menu[8] = {"\n", "15/06/2014\n", "15:32\n", "ON\n", "ON\n", "\n", "\n", "\n"};
    
    char num_lampeggi = '3';

    //controllo supervisore
    if(num_arg>1){ 
        if(strcmp(argvector[1],"2244") == 0) 
        {    
            num_voci_menu=8;
            voci_menu[0] = "Setting Automobile (supervisor)";
        }
        else
        {
            num_voci_menu=6;
        }
    }
    else
    {
        num_voci_menu=6;
    }

    do{
        //stampa menu
        printf("\e[1;1H\e[2J");

        printf("%s", voci_menu[0]);
        printf("%s", valori_menu[0]);
        printf(" > ");
        printf("%s", voci_menu[selezionato]);
        printf("%s", valori_menu[selezionato]);

        //scanf frecce spostamento menu
        fgets(spostamento_menu, 10, stdin);
        if(spostamento_menu[3] == 10){
            switch(spostamento_menu[2])
            {
                case 65: //freccia su 
                    if(selezionato == 1) selezionato = num_voci_menu - 1;
                    else selezionato --;
                    break;
                case 66: //freccia giù 
                    if(selezionato == num_voci_menu - 1) selezionato = 1;
                    else selezionato ++;
                    break;
                case 67: //freccia destra
                    if(selezionato == 4 - 1 || selezionato == 5 - 1)
                    {
                        do{
                            printf("\e[1;1H\e[2J");
                            printf("%s", voci_menu[selezionato]);
                            printf("%s", valori_menu[selezionato]);
                            printf("Premi freccia su per ON e freccia giù per OFF, o invio per torare al menu\n");
                            fgets(spostamento_menu, 10, stdin);
                            if(spostamento_menu[2] == 65) valori_menu[selezionato] = "ON\n";
                            else if(spostamento_menu[2] == 66) valori_menu[selezionato] = "OFF\n";
                        }while(spostamento_menu[0] != 10);
                    }
                    else if(selezionato == 7 - 1)
                    {
                        do{
                            printf("\e[1;1H\e[2J");
                            printf("%s", voci_menu[selezionato]);
                            printf("%s", valori_menu[selezionato]);
                            printf("Numero di lampeggi attuali: %c\n", num_lampeggi);
                            printf("Inserisci il numero di lamoeggi desiderato (2 min, 5 max), o invio per tornare al menu principale\n");
                            fgets(spostamento_menu, 10, stdin);
                            spostamento_menu_int = atoi(spostamento_menu);
                            if(spostamento_menu_int <= 2) num_lampeggi = '2';
                            else if (spostamento_menu_int == 3) num_lampeggi = '3';
                            else if (spostamento_menu_int == 4) num_lampeggi = '4';
                            else if (spostamento_menu_int >= 5) num_lampeggi = '5';
                        }while(spostamento_menu[0] != 10);
                    }
                    else if(selezionato == 8 - 1)
                    {
                        do{
                            printf("\e[1;1H\e[2J");
                            printf("%s", voci_menu[selezionato]);
                            printf("%s", valori_menu[selezionato]);
                            printf("Premi freccia a destra per resettare la pressione delle gomme, o invio per tornare al menu\n");
                            fgets(spostamento_menu, 10, stdin);  
                            if(spostamento_menu[2] == 67)
                            {
                                printf("\e[1;1H\e[2J");
                                printf("Pressione gomme resettata\n");
                                sleep(1);
                                break;
                            }
                        }while(spostamento_menu[0] != 10);
                    }
            }
        }
    }while(ACCESO);
        

    return 0;
}