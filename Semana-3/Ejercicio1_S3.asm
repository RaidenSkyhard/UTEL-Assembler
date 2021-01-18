;Universidad UTEL
;Ejercicio 1 de la Semana #3
;Lenguaje Ensamblador
;Israel González Bejarano

;Codigo para llenar un arreglo
;NOTA: Código escrito en Visual Studio Code para posteriormente ser compilado en el emulador emu8086

.model small

.stack 100h

cr equ 13

lf equ 10

.data

    texto1 db 'Datos y ciclos $'            ;Texto
    cadena db 'Esta es una cadena$'
    arreglo db 10 dup(0)                    ;Arreglo de 10 posiciones relleno de ceros
    opcion db 'x'                           ;Variable opción inicializada con letra 'x'
    casilla: db ?                           ;Variable casilla sin inicializar
    pos db 0,0                              ;Arreglo Pos de dos elementos inicializada en [0,0]

.code

    mov ax,@data
    mov ds,ax
    lea dx,texto1
    
    mov ah,9h                               ;Servicio de impresión en pantalla
    int 21h                                 ;Llamada al sistema operativo

    ;------------AQUI INICIAMOS EL PROGRAMA---------

    ;------------LLENAR EL ARREFLO CON FFh----------

    mov cx,10                               ;10 ciclos (tamaño de arreglo)
    lea di,arreglo                          ;obtiene la dirección de arreglo (apunta al primer elemento)
    mov ah,0FFh                             ;valor
    

    llenandoFF:                             ;Inicio del lazo llenadoFF

        mov [di],ah                         ;poner valor en la posición actual
        inc di                              ;mover di a la siguiente posición
        LOOP llenandoFF                     ;repetir desde llenandoFF

        ;--------LLENAR EL ARREGLO CON VALORES-----

        mov cx,10                           ;10 ciclos(tamaño de arreglo
        lea di,arreglo                      ;obtiene la dirección de arreglo (apunta al primer elemento)
        mov ah,0h                           ;valor inicial
    

    llenando:                               ;inicio del lazo llenado

        mov [di],ah                         ;poner valor en la posición actual
        inc di                              ;mover di a la siguiente posición
        inc ah
        LOOP llenandoFF                     ;repetir desde llenando

        ;------LLENAR EL ARREGLO CON VALORES DE OTRO ARREGLO------
        ;------COPIA LOS PRIMEROS 10 CARACTERES DE cadena EN arreglo------

        MOV CX,10                           ;10 ciclos (tamaño de arreglo)
        lea di,arreglo                      ;obtiene la dirección de arreglo (destino de los datos)
        lea si,cadena                       ;obtiene la dirección de cadena (fuente de los datos)


    pasando:                                ;inicio del lazo pasando

        mov ah,[si]                         ;copiar en AH el valor cadena en la posición actual
        mov [di],ah                         ;poner valor en la posición actual
        inc di                              ;mover di a la siguiente posición
        inc si                              ;mover si a la siguiente posición
        LOOP pasando                        ;repetir desde pasando
    

    ;------------AQUI TERMINAMOS EL PROGRAMA---------

    mov ax,4C00h                            ;función 4ch
    int 21h
    
end