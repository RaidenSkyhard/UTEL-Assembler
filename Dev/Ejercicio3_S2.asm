;Universidad UTEL
;Ejercicio 3 de la Semana #2
;Lenguaje Ensamblador
;Israel González Bejarano

;Codigo para realizar operaciones de movimientos de datos
;NOTA: Código escrito en Visual Studio Code para posteriormente ser compilado en el emulador emu8086

.model small            ;definimos un modelo pequeño

.stack 100h             ;segmento de pila de 256 posiciones

;*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
;Constantes
Quince EQU 15
Cero EQU 10

;*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
.data
    arreglo1 db 10,20,30,40 ;texto
    texto "UTEL$"
    var db 7

;*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*-*
.code

    ;OPERACIONES DE MOVIMIENTOS DE DATOS

    ;------------Siempre iniciar el segmento de datos-----------------

    mov ax,@data        ;carga la dirección del segmento datos
    mov ds,ax           ;carga la dirección en el segmento de datos


    ;------------Movimiento inmediato-----------------
    mov ah,0ffh         ;cargamos al registro ah el número ff hexadecimal (255 decimal)

    
    ;------------Movimiento de memoria a registro-----------------
    mov al,Quince       ;cargamos al registro al la variable Quince que ya teníamos almacenada en memoria -- al=0Fh(15)


    ;------------Movimiento de registro a registro 8 bits-----------------
    mov bh,al           ;los registros bh y al tienen capacidad de 8 bits, cargamos al registro bh con el contenido del registro al -- bh=0Fh(15)


    ;------------Movimiento de registro a registro 16 bits-----------------
    mov bx,ax           ;los registros bx y ax tienen capacidad de 16 bits o de una palabra, cargamos al registro bx con el contenido del registro ax -- bx=ff0fh (65295)


    ;------------Movimiento de una variable a un registro-----------------
    mov ah,var          ;ah=7h


    ;---Movimiento de un arreglo a registro de la posición 2 del arreglo con valor decimal 30---
    mov arreglo1[3],bh  ;modificación del arreglo

    mov ah,4ch          ;Función 4ch (finalizar)
    int 21h

end