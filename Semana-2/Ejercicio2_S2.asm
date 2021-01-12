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
    mov ah,5            ;colocamos el número 5 dentro de ah -- ah=5
    add ah,2            ;le sumamos a ah 2 -- ah=ah+2=7
    mov bl,Quince       ;Le asignamos a bl el valor de Quince -- bl=15(ofh)
    add ah,bl           ;sumamos el valor de ah con el de bl -- ah=ah+bl=22(16h)
    ;NOTA: El valor 0Fh está compuesto en hexadecimal
 

    ;*-*-*-Suma de 16 bits*-*-*-
    mov ax,10h          ;asignamos el valor de 10h(16 decimal) al registro ax -- ax=0010h
    add ax,0F0h         ;al registro ax le sumamos F0(240 decimal) -- ax=ax+F0h=0100h(256 decimal)
    mov bx,Quince       ;asignamos el valor de la variable Quince al registro bx -- bx=15
    add ax,bx           ;realizamos la suma del registro ax y bx -- ax=ah+bl=010Fh (271 decimal)


    ;*-*-*-Resta de 8 bits*-*-*-
    mov ah,100          ;Asignamos al registro ah el valor de 100 (64 en hexadecimal) -- ah=100(64h)
    sub ah,55           ;Restamos a ah el valor de 55 y nos da como resultado 45(2D hexadecimal) -- ah=ah-55=45(2Dh)
    mov bl,Quince       ;Asignamos al registro bl el valor de la variable 15 (F en hexadecimal) -- bl=15(0Fh)
    sub ah,bl           ;Restamos al registro ah el registro bl y nos da como resultado 30 (1E en hexadecimal) ah=ah-bl=30(1Eh)


    ;*-*-*-Resta de 16 bits*-*-*-
    mov ax,200h         ;asignamos al registro ax el valor de 200 hexadecimal (512 decimal) -- ax=0200h
    sub ax,0F0h        ;a ax le restamos el valor de F0 hexadecimal (240 decimal) lo que nos da como resultado 101 hexadecimal (272 decimal) -- ah=ah-F0h=0110h
    mov bx,Quince       ;asignamos el valor de la variable Quince al registro bx -- bx=15(0Fh)
    sub ax,bx           ;restamos al registro ax el valor del registro bx y nos da como resultado 101 hexadecimal (257 decimal) -- ah=ah-bl=0101h


    ;*-*-*-Multiplicación de 8 bits*-*-*-
    mov al,Quince       ;Se coloca el valor de la variable Quince en al, ya que siempre debe estar en al el valor a multiplicar -- al=0Fh(15)
    mov cl,3            ;asignamos al registro cl el valor por el cual se multiplicará el registro al -- cl=3
    mul cl              ;El resultado de la multiplicación siempre se muestra en la variable ax -- ax=2Dh(45)


    ;*-*-*-Multiplicación de 16 bits*-*-*-
    mov ax,Quince;      ;asignamos el valor de la variable 15 al registro axax=0fh(15)
    mov cx,1000;        ;asignamos a cx el valor por el cual se multiplicará la variable ax -- cx=1000
    mul cx              ;el valor de la variable seleccionada siempre se multiplicará por ax, y el resultado se almacenará en dx y parte de cx ya que puede ser un número muy extenso -- [dx ax]=0000 3A98h(15000)


    mov ah,4ch
    INT 21h

end