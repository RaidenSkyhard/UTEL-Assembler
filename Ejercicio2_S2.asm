;Universidad UTEL
;Ejercicio 2 de la Semana #2
;Lenguaje Ensamblador
;Israel González Bejarano

;Codigo para hacer operaciones aritméticas
;NOTA: Código escrito en Visual Studio Code para posteriormente ser compilado en el emulador emu8086

.model small            ;definimos un modelo pequeño

.stack 100h             ;segmento de pila de 256 posiciones

;*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;Constantes
Quince EQU 15
Cero EQU 0

;*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
.data
    texto db "Universidad UTEL$"      ;texto que se va a mostrar en pantalla

;*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
.code                   ;inicia código del programa

    ;operaciones aritméticas

    ;siempre iniciar el segmento de datos
    mov ax,@data        ;cargamos el apuntodor en ax
    mov ds,ax           ;segmento de datos en AX

    ;*-*-*-Suma de 8 bits*-*-*-
    mov ah,5            ;colocamos el número 5 dentro de ah - ah=5
    add ah,2            ;le sumamos a ah 2 - ah=ah+2=7
    mov bl,Quince       ;Le asignamos a bl el valor de Quince - bl=15(ofh)
    add ah,bl           ;sumamos el valor de ah con el de bl - ah=ah+bl=22(16h)

    ;NOTA: El valor 0Fh está compuesto en hexadecimal

    ;*-*-*-Suma de 16 bits*-*-*-
    mov ax,10h          ;ax=0010h
    add ax,0F0h         ;ax=ax+F0h=0100h
    mov bx,Quince       ;bx=15
    add ax,bx           ;ax=ah+bl=010Fh




end