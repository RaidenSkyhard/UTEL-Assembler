;Universidad UTEL
;Ejercicio 1 de la Semana #2
;Lenguaje Ensamblador
;Israel González Bejarano

;Codigo para mostrar un Hola Mundo
;NOTA: Código escrito en Visual Studio Code para posteriormente ser compilado en el emulador emu8086

.model small            ;definimos un modelo pequeño

.stack 100h             ;segmento de pila de 256 posiciones

CR EQU 13               ;retorno de carro
LF EQU 10               ; nueva línea

;*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
.data
    texto db LF,LF,CR,"Hola mundo, este es un programa en ensamblador$"      ;texto que se va a mostrar en pantalla con los saltos de línea correspondientes

;*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
.code                   ;inicia código del programa en donde se van a indicar todos los movimientos

    mov ax,@data        ;carga la dirección del segmento datos
    mov ds,ax           ;carga la dirección en el segmento de datos
    lea dx,texto        ;carga el texto

    mov ah,9            ;imprime en pantalla el texto
    int 21h             ;llamada al sistema operativo

    mov ah,4ch          ;función 4ch que devuelve un código de retorno para el programa padre
    int 21h

end